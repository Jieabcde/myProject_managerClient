package com.jd.shixun.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.util.function.BiConsumer;

@Data
public class OrderLog {
    @TableId(value = "id")
    private Integer id;//主键

    private Long logid; //物流号

    private Long oid; //订单编号

    private Integer logcompanyId; //物流名称


}
