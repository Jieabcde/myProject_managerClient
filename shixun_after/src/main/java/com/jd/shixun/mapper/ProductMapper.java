package com.jd.shixun.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jd.shixun.entity.Product;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper extends BaseMapper<Product> {
}
