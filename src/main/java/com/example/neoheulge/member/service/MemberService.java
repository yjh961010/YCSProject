package com.example.neoheulge.member.service;

import com.example.neoheulge.member.entity.Member;
import com.example.neoheulge.member.repository.JpaMemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.neoheulge.dto.MemberDTO;

import jakarta.transaction.Transactional;
@Service
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;
	private final PasswordEncoder bcryptPasswordEncoder;
	private final JpaMemberRepository memberRepository;


	public MemberService(PasswordEncoder bcryptPasswordEncoder, JpaMemberRepository memberRepository) {
		this.bcryptPasswordEncoder = bcryptPasswordEncoder;
        this.memberRepository = memberRepository;
    }
	@Transactional
	public int signupPro(MemberDTO member) {
		member.setGrade("ROLE_1");
		member.setPassword(bcryptPasswordEncoder.encode(member.getPassword()));
		return memberDAO.signupPro(member);
	}
	public Member findMember(String UserName) {
		System.out.println("memberRepository = " + memberRepository.findByName(UserName));
		return memberRepository.findByName(UserName)
				.orElseThrow(() -> new RuntimeException("없는 계정입니다."));
	}

	public MemberDTO findByName(String name) {
		return memberDAO.findByName(name);
	}
	
	public MemberDTO findByIdName (MemberDTO member) {
		return memberDAO.findByIdName(member);
	}
	
	public int updatePw(MemberDTO member) {
		member.setPassword(bcryptPasswordEncoder.encode(member.getPassword()));
		return memberDAO.updatePw(member);
	}
	
	public String IdEmail(String member) {
		return memberDAO.IdEmail(member);
	}

}
