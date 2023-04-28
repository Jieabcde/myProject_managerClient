package com.jd.shixun.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import org.springframework.beans.factory.annotation.Value;

import java.math.BigDecimal;

@Data
public class OrderDetail {
    @TableId(value = "id")
    private Integer id;

    private String name; //商品名

    private String image;//商品图片

    private Long oid; //订单外键

    private Integer number; //数量

    private BigDecimal amount; //金额

}
