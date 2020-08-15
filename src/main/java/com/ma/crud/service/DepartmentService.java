package com.ma.crud.service;

import com.ma.crud.bean.Department;
import com.ma.crud.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
public class DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getAll() {
        List<Department> departments = departmentMapper.selectByExample(null);
        return departments;
    }
}
