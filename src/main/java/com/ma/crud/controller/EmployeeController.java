package com.ma.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ma.crud.bean.Employee;
import com.ma.crud.bean.Msg;
import com.ma.crud.service.EmpoloyeeService;
import com.oracle.tools.packager.Log;
import jdk.nashorn.internal.runtime.Source;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.OffsetDateTime;
import java.util.List;

/**
 *  处理员工的增删改查
 */
@Controller
public class EmployeeController {

    @Autowired
    private EmpoloyeeService empoloyeeService;

    @RequestMapping("/getAll")
    @ResponseBody
    public Msg getEmployeeInfo(@RequestParam(value = "pn", defaultValue = "1")int pn, Model model) {
        PageHelper.startPage(pn, 5);
        List<Employee> employees = empoloyeeService.getAll();
        // 使用pageInfo包装查询后的结果,同时可以传入连续显示的页数
        PageInfo page = new PageInfo(employees, 5);
        //responseBody后，会产生什么效果，将返回的数据如何转换为json，然后传递参数。
        return Msg.success().add("pageInfo", page);
    }

    @RequestMapping("/emps")
    public String getEmployee(@RequestParam(value = "pn", defaultValue = "1")int pn, Model model) {
        // 对于分页查询我们可以使用PageHelper插件，引入PageHepler
        // 在查询前只需要调用，传入页码值和每页码大小。
        PageHelper.startPage(pn, 5);
        List<Employee> employees = empoloyeeService.getAll();
        // 使用pageInfo包装查询后的结果,同时可以传入连续显示的页数
        PageInfo page = new PageInfo(employees, 5);
//        page.getNavigatepageNums()
        model.addAttribute("pageInfo", page);
        return "list";
    }

    /** 1、PathVariable 注解的使用
     *  2、前端传递参数的时候，使用的对象，还是具体的数据？
     *  3、两种代码风格：1、在update的时候，返回影响行数，在controller
     *     判断影响行数是否大于0，如果大于0，则执行成功，
     *     2、不用返回影响行数，直接在controller层 使用try()catch()解决
     */

    @RequestMapping(value = "/employee/update/{empId}", method = RequestMethod.POST)
    @ResponseBody
    public Msg edit(Employee employee) {
        System.out.println("employee==" + employee);
        if (employee == null) {
            return Msg.failed();
        }
        try {
            if(succOrFailed(empoloyeeService.updateEmp(employee))){
                return Msg.success();
            }
        } catch (Exception e) {
            Log.info("更新出错" + e);
        }

        return Msg.failed();
    }

    public boolean succOrFailed(int count) {
        return count > 0;
    }

    @RequestMapping(value = "editor/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg editor(@PathVariable("id") Integer id) {
        if (id == null) {
            return Msg.failed();
        }
        Employee emp = empoloyeeService.getEmpById(id);
        Msg msg = new Msg();
        msg.setCode(100);
        msg.setMessage("处理成功！");
        msg.add("emp", emp);
        return msg;
    }
    @RequestMapping(value = "/employee", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmployee(Employee employee){
        empoloyeeService.saveEmployee(employee);
        return Msg.success();
    }

    @RequestMapping(value = "/employee/check", method = RequestMethod.POST)
    @ResponseBody
    public Msg checkEmployee(@RequestParam(value = "empName") String name) {
        String regex = "(^[a-zA-Z0-9_-]{6,16}$)";
        if (!name.matches(regex)) {
            return Msg.failed().add("val_msg","请输入6-16位字符");
        }
        boolean isExist = empoloyeeService.checkEmployee(name);
        if (!isExist) {
            return Msg.failed().add("val_msg", "该用户名称已经存在");
        }
        return Msg.success();
    }

    // 删除员工的信息
    @RequestMapping(value = "/employee/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Msg deleteEmployee(@PathVariable(value = "id") Integer id) {
        if (id == null) {
            return Msg.failed();
        }
        System.out.println("id==" + id);
        if(succOrFailed(empoloyeeService.deleteEmp(id))) {
            return Msg.success();
        } else {
            return Msg.failed();
        }
    }
}
