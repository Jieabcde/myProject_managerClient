package com.jd.shixun.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class Logcompany {
    @TableId(value = "logcompany_id")
    private Integer logcompanyId; //物流分类ID

    private String logcompanyName; //物流分类名称



}
