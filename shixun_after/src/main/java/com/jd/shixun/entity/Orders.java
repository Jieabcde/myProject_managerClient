package com.jd.shixun.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.afterturn.easypoi.excel.annotation.ExcelTarget;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
public class Orders {
    @TableId(value = "oid", type = IdType.ASSIGN_UUID)
    private Long oid; //订单编号

    private Integer uid; //用户编号

    private Integer addressId;//地址编号

    private BigDecimal oprice;//付款金额

    private LocalDateTime orderTime;//下单时间

    private LocalDateTime checkoutTime;//付款时间

    private Integer ostatus;//订单状态 1待发货  2待付款  3已完成  4已取消

    private String description; //订单备注

    private String userName; // 用户名

    private String addressInfo; //地址信息

    private String phone; //电话

    private String consignee; //收货人


}
