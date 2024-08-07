package com.example.neoheulge.payments.dto.request;


import com.example.neoheulge.payments.entity.Payments;
import lombok.*;

import java.util.UUID;

@Builder
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class PaymentsRequestDTO {

    @NonNull
    private String payType;
    @NonNull
    private String currency;
    @NonNull
    private Long amount;
    @NonNull
    private String orderName;

    private String mySuccessUrl;
    private String myFailUrl;

    @Override
    public String toString() {
        return "PaymentsRequestDTO{" +
                "payType='" + payType + '\'' +
                ", currency='" + currency + '\'' +
                ", amount=" + amount +
                ", orderName='" + orderName + '\'' +
                ", mySuccessUrl='" + mySuccessUrl + '\'' +
                ", myFailUrl='" + myFailUrl + '\'' +
                '}';
    }
}
