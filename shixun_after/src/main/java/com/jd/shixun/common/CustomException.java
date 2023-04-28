package com.jd.shixun.common;

/**
 * 自定义异常
 */
public class CustomException extends Exception {
    public CustomException() {

    }

    public CustomException(String message) {
        super(message); //message 错误信息
    }

}
