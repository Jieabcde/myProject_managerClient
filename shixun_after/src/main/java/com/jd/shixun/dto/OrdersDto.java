package com.jd.shixun.dto;

import com.jd.shixun.entity.Orders;
import com.jd.shixun.entity.OrderDetail;
import lombok.Data;

import java.util.List;

@Data
public class OrdersDto extends Orders {
    private List<OrderDetail> orderDetails;

    private Long logid; //物流单号

    private Integer logcompanyId; //物流单号的分类
}
