package com.example.neoheulge.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.stereotype.Service;

import com.example.neoheulge.purproduct.service.PurproductService;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ScheduledFuture;

@Service
public class SchedulerService {

    @Autowired
    private TaskScheduler taskScheduler;

	@Autowired
	PurproductService purproductService;

    private ScheduledFuture<?> scheduledFuture;

    public void scheduleAutoPayments(List<Map<String, Object>> members) {
        for (Map<String, Object> member : members) {
            String autoDateStr = (String) member.get("auto_date");
            LocalDateTime autoDate = LocalDateTime.parse(autoDateStr); // 날짜 형식에 맞게 파싱

            Runnable task = () -> processPayment(member);
            Date startTime = Date.from(autoDate.atZone(ZoneId.systemDefault()).toInstant());
            scheduledFuture = taskScheduler.schedule(task, startTime);
        }
    }

    private void processPayment(Map<String, Object> member) {
        double autoAmount = ((Number) member.get("auto_amount")).doubleValue();
        String autoCycle = (String) member.get("auto_cycle");
        double additionalAmount = 0;

        switch (autoCycle) {
            case "매일":
                additionalAmount = autoAmount;
                break;
            case "매주":
                additionalAmount = autoAmount / 7;
                break;
            case "매달":
                additionalAmount = autoAmount / 30;
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
    }
}
