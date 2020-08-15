<%--
  Created by IntelliJ IDEA.
  User: machd
  Date: 2020/6/8
  Time: 10:23 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<html>
<head>
    <title>员工列表</title>
    <%  // 如果在项目中，我们不以/开始的相对路径找资源，很容易出现问题，
        //所以我们一般在 项目中使用绝对路径， http://localhost:3306 服务器的路径。
        pageContext.setAttribute("APP_PATH", request.getContextPath());
        // 使用项目路径 ${APP_PATH}，
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.5.1.jar"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
    <!-- 页面布局-->
    <div class="container">
        <!--bootstrap 提供了一栅格系统，将我们的屏幕分为每一行的（row），和各个column-->
        <!--标题-->
        <div class="row">
            <div class="col-xs-12">
                <h1>SSM_CRUD</h1>
            </div>
        </div>
        <!-- 按钮-->
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button type="button" class="btn btn-success">增加</button>
                <button type="button" class="btn btn-danger">删除</button>
            </div>
        </div>
        <!--数据显示-->
        <div class="row">
            <div class="col-xs-12">
                <table class="table table-hover">
                    <tr>
                        <th>员工id</th>
                        <th>员工姓名</th>
                        <th>员工性别</th>
                        <th>邮箱</th>
                        <th>部门名称</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="emp">
                    <tr>
                        <td>${emp.empId}</td>
                        <td>${emp.empName}</td>
                        <td>${emp.gender == 1?"男":"女"}</td>
                        <td>${emp.email}</td>
                        <td>${emp.department.deptName}</td>
                        <td>
                            <button type="button" class="btn-success btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                编辑
                            </button>
                            <button type="button" class="btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除
                            </button>
                        </td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <div class="row">
            <!--先显示分页具体信息-->
            <div class="col-xs-6">
                当前${pageInfo.pageNum}页，
                总共${pageInfo.pages},
                共有${pageInfo.total}记录
            </div>
            <!--分页的具体信息-->
            <div class="col-xs-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="#">首页</a></li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        </c:if>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                            <c:if test="${page_Num == pageInfo.pageNum}">
                                <li class="active"><a href="${APP_PATH}/emps?pn=${page_Num}">${page_Num}</a></li>
                            </c:if>
                            <c:if test="${page_Num != pageInfo.pageNum}">
                                <li><a href="${APP_PATH}/emps?pn=${page_Num}">${page_Num}</a></li>
                            </c:if>
                        </c:forEach>
                        <li>
                            <c:if test="${pageInfo.hasNextPage}">
                            <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum + 1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                            </c:if>
                        </li>
                        <li><a href="#">尾页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    <script>
    </script>
</body>
</html>
