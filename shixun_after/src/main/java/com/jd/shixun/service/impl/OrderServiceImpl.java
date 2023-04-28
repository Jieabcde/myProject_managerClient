package com.jd.shixun.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jd.shixun.dto.OrdersDto;
import com.jd.shixun.entity.OrderDetail;
import com.jd.shixun.entity.OrderLog;
import com.jd.shixun.entity.Orders;
import com.jd.shixun.mapper.OrderMapper;
import com.jd.shixun.service.LogcompanyService;
import com.jd.shixun.service.OrderDetailService;
import com.jd.shixun.service.OrderLogService;
import com.jd.shixun.service.OrderService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Orders> implements OrderService {
    @Autowired
    private OrderDetailService orderDetailService; //详细订单

    @Autowired
    private LogcompanyService logcompanyService; //物流分类

    @Autowired
    private OrderLogService orderLogService; //物流订单


    /**
     * 查询ID进行 编辑订单回显
     */
    @Override
    public OrdersDto getByIdWithOrdersDto(Long oid) {
        Orders orders = this.getById(oid);
        OrdersDto ordersDto = new OrdersDto();
        //进行拷贝，拷贝完还缺详细订单 物流单号ID，和物流单号的分类ID
        BeanUtils.copyProperties(orders, ordersDto);

        //构造 详细订单构造器
        LambdaQueryWrapper<OrderDetail> orderDetailLambdaQueryWrapper = new LambdaQueryWrapper<>();
        orderDetailLambdaQueryWrapper.eq(OrderDetail::getOid, orders.getOid());
        List<OrderDetail> orderDetailList = orderDetailService.list(orderDetailLambdaQueryWrapper);

        //得到对象的详情信息后，向ordersDto赋值
        ordersDto.setOrderDetails(orderDetailList);

        //此时ordersDto 还差物流单号 物流单号的分类
        LambdaQueryWrapper<OrderLog> orderLogLambdaQueryWrapper = new LambdaQueryWrapper<>();
        orderLogLambdaQueryWrapper.eq(OrderLog::getOid, orders.getOid());
        //得到对象的物理订单对象
        OrderLog orderLog = orderLogService.getOne(orderLogLambdaQueryWrapper);
        //向ordersDto赋值
        ordersDto.setLogid(orderLog.getLogid());
        ordersDto.setLogcompanyId(orderLog.getLogcompanyId());

        //此时orderDto全部复制完毕
        return ordersDto;



    }


    /**
     * 修改订单信息
     * @param ordersDto
     */
    @Override
    @Transactional //设计多表，开启事务注解
    public void updateWithOrdersDto(OrdersDto ordersDto) {
        //先更新订单表
        LambdaQueryWrapper<Orders> ordersLambdaQueryWrapper = new LambdaQueryWrapper<>();
        ordersLambdaQueryWrapper.eq(Orders::getUid, ordersDto.getUid())
                .eq(Orders::getOid, ordersDto.getOid());
        this.update(ordersDto,ordersLambdaQueryWrapper);

        //更新订单详情
        List<OrderDetail> orderDetails = ordersDto.getOrderDetails();
        //排他思想
        LambdaQueryWrapper<OrderDetail> orderDetailLambdaQueryWrapper = new LambdaQueryWrapper<>();
        orderDetailLambdaQueryWrapper.eq(OrderDetail::getOid, ordersDto.getOid());
        orderDetailService.remove(orderDetailLambdaQueryWrapper);
        for (OrderDetail o : orderDetails) {
            o.setId(null);
            //判断当前商品的数量是不是为0，为0就不保存
            if (o.getNumber()!=0) {
                orderDetailService.save(o);
            }
        }

        //更新物流
        Integer logcompanyId = ordersDto.getLogcompanyId();
        Long logid = ordersDto.getLogid();
        LambdaQueryWrapper<OrderLog> orderLogLambdaQueryWrapper = new LambdaQueryWrapper<>();
        //排他思想
        orderLogLambdaQueryWrapper.eq(OrderLog::getOid, ordersDto.getOid());
        orderLogService.remove(orderLogLambdaQueryWrapper);
        OrderLog orderLog = new OrderLog();
        orderLog.setLogid(ordersDto.getLogid());
        orderLog.setLogcompanyId(logcompanyId);
        orderLog.setOid(ordersDto.getOid());
        orderLogService.save(orderLog);

    }

    @Override
    public List<Integer> getMonthOrder() {
        //arr[今日支付订单，今日未支付订单，本月支付订单，本月未支付订单]
        List<Integer> list = new ArrayList<>();
        Integer successOrderToday = baseMapper.getSuccessOrderToday();
        Integer failOrderToday = baseMapper.getFailOrderToday();
        Integer successOrderMonth = baseMapper.getSuccessOrderMonth();
        Integer failOrderMonth = baseMapper.getFailOrderMonth();
        list.add(successOrderToday);
        list.add(failOrderToday);
        list.add(successOrderMonth);
        list.add(failOrderMonth);
        return list;
    }

    @Override
    public List<BigDecimal> getMonthOrderMoney() {
        //list[今日入账，本月入账]
        List<BigDecimal> list = new ArrayList<>();
        BigDecimal moneyMonth = baseMapper.getMoneyMonth();
        BigDecimal moneyToday = baseMapper.getMoneyToday();
        list.add(moneyToday);
        list.add(moneyMonth);
        return list;
    }
}
