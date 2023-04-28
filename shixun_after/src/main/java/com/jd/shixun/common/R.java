package com.jd.shixun.common;

import lombok.Data;
import java.util.HashMap;
import java.util.Map;


/**
 * 表现层消息一致性处理
 *      设计表现层返回结果的模型类，用于后端与前端进行数据格式统一，也成为前后端数据协议
 *
 *      目的：1.设计统一的返回值结果类型便于前端开发读取数据
 *           2.返回值结果类型可以根据需求自行设定，没有固定格式
 *           3.返回值结果模型类用于后端与前端进行数据格式统一，也成为前后端数据协议
 *
 * 通用返回结果类，服务端响应的数据最终都会封装成此对象
 */
@Data
public class R<T> {

    private Integer code; //编码：1成功，0和其它数字为失败

    private String msg; //错误信息

    private T data; //数据

    private Map map = new HashMap(); //动态数据

    public static <T> R<T> success(T object) {
        R<T> r = new R<T>();
        r.data = object;
        r.code = 1;
        return r;
    }
    

    public static <T> R<T> error(String msg) {
        R r = new R();
        r.msg = msg;
        r.code = 0;
        return r;
    }

    public R<T> add(String key, Object value) {
        this.map.put(key, value);
        return this;
    }

}
