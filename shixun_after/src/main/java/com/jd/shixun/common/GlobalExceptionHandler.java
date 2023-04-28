package com.jd.shixun.common;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.sql.SQLIntegrityConstraintViolationException;

/**
 * 全局异常处理
 */
@ControllerAdvice(annotations = {RestController.class, Controller.class}) //拦截类上加 @RestController和@Controller的
@ResponseBody
@Slf4j
public class GlobalExceptionHandler {

    /**
     * 异常处理方法，应对出现存储重复用户名出现的异常
     */
    //拦截异常，不写括号限制的话默认拦截所有异常
    @ExceptionHandler(SQLIntegrityConstraintViolationException.class)
    public R<String> exceptionHandle(SQLIntegrityConstraintViolationException e) {
        log.error(e.getMessage()); //异常信息
        //判断异常信息是否有次关键字，来给予对应提示  Duplicate entry 重复信息
        //Duplicate entry 'zhangsan' for key 'idx_username'       zhangsan对应split[2]，因为按空格分隔字符串
        if (e.getMessage().contains("Duplicate entry")) {
            String[] split = e.getMessage().split(" "); //将字符串拆分成字符串数组
            String msg = split[2] + "已存在";
            return R.error(msg);
        }
        e.printStackTrace();//控制台写异常，别回来出事了自己不知道！
        return R.error("失败！出现问题，未知错误");
    }


    /**
     * 处理当（删除分类时，若绑定了菜品或者套餐，会触发的异常！）
     */
    @ExceptionHandler(CustomException.class)
    public R<String> CustomExceptionHandle(CustomException e) {
        log.error(e.getMessage());
        e.printStackTrace();
        return R.error(e.getMessage()); //获取错误信息
    }
}
