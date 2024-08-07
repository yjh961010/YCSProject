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
    private Long amount;
    @NonNull
    private String orderName;

    private String mySuccessUrl;
    private String myFailUrl;



}
