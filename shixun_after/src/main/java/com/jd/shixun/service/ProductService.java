package com.jd.shixun.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.jd.shixun.common.CustomException;
import com.jd.shixun.dto.ProductDto;
import com.jd.shixun.dto.ProductPie;
import com.jd.shixun.entity.Product;

import java.util.List;

public interface ProductService extends IService<Product> {
    /**
     * 删除和批量删除功能
     * 前端如果是批量删除，会传过来多个ID，所以这里用集合来接收
     * 这个是多表删除，所以要开事务注解
     */
    void deleteWithProduct(List<Long> pid) throws CustomException;

    /**
     * 根据ID查找商品 查找商品对应图片 对应标签 进行回显
     */
    ProductDto getByIdWithLableAndPictures(Integer pid);

    /**
     * 新增商品
     * @param productDto
     */
    void saveWithLable(ProductDto productDto);

    /**
     * 修改商品
     * 同时修改多个表
     */
    void updateWithLableAndPictures(ProductDto productDto);

    /**
     * 获取商品销售额
     * @return
     */
    List<Product> getProductSell();

    /**
     * 获取饼图
     * @return
     */
    List<ProductPie> getProductPie();
}
