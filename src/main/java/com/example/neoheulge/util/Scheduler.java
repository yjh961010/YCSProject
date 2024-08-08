package com.example.neoheulge.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.example.neoheulge.purproduct.service.PurproductService;

@Component
public class Scheduler {
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	PurproductService purproductService;
	
    @Autowired
    private SchedulerService schedulerService;

    @Scheduled(cron = "0 0 0 * * *") // 매일 자정에 실행
    public void schedulePayments() {
        List<Map<String, Object>> members = purproductService.getActiveAuto();
        schedulerService.scheduleAutoPayments(members);
    }
}

/*
 * 첫 번째 * 부터 
 * 초(0-59) 
 * 분(0-59) 
 * 시간(0-23) 
 * 일(1-31) 
 * 월(1-12) 
 * 요일(0-6) (0: 일, 1: 월, 2:화, 3:수, 4:목, 5:금, 6:토)
 */
