package com.jd.shixun.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class ProductPictures {
    @TableId(value = "picid")
    private Integer picid; //图片编号

    private Integer pid; //商品编号

    private String image;

//    private Integer piclocation; //1首页 0详情页

}
