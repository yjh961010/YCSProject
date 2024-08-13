package com.example.neoheulge.payments.controller;


import com.example.neoheulge.payments.config.TossPaymentConfig;
import com.example.neoheulge.payments.dto.request.PaymentsRequestDTO;
import com.example.neoheulge.payments.dto.response.PaymentResponseDTO;
import com.example.neoheulge.payments.dto.response.SuccessDTO;
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



    @PostMapping("/request")
    public ResponseEntity<PaymentResponseDTO> requestPayment(@RequestBody PaymentsRequestDTO request) {
        PaymentResponseDTO response = paymentService.createPaymentRequest(request);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/approve/{paymentKey}")
    public ResponseEntity<PaymentResponseDTO> approvePayment(@PathVariable String paymentKey,
                                                             @RequestParam String orderId,
                                                             @RequestParam Long amount) {
        PaymentResponseDTO response = paymentService.approvePayment(paymentKey, orderId, amount);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/{orderId}")
    public ResponseEntity<PaymentResponseDTO> getPayment(@PathVariable SuccessDTO successDTO) {
        PaymentResponseDTO response = paymentService.getPayment(successDTO);
        return ResponseEntity.ok(response);
    }
}
