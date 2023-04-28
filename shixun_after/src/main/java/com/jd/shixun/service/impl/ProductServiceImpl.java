package com.jd.shixun.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.jd.shixun.common.CustomException;
import com.jd.shixun.dto.ProductDto;
import com.jd.shixun.dto.ProductPie;
import com.jd.shixun.entity.Product;
import com.jd.shixun.entity.ProductKind;
import com.jd.shixun.entity.ProductLable;
import com.jd.shixun.entity.ProductPictures;
import com.jd.shixun.mapper.ProductMapper;
import com.jd.shixun.service.ProductKindService;
import com.jd.shixun.service.ProductLableService;
import com.jd.shixun.service.ProductPicturesService;
import com.jd.shixun.service.ProductService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements ProductService {

    @Autowired
    private ProductPicturesService productPicturesService;

    @Autowired
    private ProductLableService productLableService;

    @Autowired
    private ProductKindService productKindService;

    /**
     * 删除和批量删除功能
     * 前端如果是批量删除，会传过来多个ID，所以这里用集合来接收
     * 这个是多表删除，所以要开事务注解
     * 删除product和productPictures对应的图片
     */
    @Override
    @Transactional //涉及多表，开启事务注解
    public void deleteWithProduct(List<Long> pid) throws CustomException {
        //先查询状态，确定是否可以删除
        //select count(*) from product where id in (1,2,3) and status=1
        LambdaQueryWrapper<Product> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.in(Product::getPid, pid);
        lambdaQueryWrapper.eq(Product::getPstatus, 1);
        int count = this.count(lambdaQueryWrapper);
        if (count>0) { //说明有正在售卖的，不能删除。需要停止售卖再删
            throw new CustomException("该商品正在售卖，不可删除");
        }

        //如果可以删除，先删除product表的数据
        this.removeByIds(pid);//批量删除

        //SQL delect * from prodductPictures where pid in (1,2,3)
        LambdaQueryWrapper<ProductPictures> productPicturesLambdaQueryWrapper = new LambdaQueryWrapper<>();
        productPicturesLambdaQueryWrapper.in(ProductPictures::getPid, pid);
        productPicturesService.remove(productPicturesLambdaQueryWrapper);



    }

    /**
     * 根据ID查找商品 查找商品对应图片 对应标签 进行回显
     */
    @Override
    public ProductDto getByIdWithLableAndPictures(Integer pid) {
        System.err.println(pid);

        Product product = this.getById(pid);
        ProductDto productDto = new ProductDto();
        //进行拷贝
        BeanUtils.copyProperties(product, productDto);
        //查看当前商品对应的标签
        LambdaQueryWrapper<ProductLable> queryWrapper = new LambdaQueryWrapper();
        queryWrapper.eq(ProductLable::getPid, product.getPid());
        List<ProductLable> productLableList = productLableService.list(queryWrapper);

        LambdaQueryWrapper<ProductPictures> productPicturesLambdaQueryWrapper = new LambdaQueryWrapper<>();
        productPicturesLambdaQueryWrapper.eq(ProductPictures::getPid, product.getPid());
        List<ProductPictures> productPicturesList = productPicturesService.list(productPicturesLambdaQueryWrapper);

        productDto.setProductPicturesList(productPicturesList);
        productDto.setProductLableLists(productLableList);

        return productDto;
    }


    /**
     * 新增商品
     * 涉及多表，开启事务注解
     * @param productDto
     */
    @Override
    @Transactional
    public void saveWithLable(ProductDto productDto) {
        //保存基本信息到商品表
        productDto.setPsales(BigDecimal.valueOf(0));
        productDto.setPmonthsale(0L);

        this.save(productDto);

        Integer pid = productDto.getPid();
        List<ProductLable> productLableList = productDto.getProductLableLists();
        for (ProductLable p : productLableList) {
            p.setPid(pid);
        }
        productLableService.saveBatch(productLableList);

    }

    /**
     * 修改商品
     * 同时修改多个表
     */
    @Transactional
    @Override
    public void updateWithLableAndPictures(ProductDto productDto) {
        this.updateById(productDto);
        //排他思想，清理当前商品对应的标签和图片，然后再添加

        //标签构造器
        LambdaQueryWrapper<ProductLable> productLableLambdaQueryWrapper = new LambdaQueryWrapper<>();
        productLableLambdaQueryWrapper.eq(ProductLable::getPid, productDto.getPid());
        //删除保存标签
        productLableService.remove(productLableLambdaQueryWrapper);
        //对每个要添加的标签，赋值商品id
        List<ProductLable> productLableLists = productDto.getProductLableLists();
        for (ProductLable p : productLableLists) {
            p.setPid(productDto.getPid());
        }
        //保存标签
        productLableService.saveBatch(productLableLists);

        //图片构造器
        LambdaQueryWrapper<ProductPictures> productPicturesLambdaQueryWrapper = new LambdaQueryWrapper<>();
        productPicturesLambdaQueryWrapper.eq(ProductPictures::getPid, productDto.getPid());
        //删除以前的图片
        productPicturesService.remove(productPicturesLambdaQueryWrapper);
        //添加保存的图片 并赋值商品id
        List<ProductPictures> productPicturesList = productDto.getProductPicturesList();
        for (ProductPictures p : productPicturesList) {
            p.setPid(productDto.getPid());
        }

        productPicturesService.saveBatch(productPicturesList);
    }

    @Override
    public List<Product> getProductSell() {
        //获取商品名，月销量，剩余库存
       return lambdaQuery().select(Product::getPname,Product::getPmonthsale,Product::getPstock)
                .list();
    }

    @Override
    public List<ProductPie> getProductPie() {
        //饼图map结构， 主键分类名，值为销售额
        //按分类进行了分组
        Map<Integer, List<Product>> productByCategory = lambdaQuery().select(Product::getKid, Product::getPmonthsale).list()
                .stream()
                .collect(Collectors.groupingBy(Product::getKid));
        //获取分类
        List<ProductKind> productKinds=productKindService.getAllKind();
        Map<Integer, String> productKindMap = productKinds.stream().collect(Collectors.toMap(ProductKind::getKid, ProductKind::getKname));


        //要传给前端的数组
        List<ProductPie> productPiesPie = new ArrayList<>();
        productByCategory.forEach((key,products)->{
            Long reduce = products.stream().map(Product::getPmonthsale).reduce(0L,Long::sum);
            String kname = productKindMap.get(key);
            ProductPie productPie = new ProductPie(kname, reduce);
            productPiesPie.add(productPie);
        });
        return productPiesPie;
    }
}
