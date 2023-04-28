package com.jd.shixun.dto;

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.afterturn.easypoi.excel.annotation.ExcelTarget;
import com.jd.shixun.entity.User;
import lombok.Data;

import java.net.UnknownServiceException;

@Data
@ExcelTarget("User")
public class UserDto extends User {
    @Excel(name = "会员",orderNum = "2",width = 20.0)
    private String lname;
}
