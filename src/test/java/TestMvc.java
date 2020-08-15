import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@ContextConfiguration(value = {"classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
public class TestMvc {
    //需要传入Spring mvc;
    @Autowired
    WebApplicationContext context;

     MockMvc mockMvc;

     @Before
     public void initMockMvc() {
         mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
     }

     @Test
     public void testPage() throws Exception {
         MvcResult pn = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "1")).andReturn();
         MockHttpServletRequest request = pn.getRequest();
         PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
         System.out.println("当前页码" + pageInfo.getPageNum());
         System.out.println("总页码" + pageInfo.getTotal());
         System.out.println("连续显示的页码" + pageInfo.getNavigatepageNums());

         /**
          *  https://blog.csdn.net/weixin_41060905/article/details/103088105
          */
     }
}
