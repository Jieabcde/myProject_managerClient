package com.jd.shixun.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jd.shixun.common.R;
import com.jd.shixun.dto.OrdersDto;
import com.jd.shixun.dto.ProductPie;
import com.jd.shixun.entity.Orders;
import com.jd.shixun.service.OrderDetailService;
import com.jd.shixun.service.OrderService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;

@RestController
@RequestMapping("/order")
@Slf4j
public class OrderController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderDetailService orderDetailService;

    /**
     * 查询订单
     */
    @GetMapping("/page")
    public R<Page> showPage(Integer page, Integer pageSize, Long number, String beginTime, String endTime) {
        Page<Orders> ordersPage = new Page(page, pageSize);

        LambdaQueryWrapper<Orders> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(number != null, Orders::getOid, number)
                .gt(beginTime != null, Orders::getOrderTime, beginTime)
                .lt(endTime != null, Orders::getOrderTime, endTime);

        orderService.page(ordersPage, queryWrapper);
//        orderService.list(null);
        return R.success(ordersPage);
    }


    /**
     * 查询ID进行 编辑订单回显
     */
    @GetMapping("/{id}")
    public R<OrdersDto> getById(@PathVariable("id") Long oid){
        OrdersDto ordersDto = orderService.getByIdWithOrdersDto(oid);
        return R.success(ordersDto);
    }

    /**
     * 修改订单
     */
    @PutMapping
    public R<String> update(@RequestBody OrdersDto ordersDto) {
        orderService.updateWithOrdersDto(ordersDto);
        return R.success("修改订单成功");
    }


    /**
     * 获取月订单
     */
    @GetMapping("/getMonthOrder")
    public R getMonthOrder() {
        List<Integer> list = orderService.getMonthOrder();
        return R.success(list);
    }
    /**
     * 获取月利润
     */
    @GetMapping("/getMonthOrderMoney")
    public R getMonthOrderMoney() {
        List<BigDecimal> list = orderService.getMonthOrderMoney();
        return R.success(list);
    }
}
