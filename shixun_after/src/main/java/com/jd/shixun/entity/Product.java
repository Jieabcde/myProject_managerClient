package com.jd.shixun.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.afterturn.easypoi.excel.annotation.ExcelTarget;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.math.BigDecimal;

@Data
public class Product {
    @TableId(value = "pid")
    private Integer pid;

    private Integer kid;

    @Excel(name="商品",orderNum = "0",width = 25.0)
    private String pname;//商品名字

    @Excel(name="商品状态",replace = {"上架_1","下架_0"},width = 25.0)
    private Integer pstatus;//商品状态  1上线  0下架

//    @Excel(name="促销")
    private BigDecimal psales;//是否促销 1促销 0不促销

    @Excel(name="库存",width = 25.0)
    private Integer pstock;//库存

    private Long pmonthsale;//月销量

    private String pmoreinfo;//详细信息

//    private Integer giftid;//捆绑商品

    @Excel(name = "单价",width = 25.0)
    private BigDecimal price;//单价

    @Excel(name = "图片",width = 10,type = 2,imageType = 1) //type2为图片类型
    private String image;//图片路径

    private Integer integral; //积分

}
