package com.jd.shixun.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jd.shixun.entity.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper extends BaseMapper<User> {
}
