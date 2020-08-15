<%--
  Created by IntelliJ IDEA.
  User: machd
  Date: 2020/6/6
  Time: 12:57 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<!--jquery-->
<script type="text/javascript" src="static/scripts/jquery.min.js"></script>
<!-- miniui-->
<link href="static/scripts/miniui/themes/default/miniui.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="static/scripts/miniui/miniui.js"></script>
<body>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>

<h1>测试</h1>
    <!--这个地方的onHelloClick 没有(),有()不能弹出信息。-->
    <input id="helBtn" class="mini-button" text="hello" onclick="onHelloClick"/>
    <script type="text/javascript">
      function onHelloClick(e) {
          var button = e.sender;
          mini.alert("hello world !");
      }
    </script>

<div id="myDatagrid" class="mini-datagrid" url="${APP_PATH}/getAll" style="width:800px;height:280px;">
    <div property="columns">
        <div field="empId">员工id</div>
        <div field="empName">员工姓名</div>
        <div field="gender">员工性别</div>
    </div>
</div>
</body>
<script type="text/javascript">
    mini.parse();
    var grid = mini.get("myDatagrid");
    //grid.load({data:""});
    grid.load {
    });
</script>
</html>
