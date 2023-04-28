package com.jd.shixun.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jd.shixun.entity.OrderLog;
import com.jd.shixun.mapper.OrderLogMapper;
import com.jd.shixun.service.OrderLogService;
import org.springframework.stereotype.Service;

@Service
public class OrderLogServiceImpl  extends ServiceImpl<OrderLogMapper, OrderLog> implements OrderLogService {
}
