package com.jd.shixun.dto;

import lombok.Data;

@Data
public class ProductPie {
    //分类名
    private String name;

    //销售额
    private Long value;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getValue() {
        return value;
    }

    public void setValue(Long value) {
        this.value = value;
    }

    public ProductPie(String name, Long value) {
        this.name = name;
        this.value = value;
    }

    public ProductPie() {
    }
}
