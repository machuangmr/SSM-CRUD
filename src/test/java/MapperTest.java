import com.ma.crud.bean.Employee;
import com.ma.crud.bean.EmployeeExample;
import com.ma.crud.dao.DepartmentMapper;
import com.ma.crud.dao.EmployeeMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 *  引入spring支持的单元测试
 */
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Test
    public void Test() {
        //我们原生的获取ioc容器的方式，但是Spring的项目，我们推荐使用spring的单元测试，可以自动注入我们需要的组件
        // 由于我们将所有的mapper代理对象交给spring ioc 容器来管理，所以我们先使用ioc容器来获取对象
        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
        DepartmentMapper bean = ioc.getBean(DepartmentMapper.class);
        System.out.println(bean);
    }

    @Test
    public void TestWithSpring() {
        System.out.println(departmentMapper);
    }


    @Test
    public void TestUpdate(){
        Employee employee = new Employee();
        employee.setEmpId(1);
        employee.setEmail("mmm");
        employeeMapper.updateById(employee);
    }

    //测试员工数据和部门数据一块返回
    @Test
    public void getEmpWithDept() {
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpIdEqualTo(1);
        List<Employee> result = employeeMapper.selectByExampleWithDept(employeeExample);
        System.out.println(result);
    }
    // 批量的插入，我们可以是用sqlSession，将sqlSession配置到ioc容器中
}
