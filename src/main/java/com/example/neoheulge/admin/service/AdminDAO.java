package com.example.neoheulge.admin.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.neoheulge.dto.MemberDTO;
@Mapper
public interface AdminDAO {
	List<MemberDTO> memberAll();

}
