package com.jd.shixun.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jd.shixun.entity.ProductLable;
import com.jd.shixun.mapper.ProductLableMapper;
import com.jd.shixun.service.ProductLableService;
import org.springframework.stereotype.Service;

@Service
public class ProducLableServiceImpl extends ServiceImpl<ProductLableMapper, ProductLable> implements ProductLableService {
}
