package com.jd.shixun.filter;

import com.alibaba.fastjson.JSON;
import com.jd.shixun.common.BaseContext;
import com.jd.shixun.common.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.AntPathMatcher;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 检查用户是否已经完成登录
 *
 * 1.获取本次请求的URL
 * 2.判断本次请求是否需要处理
 * 3.如果不需要处理，则直接放行
 * 4.判断登录状态，如果已登录，则直接放行
 * 5.如果未登录，则返回登录结果
 */

@WebFilter(filterName = "loginCheckFilter",urlPatterns = "/*") //过滤器名字xxx，拦截所有请求(除了登录路径请求)
@Slf4j
public class LoginCheckFilter implements Filter {
    //路径匹配器，支持通配符
    public static final AntPathMatcher PATH_MATCHER = new AntPathMatcher();

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
            //强转  大转小，能使用小的特有方法
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        //1.获取本次请求的url
        log.info("拦截到请求:{}", request.getRequestURI()); //  /backend/index.html
        String requestURI = request.getRequestURI();
        String[] urls = new String[]{ //把不需要处理的请求放到这里
                "/admin/login",  //登录
                "/admin/logout", //注销
                "/backend/**",   //后端页面JS CSS等请求
                "/common/**",    //通用功能上传下载
                "/admin/sendMsg", //发送验证码
                "/admin/msgLogin" //验证码登录
        };
        //2.判断本次请求是否需要处理
        boolean check = check(urls, requestURI); //true放行 false处理

        //3.如果不需要处理，则直接放行
        if (check) {
            //放行请求
            log.info("本次请求{}不需要处理", request.getRequestURI());
            filterChain.doFilter(request,response);
            return;
        }
        //4-1若需要处理，判断登录状态，如果登录则放行  后台端
        if (request.getSession().getAttribute("admin") != null) {
            Integer adminId = (Integer) request.getSession().getAttribute("admin");
            //使用线程获设置取当前登录员工ID
            BaseContext.setCurrentId(adminId);

            //放行请求

            filterChain.doFilter(request,response);
            return;
        }

        //5.如果未登录，则返回登录结果。通过输出流方式向客户端页面响应数据，然后让前端拦截器request.js里的响应拦截器拦截
        log.info("用户未登录");
        response.getWriter().write(JSON.toJSONString(R.error("NOTLOGIN"))); // 响应给前端，然后前端拦截器会拦截到此请求request.js的响应拦截器
        return;



    }

    /**
     * 进行路径匹配，用来检查本次请求是否需要放行
     * @param requestURI
     * @return
     */
    public boolean check( String[] urls,String requestURI) {
        for (String url : urls) {
            boolean match = PATH_MATCHER.match(url, requestURI);//遍历字符串数组，用路径匹配器判断是否匹配，若匹配成功返回true
            if (match) {
                return true;
            }
        }
        return false;
    }
}
