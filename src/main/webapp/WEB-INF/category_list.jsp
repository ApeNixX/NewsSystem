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
    <link rel="stylesheet" href="<%=basePath%>assets/css/main.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/list.css">
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
                <li><a href="#">个人信息</a></li>
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
<!--left bar-->
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
                        <li class="active"><a href="categoryList.action" >类型查看</a></li>
                        <li><a href="categoryAddPage.action">类型发布</a></li>
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
<div class="container">
    <div class="page-header text-center">
        <h2 class="text-primary">类型查看</h2>
    </div>


    <div class="btn-group">
        <button class="btn btn-success glyphicon glyphicon-plus" data-toggle="modal"
                data-target="#addDiv">增加类型
        </button>
        <button class="btn btn-danger glyphicon glyphicon-trash" id="multiDeleteBtn"
                type="button" data-container="body" data-content="请至少选择一个"
                data-toggle="popover" data-placement="right" data-trigger="manual">批量删除
        </button>
    </div>
    <div class="btn-group pull-right">
        <button class="btn btn-primary glyphicon glyphicon-th" data-toggle="dropdown" title="列">
            <span class="caret"></span>
        </button>
        <ul class="dropdown-menu" id="dropdownMenu1">
            <!--<li>
                <label>
                    <input type="checkbox" checked="checked">ID
                </label>
            </li>-->
        </ul>
        <button class="btn btn-warning glyphicon glyphicon-refresh" id="refreshBtn" title="刷新"></button>
    </div>
    <%--<div class="alert alert-danger alert-dismissible fade in text-center"--%>
         <%--id="deleteConfirm" style="display: none">--%>
        <%--<button type="button" class="close">--%>
            <%--<span class="glyphicon glyphicon-remove"></span>--%>
        <%--</button>--%>
        <%--<h4>确认删除？</h4>--%>
        <%--<p>--%>
            <%--<s:a href="categoryDelete.action?cid=%{#category.id}" class="btn btn-danger confirm">确定</s:a>--%>
                <%--<!--<a  href="categoryDelete.action?cid=%{#category.id}" class="btn btn-danger confirm">确定</a>-->--%>
                <%--<button type="button" class="btn btn-default">取消</button>--%>
        <%--</p>--%>
    <%--</div>--%>
    <div class="modal fade" id="addDiv">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span class="glyphicon glyphicon-remove"></span>
                    </button>
                    <h4 class="text-center">add user</h4>
                </div>
                <form action="#" method="post">
                    <div class="modal-body form-group">
                        <label for="usernameInput">username</label>
                        <input type="text" id="usernameInput" name="username">
                    </div>
                    <div class="modal-body form-group">
                        <label for="passwordInput">password</label>
                        <input type="password" id="passwordInput" name="password">
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" data-dismiss="modal">
                            summit
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="table-responsive" id="tableBlock">
        <table class="table table-striped table-hover table-condensed">
            <thead>
            <tr>
                <th></th>
                <th><input type="checkbox" title="全选" id="selectAllCheckBox"/></th>
                <th>序号</th>
                <th>类型</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <s:iterator value="categorys" var="category" status="stu">
            <tr>
                <td class="text-center">
                    <span class="detail glyphicon glyphicon-plus" title="详情"></span>
                </td>
                <td><input type="checkbox" class="single-checkbox" title="select"></td>
                <td><s:property value="#stu.count"/></td>
                <td><s:property value="#category.categoryName" /></td>
                <td>
                    <s:a href="categoryUpdate.action?cid=%{#category.id}" class="btn btn-primary glyphicon glyphicon-pencil" title="编辑"></s:a>
                    <s:a href="categoryDelete.action?cid=%{#category.id}" class="btn btn-danger glyphicon glyphicon-trash btn-single-delete" title="删除" onclick="return confirm('确定删除?');"></s:a>
                </td>
            </tr>
            </s:iterator>
            <span id="error" style=" color: red ;font-size: 14px;margin-left: 50%;margin-top: -50%" >${msg2 }</span><br/>
            </tbody>
        </table>
    </div>

</div>

<script src="<%=basePath%>assets/plugins/jquery-3.2.1/jquery-3.2.1.min.js"></script>
<script src="<%=basePath%>assets/plugins/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="<%=basePath%>assets/js/list.js"></script>
<script src="<%=basePath%>assets/js/index.js"></script>

</body>
</html>