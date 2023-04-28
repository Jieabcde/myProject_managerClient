package com.jd.shixun.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.jd.shixun.common.R;
import com.jd.shixun.entity.Logcompany;
import com.jd.shixun.service.LogcompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.lang.invoke.LambdaMetafactory;
import java.util.List;

@RestController
@RequestMapping("/logcompany")
public class LogcompanyController {
    @Autowired
    private LogcompanyService logcompanyService;

    /**
     * 获得物流分类
     */
    @GetMapping("/list")
    public R<List<Logcompany>> list(Logcompany logcompany) {
        List<Logcompany> list = logcompanyService.list(null);
        return R.success(list);
    }
}
