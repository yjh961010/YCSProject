package com.example.neoheulge.payments.dto;

public enum PayType {

    CARD("카드"),
    VIRTUAL_("가상계좌");;

    private String description;

    PayType(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

}
