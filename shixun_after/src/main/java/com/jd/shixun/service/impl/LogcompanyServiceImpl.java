package com.jd.shixun.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jd.shixun.entity.Logcompany;
import com.jd.shixun.mapper.LogcompanyMapper;
import com.jd.shixun.service.LogcompanyService;
import org.springframework.stereotype.Service;

@Service
public class LogcompanyServiceImpl extends ServiceImpl<LogcompanyMapper, Logcompany> implements LogcompanyService {
}
