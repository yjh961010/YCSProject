package com.example.neoheulge.util;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.neoheulge.purproduct.service.PurproductService;

@Service
public class SchedulerService {

    @Autowired
    private PurproductService purproductService;

    public void scheduleAutoPayments(List<Map<String, Object>> members) {
        LocalDate today = LocalDate.now();
        for (Map<String, Object> member : members) {
            String autoCycle = (String) member.get("auto_cycle");
            String autoDateStr = (String) member.get("auto_date"); // 사용자 입력 날짜 (예: "17")
            
            // 날짜를 정수로 변환하고 해당 날짜의 요일을 추출
            int autoDateDay = Integer.parseInt(autoDateStr);
            LocalDate autoDate = LocalDate.of(today.getYear(), today.getMonth(), autoDateDay);
            DayOfWeek autoDateDayOfWeek = autoDate.getDayOfWeek();

            if (shouldProcessPayment(today, autoDateDayOfWeek, autoCycle)) {
                processPayment(member);
            }
        }
    }

    private boolean shouldProcessPayment(LocalDate today, DayOfWeek autoDateDayOfWeek, String autoCycle) {
        switch (autoCycle) {
            case "매일":
                return true; // 매일 실행되므로 항상 true
            case "매주":
                return today.getDayOfWeek().equals(autoDateDayOfWeek); // 오늘 요일과 자동 결제 요일이 같은지 확인
            case "매달":
                return today.getDayOfMonth() == autoDateDayOfWeek.getValue(); // 현재 일이 자동 결제 설정일과 같을 때
            default:
                return false;
        }
    }

    private void processPayment(Map<String, Object> member) {
        // 결제 처리 로직
    	double autoAmount = ((Number) member.get("auto_amount")).doubleValue();
        String autoCycle = (String) member.get("auto_cycle");
        double additionalAmount = 0;
        
        switch (autoCycle) {
	        case "매일":
	            additionalAmount = autoAmount;
	            break;
	        case "매주":
	            additionalAmount = autoAmount;
	            break;
	        case "매달":
	            additionalAmount = autoAmount;
	            break;
	    }
        
        if (additionalAmount > 0) {
            Map<String, Object> params = new HashMap<>();
            params.put("member_id", member.get("member_id"));
            params.put("product_code", member.get("product_code"));
            params.put("additionalAmount", additionalAmount);

            System.out.println("추가금 넣기 실행: " + params);
            purproductService.addAdditionalAmount(params);

        }
        
        //결제 처리 로그
        System.out.println("Processing payment for: " + member);
    }
}