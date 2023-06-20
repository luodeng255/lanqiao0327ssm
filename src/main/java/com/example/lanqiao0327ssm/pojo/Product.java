package com.example.lanqiao0327ssm.pojo;

import lombok.Data;

@Data
public class Product {

    private int productId;
    private String productName;
    private int categoryId;
    private String productTitle;
    private String productIntro;
    private String productPicture;
    private Double productPrice;
    private Double productSellingPrice;
    private int productNum;
    private int productSales;

    private  Category category;
}
