package com.jd.shixun.controller;

import cn.afterturn.easypoi.entity.vo.NormalExcelConstants;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.enmus.ExcelType;
import cn.afterturn.easypoi.view.PoiBaseView;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jd.shixun.common.R;
import com.jd.shixun.dto.ProductDto;
import com.jd.shixun.dto.UserDto;
import com.jd.shixun.entity.Admin;
import com.jd.shixun.entity.Product;
import com.jd.shixun.entity.User;
import com.jd.shixun.entity.UserLevel;
import com.jd.shixun.service.UserLevelService;
import com.jd.shixun.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/user")
@Slf4j
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserLevelService userLevelService;

    @Value("${shiXun.user}")
    private String userPath;

    /**
     * 进入分页查询
     */
    @GetMapping("page")
    public R<Page> page(int page, int pageSize, String name) {
        Page<User> pageInfo = new Page<>(page, pageSize);
        Page<UserDto> userDtoPage = new Page<>();
        LambdaQueryWrapper<User> userLambdaQueryWrapper = new LambdaQueryWrapper<>();
        userLambdaQueryWrapper.like(name != null, User::getUname, name);
        userService.page(pageInfo, userLambdaQueryWrapper);

        //进行对象拷贝
        BeanUtils.copyProperties(pageInfo,userDtoPage,"records");

        List<UserDto> userDtoList = new ArrayList<>();
        List<User> userList = pageInfo.getRecords();

        for (User u : userList) {
            UserDto userDto = new UserDto();
            BeanUtils.copyProperties(u,userDto);
            Integer lid = u.getLid();
            UserLevel userLevel = userLevelService.getById(lid);
            if (userLevel!=null) {
                userDto.setLname(userLevel.getLname());
            }
            userDtoList.add(userDto);
        }

        userDtoPage.setRecords(userDtoList);

        return R.success(userDtoPage);
    }

    /**
     * 修改用户
     */
    @PutMapping
    public R<String> update(@RequestBody User user) {
        userService.updateById(user);
        return R.success("修改成功");
    }

    /**
     * User_Excel文件导入与导出
     */
    @GetMapping("/excel")
    public void export(ModelMap map, HttpServletResponse response, HttpServletRequest request, String name) {
        List<User> userList = new ArrayList<>();
        List<UserDto> userDtoList = new ArrayList<>();
        LambdaQueryWrapper<User> userLambdaQueryWrapper = new LambdaQueryWrapper<>();
        userLambdaQueryWrapper.like(name != null, User::getUname, name);
        userList=userService.list(userLambdaQueryWrapper);
        System.err.println(userList+"aaaaaaaaaa");

        for (User u : userList) {
            UserDto userDto = new UserDto();
            BeanUtils.copyProperties(u, userDto);
            Integer lid = u.getLid();
            UserLevel userLevel = userLevelService.getById(lid);
            if (userLevel != null) {
                userDto.setLname(userLevel.getLname());
            }
            String image = userDto.getImage();
            image=image.replace("/", "\\");
            image = userPath + image;
            System.err.println(image);
            userDto.setImage(image);

            userDtoList.add(userDto);
        }
        System.err.println(userDtoList.toString()+"=============");

        //设置参数
        ExportParams params = new ExportParams("用户列表", "用户", ExcelType.XSSF);
        //设置数据源
        map.put(NormalExcelConstants.DATA_LIST, userDtoList);
        //设置导出类型
        map.put(NormalExcelConstants.CLASS, UserDto.class);
        //设置导出参数
        map.put(NormalExcelConstants.PARAMS, params);
        //设置文件名
        map.put(NormalExcelConstants.FILE_NAME, "用户表");
//        导出xlex
        PoiBaseView.render(map, request, response, NormalExcelConstants.EASYPOI_EXCEL_VIEW);


    }




}
