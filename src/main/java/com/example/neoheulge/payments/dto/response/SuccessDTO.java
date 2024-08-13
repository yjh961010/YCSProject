package com.example.neoheulge.payments.dto.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SuccessDTO {
    private String paymentKey;
    private String orderId;
    private Long amount;
}