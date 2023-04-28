package com.jd.shixun.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jd.shixun.entity.Orders;
import org.apache.ibatis.annotations.Mapper;

import java.math.BigDecimal;

@Mapper
public interface OrderMapper extends BaseMapper<Orders> {
    //获取当日成功订单
    Integer getSuccessOrderToday();

    //获取当日失败订单
    Integer getFailOrderToday();

    //获取当月成功订单
    Integer getSuccessOrderMonth();

    //获取当月失败订单
    Integer getFailOrderMonth();

    //获取今日入账
    BigDecimal getMoneyToday();

    //获取本月入账
    BigDecimal getMoneyMonth();

}
