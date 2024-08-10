package com.example.neoheulge.payments.controller;


import com.example.neoheulge.payments.config.TossPaymentConfig;
import com.example.neoheulge.payments.dto.request.PaymentsRequestDTO;
import com.example.neoheulge.payments.dto.response.PaymentResponseDTO;
import com.example.neoheulge.payments.service.PaymentService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@Validated
@RequestMapping("/api/v1/payments")
@RequiredArgsConstructor
public class TossPaymentController {


    private final PaymentService paymentService;


    @PostMapping("/confirm")
    public ResponseEntity<?> confirmPayment(@Valid @RequestBody PaymentService request) {

        return paymentService.confirmPayment(request);
    }
}
