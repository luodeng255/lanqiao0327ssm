package com.example.lanqiao0327ssm.pojo;

import lombok.Data;

@Data
public class SearchBean {
    private Integer productId;
    private String productName;
    private Double minPrice;
    private Double maxPrice;
    private Integer categoryId;


}
