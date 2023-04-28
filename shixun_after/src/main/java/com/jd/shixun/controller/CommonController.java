package com.jd.shixun.controller;


import com.jd.shixun.common.R;
import com.jd.shixun.service.ProductKindService;
import com.jd.shixun.service.ProductLableService;
import com.jd.shixun.service.ProductPicturesService;
import com.jd.shixun.service.ProductService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.UUID;

/**
 * 文件上传和下载
 * 通用控制层
 */
@RestController
@RequestMapping("/common")
@Slf4j
public class CommonController {
    @Value("${shiXun.kind}")
    private String kindPath;

    @Value("${shiXun.product}")
    private String productPath;

    @Value("${shiXun.addProduct}")
    private String addProductPath;

    @Value("${shiXun.user}")
    private String userPath;

    private String basePath;



    /**
     * 文件上传
     * @param file
     * @return
     */
    @PostMapping("/upload")
    public R<String> upload(MultipartFile file,String type) { //这是封装好的文件上传下载类，名字必须是file，不能随便起，与前端对应（这里的前端是file）
        log.warn("type值为{}",type);
        if ("kind".equals(type)) {
            basePath = kindPath;
        } else if ("add".equals(type)) {
            basePath = addProductPath;
        } else if ("user".equals(type)) {
            basePath = userPath;
        } else {
            basePath = productPath;
        }
        //file是一个临时文件，需要自己转存到指定位置，否则本次请求完成后临时文件将会删除
        log.info(file.toString());
        //获得原始文件名，上传的时候叫的名字,不推荐防止重名
        String originalFilename = file.getOriginalFilename(); //获得原始文件名，上传的时候叫的名字,不推荐防止重名
        String suffix = originalFilename.substring(originalFilename.lastIndexOf(".")); //获取文件名后缀
        //substring(i) 去掉字符串的前i个字符   lastIndexOf的结果是获取该字符的下标。下标从0开始。
        //使用UUID重新生成文件名，防止文件名称重复造成文件覆盖
        String fileName = UUID.randomUUID().toString() + suffix;//

        //创建一个文件对象
        File dir = new File(basePath);
        if (!dir.exists()) {
            //目录不存在，需要存在
            dir.mkdirs();
        }

        try {
            //将临时文件转存到指定位置
            file.transferTo(new File(basePath + fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.err.println(basePath + fileName);
        //返回文件名称
        return R.success(fileName); //然后前端进入handleAvatarSuccess方法
    }

    /**
     * 将图片下载到页面，再页面中展示。以流的方式传输
     *
     * @param name
     * @param response
     */
    @GetMapping("/download")
    public void download(String name, HttpServletResponse response, String type) {
        log.warn("type值为{}",type);
        if ("kind".equals(type)) {
            basePath = kindPath;
        } else if ("add".equals(type)) {
            basePath = addProductPath;
        } else if ("user".equals(type)) {
            basePath = userPath;
        } else {
            basePath = productPath;
        }
        try {
            //输入流，通过输入流找到并读取文件内容
            System.out.println(basePath + name);
            FileInputStream fileInputStream = new FileInputStream(new File(basePath + name));
            //输出流，通过输出流将文件写回浏览器，最终再浏览器展示图片
            ServletOutputStream outputStream = response.getOutputStream();//通过响应对象获取输出流对象

            response.setContentType("image/jpeg");//说明响应回去的到底是什么类型文件，这里是固定写法

            int len = 0;
            byte[] bytes = new byte[1024];

            //InputStream.read() 和 OutputStream.write()方法组合使用可以完成文件的复制功能。
            //从输入流读取 b (2048)个字节，并将它们存储到缓冲区b ，如到输入流到末尾则返回-1。所以这里当len为-1表示读取完毕
            while ((len = fileInputStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, len);//：指定的字节;off:数组b中将写⼊数据的初始偏移量；len：要读取的最⼤字节数
                outputStream.flush(); //刷新
            }
            //关闭资源
            outputStream.close();
            fileInputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }



}
