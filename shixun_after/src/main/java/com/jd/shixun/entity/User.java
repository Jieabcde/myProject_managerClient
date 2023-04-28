package com.jd.shixun.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class User {
    @TableId(value = "uid")
    @Excel(name="用户ID",orderNum = "0",width = 20.0)
    private Integer uid;

    private Integer lid;

    @Excel(name="用户名称",orderNum = "1",width = 20.0)
    private String uname;

    @Excel(name="用户电话",orderNum = "3",width = 20.0)
    private String utel;

    @Excel(name="用户邮箱",orderNum = "4",width = 20.0)
    private String uemail;

    private String upwd;

    @Excel(name = "当前积分",orderNum = "5",width = 20.0)
    private String nowpoint;

    private String hispoint;

//    @Excel(name = "图片",width = 10,type = 2,imageType = 1)
    private String image;

    private Integer status;

}
