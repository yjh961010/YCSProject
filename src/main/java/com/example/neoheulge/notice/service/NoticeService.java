package com.example.neoheulge.notice.service;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.example.neoheulge.dto.NoticeDTO;

@Service
public class NoticeService {

    @Autowired
    private SqlSession sqlSession;

    public int insertNotice(NoticeDTO dto) {
        int res = sqlSession.insert("notice.insertNotice", dto);
        return res;
    }
    public int deleteNotice(int id) {
        int res = sqlSession.delete("notice.deleteNotice", id);
        return res;
    }

    public int editNotice(NoticeDTO dto) {
        int res = sqlSession.update("notice.editNotice", dto);
        return res;
    }
}
