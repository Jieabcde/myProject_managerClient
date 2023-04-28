package com.jd.shixun.common;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
 * 自定义元数据对象处理器
 * 自定义元数据对象处理器
 * 自定义元数据对象处理器
 */

@Component
@Slf4j
public class MyMeatObjecthandler implements MetaObjectHandler {
    /**
     * 当执行Insert语句的时候会执行此方法
     * 自动填充
     */
    @Override
    public void insertFill(MetaObject metaObject) {
        log.info("公共字段自动填充[insert]....");
        log.info(metaObject.toString());
        metaObject.setValue("createTime", LocalDateTime.now());
        metaObject.setValue("updateTime", LocalDateTime.now());
        Integer adminId = BaseContext.getCurrentId();
        metaObject.setValue("createUser", new Long(adminId));
        metaObject.setValue("updateUser", new Long(adminId));
    }

    /**
     * 当执行Update语句的时候会执行此方法
     * 自动填充
     */
    @Override
    public void updateFill(MetaObject metaObject) {
        log.info("公共字段自动填充[update]....");
        Integer adminId = BaseContext.getCurrentId();
        metaObject.setValue("updateTime", LocalDateTime.now());
        metaObject.setValue("updateUser", new Long(adminId));
    }
}
