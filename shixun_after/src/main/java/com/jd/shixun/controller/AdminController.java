package com.jd.shixun.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jd.shixun.common.R;
import com.jd.shixun.entity.Admin;
import com.jd.shixun.service.AdminService;
import com.jd.shixun.utils.SMSUtils;
import com.jd.shixun.utils.ValidateCodeUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.Map;

import static net.sf.jsqlparser.util.validation.metadata.NamedObject.user;

@RestController
@Slf4j
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @PostMapping("/login")
    public R<Admin> login(HttpServletRequest request, @RequestBody Admin admin) {
        /**
         * 1.将页面提交的密码进行MD5加密处理
         * 2.根据页面提交的用户名username查询数据库
         * 3.如果没有查询到则返回登录失败结果
         * 4.密码比对，如果不一致则返回登录失败结果
         * 5.查看员工状态，如果已禁用状态，则返回已禁用结果
         * 6.登录成功的话，将员工ID存入Session并返回登录成功结果
         */
        //1.MD5加密处理
        String password = admin.getPassword();
        password = DigestUtils.md5DigestAsHex(password.getBytes());
        System.out.println(password);
        //2.根据页面提交的用户名username查询数据库
        LambdaQueryWrapper<Admin> queryWrapper = new LambdaQueryWrapper();
        queryWrapper.eq(Admin::getUsername, admin.getUsername());
        Admin one = adminService.getOne(queryWrapper);
        if (one == null) {
            //说明用户名不存在
            return R.error("用户名不存在");
        }
        if (!one.getPassword().equals(password)) {
            return R.error("输入密码错误");
        }
        if (one.getStatus() == 0) {
            return R.error("该账户已禁用");
        }
        //说明全部检验争取，登录成功，将员工ID存入Session并返回登录结果
        request.getSession().setAttribute("admin", one.getId());
        return R.success(one);
    }

    /**
     * 员工退出登录
     */
    @PostMapping("logout")
    public R<String> logout(HttpServletRequest request) {
        request.getSession().removeAttribute("admin");
        return R.success("退出成功");
    }

    /**
     * 进入分页查询
     */
    @GetMapping("page")
    public R<Page> page(int page, int pageSize, String name) {
        Page pageInfo = new Page<>(page, pageSize);
        LambdaQueryWrapper<Admin> lambdaQueryWrapper = new LambdaQueryWrapper();
        lambdaQueryWrapper.like(name != null, Admin::getName, name);
        lambdaQueryWrapper.orderByAsc(Admin::getCreateTime);
        adminService.page(pageInfo, lambdaQueryWrapper);
        return R.success(pageInfo);
    }

    /**
     * 新增员工
     */
    @PostMapping
    public R<String> save(HttpServletRequest request, @RequestBody Admin admin) {
        //每新增一个员工，设置一个默认密码，默认密码为123456，并进行md5加密
        admin.setPassword(DigestUtils.md5DigestAsHex("123456".getBytes()));
        //获得当前用户ID
        adminService.save(admin);
        return R.success("新增员工成功");
    }

    /**
     * 根据ID查找员工
     */
    @GetMapping("/{id}")
    public R<Admin> getById(@PathVariable Integer id) {
        log.info("根据ID查询：{}", id);
        Admin byId = adminService.getById(id);
        return R.success(byId);
    }


    /**
     * 编辑员工 更新
     */
    @PutMapping
    public R<String> editAdmin(@RequestBody Admin admin) {
        log.info("要修改的信息：{}", admin);
        adminService.updateById(admin);
        return R.success("更新信息成功");
    }

    /**
     * 手机发送验证码
     */
    @PostMapping("/sendMsg")
    public R<String> sendMsg(@RequestBody Admin admin, HttpSession session) {
        //获取手机号
        String phone = admin.getPhone();
        if (!StringUtils.isEmpty(phone)) {

            //生成随机4位验证码  防止某些利用工具发送post信息绕过前端，所以后端进行验证一下
            String code = ValidateCodeUtils.generateValidateCode(4).toString();
            log.info("code={}", code);
            //调用阿里云提供的短信服务API来发送短信  现在由于正在备案，只能使用 阿里云短信测试
        SMSUtils.sendMessage("阿里云短信测试", "SMS_154950909", phone, code);// 测试阶段先注销，上线在打开
            //将生成的验证码保存要Session进行和发送出去的验证  后面会优化，保存到Redis
            session.setAttribute(phone, code); //以手机号名字作为key code值为验证码
//            session.setAttribute(phone, "1234"); //测试 ，上线的时候注销这个启用上面的
            return R.success("手机验证码短信发送成功");
        }
        return R.error("手机短信发送失败");
    }

    /**
     * 验证码员工登录
     */
    @GetMapping("/msgLogin")
    public R<Admin> login(String phone, String code, HttpSession session) {
        //因为user没有code，所以使用map集合来接收，前端传过来的正好也是集合参数。这里使用userDto也可以
//        log.info(map.toString());
        System.err.println("我进来了！！1");
//        //获取手机号
//        String phone = map.get("phone").toString();
        System.out.println(phone);
//
//        //获取验证码
//        String code = map.get("code").toString();
//        //从Session获取保存的验证码
        String s = session.getAttribute(phone).toString();//code
//        System.err.println(s);
//        //进行验证码比对（页面提交的验证码和Session保存的验证码比对）
        if (s != null && code.equals(s)) {
            //如果能比对成功，说明登录成功
            //判断当前手机号对应的用户是否为新用户，如果是新用户就自动完成注册
            LambdaQueryWrapper<Admin> lambdaQueryWrapper = new LambdaQueryWrapper();
            lambdaQueryWrapper.eq(Admin::getPhone, phone);
            Admin one = adminService.getOne(lambdaQueryWrapper);//getOne 搜索唯一标识
            if (one == null) {
                //说明用户名不存在
                return R.error("该员工不存在");
            }
            if (one.getStatus() == 0) {
                return R.error("该账户已禁用");
            }
            //说明全部检验争取，登录成功，将员工ID存入Session并返回登录结果
            session.setAttribute("admin", one.getId());
            return R.success(one);
        }
        return R.error("验证码不正确");

    }
}



//}

























