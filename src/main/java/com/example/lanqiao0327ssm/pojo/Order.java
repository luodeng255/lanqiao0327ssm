package com.example.lanqiao0327ssm.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class Order {

    private Integer id;
    private Long orderId;
    private Integer userId;
    private Integer productId;
    private Integer num;
    private double price;
    private Date orderTime;

    private Product product;

    private String  orderTimeStr;
}
