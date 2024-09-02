package com.example.neoheulge.util;

import java.util.List;
import java.util.Map;
import org.springframework.retry.annotation.Backoff;
import org.springframework.retry.annotation.Recover;
import org.springframework.retry.annotation.Retryable;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.neoheulge.product.service.ProductService;
import com.example.neoheulge.purproduct.service.PurproductService;
import com.example.neoheulge.admin.service.AdminDAO;
import com.example.neoheulge.util.NotificationService;

@Service
public class retryService {
	

	    @Autowired
	    PurproductService purproductService;

	    @Autowired
	    ProductService productService;

	    @Autowired
	    private SchedulerService schedulerService;

	    @Autowired
	    private AdminDAO admindao;
	    
	    @Autowired
	    private NotificationService notificationService;

    @Retryable(
        retryFor =  { Exception.class },
        maxAttempts = 3,
        backoff = @Backoff(delay = 5000, multiplier = 1.5)
        //- delay: 지연 시간 (ms) maxDelay: 최대 지연 시간 
        //multiplier: 재시도마다 delay * multiplier만큼 지연 시간 추가


    )
    public void scheduleAutoPayments(List<Map<String, Object>> members) {
        schedulerService.scheduleAutoPayments(members);
    }

    @Recover
    public void recoverAutoPayments(Exception e) {
        notificationService.sendErrorNotification("Scheduler Error after retries: schedulePayments", e.getMessage());
      
    }

    @Retryable(
    		retryFor = { Exception.class },
            maxAttempts = 3,
            backoff = @Backoff(delay = 5000, multiplier = 1.5)
        )
    public void applyInterestRates(List<Map<String, Object>> members) {
        schedulerService.applyInterestRates(members);
    }

    @Recover
    public void recoverInterestRates(Exception e) {
        notificationService.sendErrorNotification("Scheduler Error after retries: applyMonthlyInterest", e.getMessage());
       
    }

    @Retryable(
    	retryFor = { Exception.class },
        maxAttempts = 3,
        backoff = @Backoff(delay = 5000, multiplier = 1.5)
    )
    public void updateProductStatus() {
    	 productService.updateProductStatus();
    }

    @Recover
    public void recoverUpdateProductStatus(Exception e) {
        notificationService.sendErrorNotification("Scheduler Error after retries: updateExpiredProductsStatus", e.getMessage());
        
    }

    @Retryable(
    	retryFor = { Exception.class },
        maxAttempts = 3,
        backoff = @Backoff(delay = 5000, multiplier = 1.5)
    )
    public void deleteExpiredProducts() {
        admindao.deleteExpried();
    }

    @Recover
    public void recoverDeleteExpiredProducts(Exception e) {
        notificationService.sendErrorNotification("Scheduler Error after retries: deleteExpiredProduct", e.getMessage());
        
    }
}
