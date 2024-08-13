package com.example.neoheulge.payments.service;

import com.example.neoheulge.payments.config.TossPaymentConfig;
import com.example.neoheulge.payments.dto.request.PaymentApproveRequestDTO;
import com.example.neoheulge.payments.dto.request.PaymentsRequestDTO;
import com.example.neoheulge.payments.dto.response.PaymentResponseDTO;
import com.example.neoheulge.payments.dto.response.SuccessDTO;
import com.example.neoheulge.payments.entity.Payments;
import com.example.neoheulge.payments.repository.PaymentRepository;
import com.example.neoheulge.payments.util.TossPaymentAuthUtil;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PaymentService {





    private final PaymentRepository paymentRepository;
    private final TossPaymentConfig tossPaymentConfig;
    private final TossPaymentAuthUtil tossPaymentAuthUtil;
    private final RestTemplate restTemplate;

    public PaymentResponseDTO createPaymentRequest(PaymentsRequestDTO request) {
        Payments payment = request.toEntity();
        payment = paymentRepository.save(payment);

        Map<String, Object> tossRequest = new HashMap<>();
        tossRequest.put("amount", payment.getAmount());
        tossRequest.put("orderId", payment.getOrderId());
        tossRequest.put("orderName", payment.getOrderName());
        tossRequest.put("successUrl", request.getMySuccessUrl() != null ? request.getMySuccessUrl() : tossPaymentConfig.getSuccessUrl());
        tossRequest.put("failUrl", request.getMyFailUrl() != null ? request.getMyFailUrl() : tossPaymentConfig.getFailUrl());
        tossRequest.put("method", request.getPayType());

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
        headers.set("Authorization", tossPaymentAuthUtil.getBasicAuthHeader());

        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(tossRequest, headers);

        PaymentResponseDTO response = restTemplate.exchange(
                TossPaymentConfig.URL,
                HttpMethod.POST,
                entity,
                PaymentResponseDTO.class
        ).getBody();



        return response;
      }


    @Transactional
    public PaymentResponseDTO approvePayment(String paymentKey, String orderId, Long amount) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
        headers.set("Authorization", tossPaymentAuthUtil.getBasicAuthHeader());

        Map<String, Object> requestBody = new HashMap<>();
        requestBody.put("orderId", orderId);
        requestBody.put("amount", amount);

        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(requestBody, headers);

        PaymentResponseDTO response = restTemplate.exchange(
                TossPaymentConfig.URL + "/" + paymentKey,
                HttpMethod.POST,
                entity,
                PaymentResponseDTO.class
        ).getBody();

        // Update payment status
        Payments payment = paymentRepository.findByOrderId(orderId)
                .orElseThrow(() -> new RuntimeException("Payment not found"));
        payment.setSuccessYN(true);
        paymentRepository.save(payment);

        return response;
    }

    @Transactional
    public PaymentResponseDTO getPayment(SuccessDTO successDTO) {

        paymentRepository.findByOrderId(successDTO.getOrderId())
                .orElseThrow(() -> new RuntimeException("주문 정보를 찾을 수 없습니다. " + successDTO.getOrderId()));

        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
        headers.set("Authorization", tossPaymentAuthUtil.getBasicAuthHeader());

        HttpEntity<String> entity = new HttpEntity<>(headers);

        return restTemplate.exchange(
                TossPaymentConfig.URL + "/" + successDTO.getPaymentKey(),
                HttpMethod.GET,
                entity,
                PaymentResponseDTO.class
        ).getBody();
     }
    }

