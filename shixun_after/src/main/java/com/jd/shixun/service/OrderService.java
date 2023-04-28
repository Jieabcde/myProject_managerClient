package com.jd.shixun.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.jd.shixun.dto.OrdersDto;
import com.jd.shixun.entity.Orders;

import java.math.BigDecimal;
import java.util.List;

public interface OrderService extends IService<Orders> {
    /**
     * 查询ID进行 编辑订单回显
     */
    OrdersDto getByIdWithOrdersDto(Long oid);

    /**
     * 修改订单信息
     * @param ordersDto
     */
    void updateWithOrdersDto(OrdersDto ordersDto);

    /**
     * 获取月订单
     * @return
     */
    List<Integer> getMonthOrder();

    List<BigDecimal> getMonthOrderMoney();
}
