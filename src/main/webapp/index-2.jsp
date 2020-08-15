<%--
  Created by IntelliJ IDEA.
  User: machd
  Date: 2020/6/6
  Time: 12:57 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:forward page="/emps"></jsp:forward>
<html>
<head>
<%--    <title>Title</title>
    <!--引入 jquery -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</head>--%>

<script type="text/javascript" src="static/js/jquery-3.5.1.min.js"></script>
<body>

    <button class="button">按钮 </button>
    <p>你好</p>
    <div id="test">测试标签</div>
    <script>
      $("button").click(
          function () {
            $("#test").hide();
          }
      );


    </script>
</body>
<script>
</script>
</html>
