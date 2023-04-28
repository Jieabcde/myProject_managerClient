package com.jd.shixun.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/orderLog")
public class OrderLogController {
    @Autowired
    private OrderLogController orderLogController;

}
