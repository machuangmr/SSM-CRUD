package com.ma.crud.service;

import com.ma.crud.bean.Employee;
import com.ma.crud.bean.EmployeeExample;
import com.ma.crud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmpoloyeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    public List<Employee> getAll() {
        List<Employee> employees = employeeMapper.selectByExampleWithDept(null);
        return employees;
    }

    public int updateEmp (Employee employee) {
        // 如何更新？ 直接在前端的传入对应数据ID，然后数据库根据id进行直接更新
       return employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public Employee getEmpById(Integer id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    public void saveEmployee(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    public boolean checkEmployee(String name) {
        if (null == name) {
            return false;
        }
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(name);
        long count = employeeMapper.countByExample(example);
        return count == 0;
    }

    public int deleteEmp(Integer id) {
        int count =  employeeMapper.deleteByPrimaryKey(id);
        return count;
    }

    public List<Employee> queryByGender(String gender) {
        return  employeeMapper.queryByGender(gender);
    }
}
