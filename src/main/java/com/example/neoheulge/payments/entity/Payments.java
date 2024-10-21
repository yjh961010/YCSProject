package com.example.neoheulge.payments.entity;
import com.example.neoheulge.member.entity.Member;
import com.example.neoheulge.payments.dto.PayType;
import com.example.neoheulge.payments.dto.response.PaymentResponseDTO;
import com.example.neoheulge.payments.util.Auditable;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;
@Entity
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Table(name = "NEPAYMENT")
public class Payments extends Auditable { //오라클 11버전에서는 identity지원안함. 수동으로 시퀀스만들어줘야함
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "payment_seq_generator")
    @SequenceGenerator(name = "payment_seq_generator", sequenceName = "payment_seq", allocationSize = 1)
    @Column(nullable = false, name = "payment_id", unique = true)
    private Long paymentId;

    @Column(nullable = false, name = "pay_type")
    @Enumerated(EnumType.STRING)
    private PayType paymentType;

    @Column(nullable = false, name = "amount")
    private Long amount;

    @Column(nullable = false, name = "order_name")
    private String orderName;

    @Column(nullable = false, name = "order_id")
    private String orderId;

    @Column(nullable = true, name = "customer_name")
    private String customerName;

    @Column(nullable = true, name = "customer_email")
    private String customerEmail;

    @Column(nullable = true, name = "customer_mobile_phone")
    private String customerMobilePhone;

    @Column
    private String paymentKey;

    @Column(name = "success_yn")
    private boolean successYN;

    @Column
    private String failReason;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "customer_id")
    @JsonIgnore
    private Member customer;

    public PaymentResponseDTO toPaymentResDto() {
        return PaymentResponseDTO.builder()
                .payType(paymentType.getDescription())
                .amount(amount)
                .orderName(orderName)
                .orderId(orderId)
                .customerEmail(customer.getEmail())
                .customerName(customer.getName())
                .createdAt(String.valueOf(getCreatedAt()))
                .cancelYN(successYN)
                .failReason(failReason)
                .build();
    }
}

/*
 * @Entity
 * 
 * @Getter
 * 
 * @Builder
 * 
 * @NoArgsConstructor
 * 
 * @AllArgsConstructor
 * 
 * @Setter
 * 
 * @Table(name = "NEPAYMENT") public class Payments extends Auditable {
 * 
 * @Id
 * 
 * @GeneratedValue(strategy = GenerationType.IDENTITY)
 * 
 * @Column(nullable = false, name = "payment_id", unique = true) private Long
 * paymentId;
 * 
 * @Column(nullable = false, name = "pay_type")
 * 
 * @Enumerated(EnumType.STRING) private PayType paymentType;
 * 
 * @Column(nullable = false, name = "amount") private Long amount;
 * 
 * @Column(nullable = false, name = "order_name") private String orderName;
 * 
 * @Column(nullable = false, name = "order_id") private String orderId;
 * 
 * @Column(nullable = true, name = "customer_name") private String customerName;
 * 
 * @Column(nullable = true, name = "customer_email") private String
 * customerEmail;
 * 
 * @Column(nullable = true, name = "customer_mobile_phone") private String
 * customerMobilePhone;
 * 
 * @Column private String paymentKey;
 * 
 * @Column(name = "success_yn") private boolean successYN;
 * 
 * @Column private String failReason;
 * 
 * @ManyToOne(fetch = FetchType.LAZY)
 * 
 * @JoinColumn(name = "customer_id")
 * 
 * @JsonIgnore private Member customer;
 * 
 * public PaymentResponseDTO toPaymentResDto() { return
 * PaymentResponseDTO.builder() .payType(paymentType.getDescription())
 * .amount(amount) .orderName(orderName) .orderId(orderId)
 * .customerEmail(customer.getEmail()) .customerName(customer.getName())
 * .createdAt(String.valueOf(getCreatedAt())) .cancelYN(successYN)
 * .failReason(failReason) .build(); } }
 */

