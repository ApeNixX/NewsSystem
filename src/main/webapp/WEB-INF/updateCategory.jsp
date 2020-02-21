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
    <title>form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<%=basePath%>assets/plugins/bootstrap-3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/main.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/index.css">
</head>
<body>
<!-- nav bar -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <span class="navbar-brand glyphicon glyphicon-arrow-left" id="toggleSidebar"></span>
            <a class="navbar-brand" href="index.action">首页</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="info.html">个人信息</a></li>
                <li><a href="#">设置</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">
                        系统 <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-left">
                        <li><a href="#">帮助</a></li>
                        <li><a href="#">关于</a></li>
                        <li><a href="logout.action">退出</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-right">
                <input class="form-control" placeholder="Search...">
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-1 sidebar">
            <div class="nav-sidebar">
                <div class="nav-sidebar-head">
                    <ul class="nav">
                        <li>
                            <a href="#group1" data-toggle="collapse">
                                <span class="glyphicon glyphicon-minus"></span>&nbsp;&nbsp;&nbsp;类型管理
                            </a>
                        </li>
                    </ul>
                </div>
                <div id="group1" class="nav-sidebar-body collapse in">
                    <ul class="nav">
                        <li><a href="categoryList.action">类型查看</a></li>
                        <li class="active"><a href="categoryAddPage.action">类型发布</a></li>
                    </ul>
                </div>
            </div>
            <div class="nav-sidebar">
                <div class="nav-sidebar-head">
                    <ul class="nav">
                        <li>
                            <a href="#group2" data-toggle="collapse">
                                <span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;&nbsp;新闻管理
                            </a>
                        </li>
                    </ul>
                </div>
                <div id="group2" class="nav-sidebar-body collapse">
                    <ul class="nav">
                        <li><a href="newsList.action" >新闻查看</a></li>
                        <li><a href="newsAdd.action">新闻发布</a></li>
                    </ul>
                </div>
            </div>

        </div>
        <!-- main content -->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main tab-content" id="mainContent">
            <!-- js generate -->
            <!--
            <div id="list" class="tab-pane active fade in">
                <iframe class="main-iframe" src="list.html" width="100%" frameborder="0" scrolling="auto"></iframe>
            </div>
            -->
        </div>
    </div>
</div>
<div class="page-header ">
    <h2 class="col-sm-offset-4 text-primary">更新新闻类型</h2>
</div>
<div class="container">
    <s:form method="post" action="categoryUpdated" class="form-horizontal">
        <div class="form-group">
            <label  class="col-sm-2 control-label">类型名</label>
            <div class="col-sm-3">
                <s:hidden name="category.id" id="id1" value="%{category.id}"/>
                <s:textfield style="margin-top:-55%;margin-left:110%" name="category.categoryName" value="%{category.categoryName}" class="form-control" placeholder="请输入标题"/>
            </div>
            <span id="error" style=" color: red ;font-size: 14px;margin-left: 50%;margin-top: -50%" >${msg1 }</span><br/>
        </div>




        <div class="row">
            <div class="col-sm-2 col-sm-offset-2">
                <button type="submit" id="b1" class="btn btn-success btn-lg btn-block glyphicon glyphicon-ok">&nbsp;更新</button>
            </div>
            <div class="col-sm-2">
                <button type="reset" class="btn btn-danger btn-lg btn-block glyphicon glyphicon-repeat">&nbsp;重置</button>
            </div>
        </div>
    </s:form>
</div>
<script src="<%=basePath%>assets/plugins/jquery-3.2.1/jquery-3.2.1.min.js"></script>
<script src="<%=basePath%>assets/plugins/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="<%=basePath%>assets/js/index.js"></script>
<script>
    // $(function(){
    //     $("#b1").click(function(){
    //         var id = $("#id1").attr();
    //         var href = this.href + "?cid=" + id;
    //         window.location.href = href;
    //         return false;
    //     });
    // })
</script>
</body>
</html>
