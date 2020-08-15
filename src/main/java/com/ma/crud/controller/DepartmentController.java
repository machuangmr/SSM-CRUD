package com.ma.crud.controller;

import com.ma.crud.bean.Department;
import com.ma.crud.bean.Msg;
import com.ma.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.stream.Collectors;

@Controller
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/getDept")
    @ResponseBody // 前端使用json接受，我们需要使用@ResponseBody注解浪费好久时间
    public Msg getDepts() {
        List<Department> departments = departmentService.getAll();
        List<String> str = departments.stream()
                .map(Department::getDeptName)
                .collect(Collectors.toList());
        return Msg.success().add("depts", str);
    }
}
