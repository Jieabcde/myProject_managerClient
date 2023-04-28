package com.jd.shixun.controller;

import cn.afterturn.easypoi.entity.vo.NormalExcelConstants;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.enmus.ExcelType;
import cn.afterturn.easypoi.view.PoiBaseView;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jd.shixun.common.CustomException;
import com.jd.shixun.common.R;
import com.jd.shixun.dto.ProductDto;
import com.jd.shixun.dto.ProductPie;
import com.jd.shixun.entity.Product;
import com.jd.shixun.entity.ProductKind;
import com.jd.shixun.entity.ProductLable;
import com.jd.shixun.entity.ProductPictures;
import com.jd.shixun.service.ProductKindService;
import com.jd.shixun.service.ProductLableService;
import com.jd.shixun.service.ProductPicturesService;
import com.jd.shixun.service.ProductService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/product")
@Slf4j
public class ProductController {
    @Autowired
    private ProductPicturesService productPicturesService;

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductKindService productKindService;

    @Autowired
    private ProductLableService productLableService;

    @Value("${shiXun.product}")
    private String productPath;
    /**
     * 查询全部商品 分页查询
     *
     * @param page
     * @param pageSize
     * @param name
     * @return
     */
    @GetMapping("page")
    public R<Page> getAll(Integer page, Integer pageSize, String name) {
//        log.info("gage:{},pageSize:{}",page,pageSize);
        Page<Product> productInfo = new Page<>(page, pageSize);

        Page<ProductDto> productDtoPage = new Page<>();
        LambdaQueryWrapper<Product> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.like(name != null, Product::getPname, name);
        productService.page(productInfo, lambdaQueryWrapper);

        //进行对象拷贝，忽略records，不需要这个数据，因为records都是product的数据。我们需要的records装的是productDto的数据
        //注意，集合不能进行深拷贝
        BeanUtils.copyProperties(productInfo, productDtoPage, "records");

        List<ProductDto> productDtoList = new ArrayList<>();
        List<Product> productList = productInfo.getRecords();


        for (Product p : productList) {

            ProductDto productDto = new ProductDto();

            BeanUtils.copyProperties(p, productDto);

            Integer kid = p.getKid(); //获取当前分类的ID

            ProductKind productKind = productKindService.getById(kid); //当前分类对象

            if (productKind != null) {
                String kname = productKind.getKname();
                productDto.setKname(kname); //赋值分类名
            }

            Integer pid = p.getPid(); //当前商品ID

            //图片构造器
            LambdaQueryWrapper<ProductPictures> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.eq(ProductPictures::getPid, pid);
            List<ProductPictures> productPicturesList = productPicturesService.list(queryWrapper);
            if (productPicturesList != null) {
                //说明此物品有详情图片
                productDto.setProductPicturesList(productPicturesList); //赋值
            }

            //标签构造器
            LambdaQueryWrapper<ProductLable> productLableLambdaQueryWrapper = new LambdaQueryWrapper<>();
            productLableLambdaQueryWrapper.eq(ProductLable::getPid, pid);
            List<ProductLable> productLableList = productLableService.list(productLableLambdaQueryWrapper);
            if (productLableList != null) {
                //说明此商品有标签
                productDto.setProductLableLists(productLableList);
            }


            productDtoList.add(productDto); //添加到集合
        }
        productDtoPage.setRecords(productDtoList);

        return R.success(productDtoPage);
    }


    /**
     * 删除和批量删除功能
     * 前端如果是批量删除，会传过来多个ID，所以这里用集合来接收
     * 这个是多表删除，所以要开事务注解
     */
    @DeleteMapping
    public R<String> delete(@RequestParam List<Long> pid) throws CustomException {
        log.info("id{}", pid);
        productService.deleteWithProduct(pid);
        return R.success("删除成功");
    }


    /**
     * 新增商品
     */
    @PostMapping
    public R<String> save(@RequestBody ProductDto productDto) {
        productService.saveWithLable(productDto);
        return R.success("新增商品成功");
    }


    /**
     * 根据ID查找商品 查找商品对应图片 对应标签 进行回显
     */
    @GetMapping("/{id}")
    public R<ProductDto> get(@PathVariable("id") Integer pid) {
        log.info("pid:{}", pid);
        ProductDto productDto = productService.getByIdWithLableAndPictures(pid);
        return R.success(productDto);
    }


    /**
     * 修改商品
     * 同时修改多个表
     */
    @PutMapping
    public R<String> update(@RequestBody ProductDto productDto) {
        productService.updateWithLableAndPictures(productDto);
        return R.success("修改商品成功");
    }

    /**
     * 状态修改
     */
    @PutMapping("/{pstatus}")
    public R<String> editStatus(@RequestParam List<Long> pid,@PathVariable Integer pstatus) {
        log.info("pid:{},pstatus:{}", pid,pstatus);
        for (Long p : pid) {
            // update product set status=1 where pid=?
            LambdaUpdateWrapper<Product> updateWrapper = new LambdaUpdateWrapper<>();
            updateWrapper.eq(Product::getPid, p);
            updateWrapper.set(Product::getPstatus, pstatus);
            productService.update(updateWrapper);

        }
        return R.success("状态更改成功");
    }

    /**
     * Product_Excel文件导入导出
     */
    @GetMapping("/excel")
    public void export(ModelMap map, HttpServletResponse response, HttpServletRequest request,String name) {
        List<Product> productList = new ArrayList<>();
        List<ProductDto> productDtoList = new ArrayList<>();
        LambdaQueryWrapper<Product> productLambdaQueryWrapper = new LambdaQueryWrapper<>();
        productLambdaQueryWrapper.like(name != null, Product::getPname, name);
        productList = productService.list(productLambdaQueryWrapper);
        for (Product p : productList) {
            ProductDto productDto = new ProductDto();

            BeanUtils.copyProperties(p, productDto);

            Integer kid = p.getKid(); //获取当前分类的ID

            ProductKind productKind = productKindService.getById(kid); //当前分类对象

            if (productKind != null) {
                String kname = productKind.getKname();
                productDto.setKname(kname); //赋值分类名
            }

            String image = productDto.getImage();
            image= image.substring(1);
            image=image.replace("/", "\\");
            image = productPath + image;
            productDto.setImage(image);
            System.err.println(productDto.getKname() + "---" + productDto.getImage());

            productDtoList.add(productDto);
        }
        System.err.println(productDtoList);
        //设置参数
        ExportParams params = new ExportParams("商品列表", "商品", ExcelType.XSSF);
        //设置数据源
        map.put(NormalExcelConstants.DATA_LIST, productDtoList);
        //设置导出类型
        map.put(NormalExcelConstants.CLASS, ProductDto.class);
        //设置导出参数
        map.put(NormalExcelConstants.PARAMS, params);
        //设置文件名
        map.put(NormalExcelConstants.FILE_NAME, "商品表");
//        导出xlex
        PoiBaseView.render(map, request, response, NormalExcelConstants.EASYPOI_EXCEL_VIEW);
    }

    /**
     * 获取商品销售额
     */
    @GetMapping("/getProductSell")
    public R getProductSell() {
        List<Product> productSell = productService.getProductSell();
        return R.success(productSell);
    }

    /**
     * 获取饼图
     */
    @GetMapping("/getProductPie")
    public R getProductPie() {
        List<ProductPie> productPies = productService.getProductPie();
        return R.success(productPies);
    }

}



















