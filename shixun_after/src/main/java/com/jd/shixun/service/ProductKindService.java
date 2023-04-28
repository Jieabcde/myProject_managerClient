package com.jd.shixun.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.jd.shixun.common.CustomException;
import com.jd.shixun.entity.ProductKind;

import java.util.List;

public interface ProductKindService extends IService<ProductKind> {
    /**
     * 根据ID进行删除
     * 涉及多表
     */
    void removeProductKind(Integer id) throws CustomException;

    /**
     * 获取全部分类
     * @return
     */
    List<ProductKind> getAllKind();
}
