package com.ma.crud.dao;

import com.ma.crud.bean.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 请添加注释
 *
 * @author <a href="mailto:macd@zjport.gov.cn">macd</a>
 * @version 3
 * @since 3.0
 */
public interface EmployeeMapperExt {

    List<Employee> queryByGender(@Param("gender") String gender);
}
