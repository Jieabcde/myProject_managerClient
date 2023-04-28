package com.jd.shixun.dto;

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.afterturn.easypoi.excel.annotation.ExcelTarget;
import com.jd.shixun.entity.Product;
import com.jd.shixun.entity.ProductLable;
import com.jd.shixun.entity.ProductPictures;
import lombok.Data;

import java.util.List;

@Data
@ExcelTarget("Product")
public class ProductDto extends Product {
    private List<ProductPictures> productPicturesList; //对应详情图片

    private List<ProductLable> productLableLists;//商品标签

    @Excel(name="分类",width = 25.0)
    private String kname;//分类名称
}
