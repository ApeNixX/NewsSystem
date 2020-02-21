<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<%=basePath%>assets/plugins/bootstrap-3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/login.css">
</head>
<body onload="checkLogin()">

<div class="container">
    <form class="form-signin" action="login.action" method="post">
        <h2 class="form-signin-heading">新闻管理系统后台</h2>
        <div class="form-group input-lg">
            <span class="glyphicon glyphicon-user"></span>
            <label for="inputAccountName"></label>
            <input id="inputAccountName" name="username" placeholder="请输入用户名：" required autofocus>
        </div>
        <div class="form-group input-lg">
            <span class="glyphicon glyphicon-lock"></span>
            <label for="inputPassword"></label>
            <input type="password" name="password" id="inputPassword" placeholder="请输入密码：" required>
        </div>
        <div class="checkbox input-lg">
            <label>
                <input type="checkbox" value="remember-me"> Remember me
            </label>
        </div>
        <button class="btn btn-primary btn-lg btn-block" type="submit">Sign in</button>
    </form>
</div>
<input type="hidden" id="msg" value="<s:property value="str"/>"/>

<script src="<%=basePath%>assets/plugins/jquery-3.2.1/jquery-3.2.1.min.js"></script>
<script src="<%=basePath%>assets/plugins/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function checkLogin(){
        var s=document.getElementById("msg").value;
        if(s!=""){
            alert(s);
        }
    }
</script>
</body>
</html>