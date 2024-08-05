package com.example.neoheulge.admin.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.example.neoheulge.dto.MemberDTO;

@Service
public class AdminService {
	@Autowired
	private AdminDAO admindao;
	

    // 캐시 이름을 'members'로 지정하고, 캐시 키를 자동 생성 (member 테이블에 변동있으면
					//members캐시도 관리해줘야함
    @Cacheable(value = "members", key = "'allMembers'")
    public List<MemberDTO> MemberAll() {
        // 캐시에 데이터가 없으면 데이터베이스에서 조회
        List<MemberDTO> mList = admindao.memberAll();
        return mList;
    }
	

}
