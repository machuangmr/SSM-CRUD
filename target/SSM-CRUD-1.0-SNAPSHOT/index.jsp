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
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.5.1.min.js"></script>
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
            <div class="">
            <div class="col-md-4 col-md-offset-8">
                <button type="button" class="btn btn-success" id="btn_add">增加</button>
                <button type="button" class="btn btn-danger">删除</button>
            </div>
        </div>
        <!--数据显示-->
        <div class="row">
            <div class="col-xs-12">
                <table class="table table-hover" id="emp_tables">
                    <thead>
                    <tr>
                        <th>员工id</th>
                        <th>员工姓名</th>
                        <th>员工性别</th>
                        <th>邮箱</th>
                        <th>部门名称</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row" >
            <!--先显示分页具体信息-->
            <div class="col-xs-6" id="page_info">
            </div>
            <!--分页的具体信息-->
            <div class="col-xs-6" id="page_area">
                <nav aria-label="Page navigation">
                </nav>
            </div>
        </div>
    </div>
    <div class="modal fade" id="myWin" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" aria-label="Close">
                        <span>&times;</span>
                    </button>
                    <h4 class="modal-title">新增</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>员工姓名</label>
                        <input type="text" id="empName" name="empName">员工姓名</div>
                    </div>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <form class="form-horizontal">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" >更新员工</h4>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label class="col-sm-2">员工姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_update" placeholder="员工姓名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2">员工邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update" placeholder="email@123.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2">员工性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update" value="1">男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update" value="2">女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2">部门名称</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="emp_updateDept" name="">
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                    <button type="button" id="btn_update" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>更新</button>
                </div>
            </div>
        </form>
    </div>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <form class="form-horizontal">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="myModalLabel">新增员工</h4>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label class="col-sm-2">员工姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add" placeholder="员工姓名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2">员工邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add" placeholder="email@123.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2">员工性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add" value="1">男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add" value="2">女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2">部门名称</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="emp_addDept" name="">
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                    <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
                </div>
            </div>
        </form>
    </div>


    <script>
        // 在页面加载完成后，使用ajax请求，向后端发送请求，要到返回的数据
        $(function(){
            $.ajax({
                url:"${APP_PATH}/getAll",
                data:"pn=1",
                type:"GET",
                success:function (result) {
                    //console.log(result)
                    // 1、 显示员工数据
                    build_emp(result);
                    // 2、 显示分页信息
                    build_page_info(result);
                    // 3、 显示分页条数据
                    build_navEle(result);
                }

        });
        });

        function build_emp(result) {
            var emps = result.extend.pageInfo.list;
            $.each(emps, function (index, item) {
                var empId = $("<td></td>").append(item.empId);
                var empName = $("<td></td>").append(item.empName);
                var gender = $("<td></td>").append(item.gender=='1' ? "男":"女");
                var email = $("<td></td>").append(item.email);
                var deptName = $("<td></td>").append(item.department.deptName);
                var edit = $("<button></button>").addClass("btn-success btn-sm update_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                edit.attr("editor_id", item.empId);
                var del = $("<button></button>").addClass("btn-danger btn-sm delete_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                del.attr("del_id", item.empId);
                var buttonTd = $("<td></td>").append(edit).append(" ").append(del);
                $("<tr></tr>").append(empId).append(empName).append(gender)
                .append(email).append(deptName)
                .append(buttonTd)
                .appendTo("#emp_tables tbody");
            });
        }
        function build_page_info(result) {
            $("#page_info").append("当前" + result.extend.pageInfo.pageNum + "页 共有"+
               result.extend.pageInfo.pages + "页，总" +
               result.extend.pageInfo.total + "条记录");
        }
        function build_navEle(result) {
            var ul = $("<ul></ul>").addClass("pagination").append()
            var firstPage = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
            var prePage = $("<li></li>").append($("<a></a>").append("&laquo;"));
            var nextPage = $("<li></li>").append($("<a></a>").append("&raquo;"));
            var lastPage = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
            ul.append(firstPage).append(prePage)
            var pNums = result.extend.pageInfo.navigatepageNums;
            $.each(pNums,function (index, item) {
                var numLi = $("<li></li>").append($("<a></a>").append(item));
                ul.append(numLi)
            });
            ul.append(nextPage).append(lastPage)
            var navEle = $("<nav></nav>").append(ul);
            navEle.appendTo("#page_area");
        }

        // 表单清空样式


          $("#btn_add").click(function () {
              $("#myModalLabel").text("新增员工信息");
              // 每次增加信息 时候需要重置表单信息，不止要清空表单的内容，还要清空表单的样式。
              clear_form('#myModal form');
              getDepts();
              $('#myModal').modal();
          });
         function clear_form(ele) {
             $(ele)[0].reset();
            // 重置表单的样式
             $(ele).find("*").removeClass("has-success has-error");
             $(ele).find(".help-block").text("");
         }
        function getDepts(ele){
            $.ajax({
                url:"${APP_PATH}/getDept",
                type:"GET",
                success: function (result) {
                    //console.log(result);
                    $.each(result.extend.depts, function () {
                        var optionEle = $("<option></option>").append(this).attr("value", 1);
                        optionEle.appendTo(ele)
                    })
                }
            });
        }
        $("#btn_submit").click(function () {
            // 1、保存的时候需要对表单的数据进行校验
            if (!validate_add_form()) {
                return false; //这里不能只写return， 会造成页面的模态框消失
            }
            if ($(this).attr("ajax-val") == "error") {
                return false;
            }

           $.ajax({
                url:"${APP_PATH}/employee",
                type:"POST",
                data: $("#myModal form").serialize(),
                success:function (result) {
                    alert(result.message);
                    $("#myModal").modal('hide');
                }
            });
        })
        function validate_add_form() {
            // 1、校验员工姓名
            var empName1 = $("#empName_add").val();
            var reg = /(^[a-zA-Z0-9_-]{6,16}$)/;
            if (!reg.test(empName1)) {
                show_validate("#empName_add", "error", "员工姓名为6-16个字符")
                return false;
            }
            // 2、校验员工邮箱
            var empEmail = $("#email_add").val();
            var regEmail =/^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
            if (!regEmail.test(empEmail)) {
                show_validate("#email_add", "error", "邮箱格式不正确")
                return false;
            }
            return true;
        }

        // 校验用户输入的信息
        function show_validate(ele, status, msg) {
            $(ele).parent().removeClass("has-success has-error");
            $(ele).next("span").text("");
            if ("success" == status) {
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            } else {
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
        }
        // 给输入框绑定单击事件，检查输入的用户的名称是否存在，利用ajax向服务器发送请求。
        $("#empName_add").change(function () {
            var name = this.value;
            $.ajax({
                url:"${APP_PATH}/employee/check",
                type:"POST",
                data:"empName="+name  ,
                success:function (result) {
                  if (result.code==100) {
                      show_validate("#empName_add", "success", "用户名可用");
                      $("#btn_submit").attr("ajax-val", "success");
                  }else {
                      show_validate("#empName_add", "error", result.extend.val_msg);
                      $("#btn_submit").attr("ajax-val", "error");
                  }
                }
            });
        });

        $(document).on("click", ".update_btn", function () {
            // 获取部门的信息
            getDepts("#updateModal select");
            // 获取员工的数据
            $('#btn_update').attr("update_id", $(this).attr("editor_id"));
            getEmp($(this).attr("editor_id"));
            $('#updateModal').modal();
        });

        function getEmp(id) {
            $.ajax({
                url:"${APP_PATH}/editor/"+ id,
                type:"GET",
                success:function (result) {
                    var empData = result.extend.emp;
                    //console.log("employee==" + empData);
                    console.log("result=>" + result);
                  $("#empName_update").val(empData.empName);
                  $("#email_update").val(empData.email);
                }
            });
        }

        $("#btn_update").click(function () {
            $.ajax({
                url:"${APP_PATH}/employee/update/" + $(this).attr("update_id"),
                type: "POST",
                data:$("#updateModal form").serialize(),
                success: function (result) {
                    alert(result.message);
                }
            })
        })

        $(document).on("click",".delete_btn", function () {
            // 拿到删除的id，
            if(confirm("确认删除吗？")) {
                $.ajax({
                    url:"${APP_PATH}/employee/delete/" +  $(this).attr("del_id"),
                    type:"POST",
                    success: function (result) {
                        alert(result.message);
                    }
                });
            }
        })
    </script>
</body>
</html>
