package com.example.neoheulge.payments.entity;

import com.example.neoheulge.member.entity.Member;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "NEPAYMENT")
public class Payments {

    /**
     * ------ 파라미터 예시-------
     * method: "CARD", // 카드 결제
     * amount: {
     * currency: "KRW",
     * value: 50000,
     * },
     * orderId: "JK1NXAUTfYB2lKDBnYtDo", // 고유 주문번호
     * orderName: "토스 티셔츠 외 2건",
     * successUrl: window.location.origin + "/success", // 결제 요청이 성공하면 리다이렉트되는 URL
     * failUrl: window.location.origin + "/fail", // 결제 요청이 실패하면 리다이렉트되는 URL
     * customerEmail: "customer123@gmail.com",
     * customerName: "김토스",
     * customerMobilePhone: "01012341234",
     **/
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, name = "payment_id", unique = true)
    private Long paymentId;
    @Column(nullable = false, name = "pay_type")
    @Enumerated(EnumType.STRING)
    private final String paymentType = "card";
    @Column(nullable = false, name = "amount")
    private Long amount;
    @Column(nullable = false, name = "order_name")
    private String orderName;
    @Column(nullable = false, name = "order_id")
    private String orderId;
    @Column(nullable = false, name = "customer_name")
    private String customerName;
    @Column(nullable = false, name = "customer_email")
    private String customerEmail;
    @Column(nullable = false, name = "customer_phone")
    private String customerMobilePhone;
    @Column(name = "status")
    private boolean successYN;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "customer_id")
    @JsonIgnore
    private Member customer;
}
