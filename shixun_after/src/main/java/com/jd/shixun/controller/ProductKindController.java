package com.jd.shixun.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jd.shixun.common.CustomException;
import com.jd.shixun.common.R;
import com.jd.shixun.entity.Admin;
import com.jd.shixun.entity.ProductKind;
import com.jd.shixun.service.ProductKindService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/productKind")
@Slf4j
public class ProductKindController {
    @Autowired
    private ProductKindService productKindService;

    /**
     * 查询分类全部
     *
     * @return
     */
    @GetMapping("page")
    public R<Page> getAllByPage(int page, int pageSize) {
        Page pageInfo = new Page<>(page, pageSize);
        LambdaQueryWrapper<ProductKind> lambdaQueryWrapper = new LambdaQueryWrapper();
        lambdaQueryWrapper.orderByDesc(ProductKind::getUpdateTime);
        productKindService.page(pageInfo, lambdaQueryWrapper);
        return R.success(pageInfo);
    }

    /**
     * 新增
     */
    @PostMapping
    public R<String> add(@RequestBody ProductKind productKind) {
        log.info("新增的分类数据是:{}", productKind);
        productKindService.save(productKind);
        return R.success("新增分类成功");
    }

    /**
     * 根据ID进行删除
     * 涉及多表
     */
    @DeleteMapping
    public R<String> delete(Integer id) throws CustomException {
        productKindService.removeProductKind(id);
        return R.success("删除成功");
    }

    /**
     * 根据ID进行查询
     */
    @GetMapping("/{id}")
    public R<ProductKind> getById(@PathVariable("id") Integer kid) {
        ProductKind byId = productKindService.getById(kid);
        return R.success(byId);
    }


    /**
     * 分类修改功能
     */
    @PutMapping
    public R<String> update(@RequestBody ProductKind productKind) {
        productKindService.updateById(productKind);
        return R.success("分类修改成功");
    }

    /**
     * 获得分类列表
     */
    @GetMapping("list")
    public R<List<ProductKind>> list(ProductKind productKind) {
        LambdaQueryWrapper<ProductKind> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(ProductKind::getStatus, 1);
        lambdaQueryWrapper.orderByAsc(ProductKind::getUpdateTime);
        List<ProductKind> list = productKindService.list(lambdaQueryWrapper);
        return R.success(list);
    }
}
