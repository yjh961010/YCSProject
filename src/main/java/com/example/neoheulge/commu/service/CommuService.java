package com.example.neoheulge.commu.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.neoheulge.dto.CommuDTO;

@Service
public class CommuService {
	
	@Autowired
	private  SqlSession sqlSession;
	
	public List<CommuDTO> commuList(){
		return sqlSession.selectList("commuList");
	}
	
	public int commuWrite(CommuDTO dto) {
		return sqlSession.insert("commuWrite",dto);
	}
	
	 public void commuNewSetp(int id) {
		 sqlSession.update("commuNewStep",id);
	 }
	 
	 public void commuReStep(int id) {
	     sqlSession.update("commuReStep",id);
	 }
	 
	 public CommuDTO getCommu(int id) {
		 return sqlSession.selectOne("getCommu",id);
	 }
	 
	 public int commuViews(int id) {
			return sqlSession.update("commuViews", id);
		}
	 
	 public int commuDelete(int id) {
		 return sqlSession.delete("commuDelete",id);
	 }
	 
	 public int commuUpdate(CommuDTO dto) {
			return sqlSession.update("commuUpdate", dto);
		}
	 


}
