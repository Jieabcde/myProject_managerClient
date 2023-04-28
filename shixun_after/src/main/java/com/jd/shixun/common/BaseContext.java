package com.jd.shixun.common;

/**
 * 基于ThreadLocal封装的工具类，用于保存和获取当前用户登录的ID。使用线程传递知识
 */
public class BaseContext { //作用范围是一个线程之内
    private static ThreadLocal<Integer> threadLocal = new ThreadLocal<>();

    public static void setCurrentId(Integer id) {
        threadLocal.set(id);
    }

    public static Integer getCurrentId() {
        return threadLocal.get();
    }
}
