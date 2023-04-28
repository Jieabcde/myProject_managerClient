package com.jd.shixun.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.conditions.update.LambdaUpdateChainWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jd.shixun.common.CustomException;
import com.jd.shixun.entity.Product;
import com.jd.shixun.entity.ProductKind;
import com.jd.shixun.entity.ProductPictures;
import com.jd.shixun.mapper.ProductKindMapper;
import com.jd.shixun.service.ProductKindService;
import com.jd.shixun.service.ProductPicturesService;
import com.jd.shixun.service.ProductService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
public class ProductKindServiceImpl extends ServiceImpl<ProductKindMapper, ProductKind> implements ProductKindService {
    @Autowired
    private ProductService productService;

    @Autowired
    private ProductPicturesService productPicturesService;

    /**
     * 根据ID进行删除
     * 涉及多表
     */
    @Override
    @Transactional
    public void removeProductKind(Integer kid) throws CustomException { //分类的ID
        ProductKind productKind = this.getById(kid); //分类对象
        //判断状态
        if (productKind.getStatus() == 1) {
            throw new CustomException("这个分类状态为启动，不可删除");
        }

        //获得该分类下的商品
        LambdaQueryWrapper<Product> productLambdaQueryWrapper = new LambdaQueryWrapper<>();
        productLambdaQueryWrapper.eq(Product::getKid, kid);
        List<Product> productList = productService.list(productLambdaQueryWrapper);
        for (Product s : productList) {
            if (s.getPstatus() == 1) {
                throw new CustomException("这个分类下有商品在上架，不可删除");
            }
        }

        //可以删除
        //显出分类
        this.removeById(kid);
        //删除商品
        productService.remove(productLambdaQueryWrapper);
        //删除商品对应的详情图片
        LambdaQueryWrapper<ProductPictures> productPicturesLambdaQueryWrapper = new LambdaQueryWrapper<>();
        for (Product s : productList) {
            productPicturesLambdaQueryWrapper.eq(ProductPictures::getPid, s.getPid());
            productPicturesService.remove(productPicturesLambdaQueryWrapper);
        }
    }

    @Override
    public List<ProductKind> getAllKind() {
        return lambdaQuery().list();
    }

}
