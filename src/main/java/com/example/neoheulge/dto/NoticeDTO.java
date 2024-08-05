package com.example.neoheulge.dto;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeDTO {
    private int id;
    private String title;
    private String author;
    private String content;
    private int views;
    private Date createTime;
}
