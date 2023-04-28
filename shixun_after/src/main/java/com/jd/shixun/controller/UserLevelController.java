package com.jd.shixun.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jd.shixun.common.CustomException;
import com.jd.shixun.common.R;
import com.jd.shixun.entity.User;
import com.jd.shixun.entity.UserLevel;
import com.jd.shixun.service.UserLevelService;
import com.jd.shixun.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/userLevel")
@Slf4j
public class UserLevelController {
    @Autowired
    private UserLevelService userLevelService;

    @Autowired
    private UserService userService;

    @GetMapping("/page")
    public R<Page> page(Integer page, Integer pageSize) {
        //构造分页构造器
        Page pageInfo = new Page(page, pageSize);
        LambdaQueryWrapper<UserLevel> userLevelLambdaQueryWrapper = new LambdaQueryWrapper<>();
        userLevelLambdaQueryWrapper.orderByDesc(UserLevel::getUpdateTime);
        userLevelService.page(pageInfo, userLevelLambdaQueryWrapper);

        return R.success(pageInfo);
    }


    /**
     * 更新修改
     */
    @PutMapping
    public R<String> update(@RequestBody UserLevel userLevel) {
        userLevelService.updateById(userLevel);
        return R.success("修改成功");
    }

    /**
     * 新增
     */
    @PostMapping
    public R<String> save(@RequestBody UserLevel userLevel) {
        userLevelService.save(userLevel);
        return R.success("新增成功");
    }

    /**
     * 根据ID进行删除
     */
    @DeleteMapping()
    public R<String> delete(@RequestParam("id") Integer lid) throws CustomException {
        System.out.println(lid);
        //判断该会员等级下有没有用户
        //SQL select count(*) from user where lid=?
        LambdaQueryWrapper<User> userLambdaQueryWrapper = new LambdaQueryWrapper<>();
        userLambdaQueryWrapper.eq(User::getLid, lid);
        int count = userService.count(userLambdaQueryWrapper);
        if (count > 0) {
            //说明该会员等级下由用户 不可删除
            throw new CustomException("该等级绑定用户，暂时不可删除");
        }
        //没有则可删除
        LambdaQueryWrapper<UserLevel> userLevelLambdaQueryWrapper = new LambdaQueryWrapper<>();
        userLevelLambdaQueryWrapper.eq(UserLevel::getLid, lid);
        userLevelService.remove(userLevelLambdaQueryWrapper);
        return R.success("删除成功");
    }
}
