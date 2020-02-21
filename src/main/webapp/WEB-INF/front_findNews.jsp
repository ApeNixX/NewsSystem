<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新闻列表</title>
    <link rel="stylesheet" href="<%=basePath%>assets/plugins/bootstrap-3.3.7/css/bootstrap.min.css">
    <script src="<%=basePath%>assets/plugins/jquery-3.2.1/jquery-3.2.1.min.js"></script>
    <script src="<%=basePath%>assets/plugins/bootstrap-3.3.7/js/bootstrap.min.js"></script>
    <style>

        .navbar-list li:hover{

            color: #555;

            background-color: #e7e7e7;

        }

        .navbar-right li:active{

            color: #555;

            background-color: #e7e7e7;

        }


        a:hover{

            text-decoration: none;

        }

        img{

            display: block;

            max-width: 100%;

            border-radius: 5px;

        }

        .avatar img{

            display: inline-block;

            width: 18px;

            height: 18px;

            margin-right: 3px;

        }

        .blog-list-item{

            padding-bottom: 15px;

            padding-top: 15px;

            border-bottom: 1px solid #adadad;

        }

        .blog-list-item:last-child{

            border-bottom: 0;

        }

        .blog-list-item:first-child{

            padding-top: 0;

        }

        .blog-list-item .title{

            display: block;

            font-size: 18px;

            font-weight: bold;

            line-height: 2;

            margin-bottom: 15px;

            color: black;

        }

        .blog-list-item .title:hover {

            color: #9d9d9d;

        }

        .blog-list-item .info{

            color: #9d9d9d;

        }


        .side-bar-card{

            background: rgba(0,0,0,.06);

            padding: 15px 0;

            border-radius: 5px;

        }

        .side-bar-card .side-bar-introduction{

            padding-left: 5px;

            line-height: 1.8;

            color: #9d9d9d;

            font-size: 15px;

        }

        .side-bar-card .side-bar-phone{

            line-height: 1.5;

            font-size: 13px;

        }

        .side-bar-recommend{

            margin-top: 10px;

        }

        .side-bar-card .side-bar-title{

            padding-left: 15px;

            padding-bottom: 15px;

        }

        .side-bar-recommend .side-bar-list .side-bar-item{

            padding: 15px 15px;

        }

        .side-bar-recommend .side-bar-list .side-bar-item:hover{

            padding: 15px 15px;

            background-color: rgba(0,0,0, .09);

        }

        .side-bar-recommend .side-bar-list .side-item-title{

            color: black;

        }

        .side-bar-recommend .side-bar-list .side-item-title:hover{

            color: #9d9d9d;

        }

        .side-bar-recommend .side-bar-list .side-item-info{

            color: #9d9d9d;

            font-size: 12px;

        }


        .modal-footer{
            margin-top: 200px;

        }


        .side-bar .list-group-item {

            border: 0;

            margin-bottom: 5px;

            border-radius: 5px;

        }

        .side-bar .list-group-item .active {

            background-color: #337ab7;

        }



    </style>
</head>
<body>


<div class="navbar navbar-default" style="height: 15px;">

    <div class="container">

        <div class="navbar-header">

            <a class="navbar-brand" href="frontPage.action">Sise New</a>

        </div>

        <div class="col-sm-offset-2">

            <ul class="nav navbar-nav navbar-list">
                <s:iterator value="categorys" var="category" status="stu">
                    <li><a href="frontFindNewsByCategory.action?cid=<s:property value="#category.id" />">
                        <s:property value="#category.categoryName" />
                    </a></li>
                </s:iterator>
                <form action="frontFindNewsByTime.action" method="post">
                    <div class="panel-body form-inline" style="margin-right: -100%;margin-top: -1%;">
                        <input type="date" class="form-control" name="startDate">
                        <span>至</span></li>
                        <input type="date" class="form-control" name="endDate"></li>
                        <input type="submit" class="btn btn-default" value="搜索">

                    </div>
                </form>
            </ul>

        </div>

        <ul class="nav navbar-nav navbar-right">

            <li><a href="loginPage">登陆</a></li>

            <li><a href="#">注册</a></li>

        </ul>

    </div>

</div>



<div class="container">

    <div class="row">

        <div class="col-sm-2">

            <div class="list-group side-bar">
                <s:iterator value="categorys" var="category" status="stu">

                    <a href="frontFindNewsByCategory.action?cid=<s:property value="#category.id" />" class="list-group-item " role="button">
                        <s:property value="#category.categoryName" /></a>
                </s:iterator>


            </div>

        </div>


        <div class="col-sm-7">

            <div class="blog-list">
                <s:iterator value="newses" var="news">

                    <div class="blog-list-item clearfix">

                        <div class="col-xs-5">

                            <img src="<s:property value="#news.imgs"/>">

                        </div>

                        <div class="">

                            <a href="frontNewsDetail.action?cid=<s:property value="#news.id"/>" class="title">

                                <s:property value="#news.title"/>
                            </a>

                            <div class="info">

                                <%--<span class="avatar"><img src="<%=basePath%>assets/images/user_face.jpg"--%>

                                                          <%--alt="avatar"></span>--%>

                                <span><s:property value="#news.froms"/></span> |

                                <span><s:property value="#news.clicks"/>阅读</span>

                                <span class="glyphicon glyphicon-thumbs-up blog-hot" aria-hidden="true"></span> |

                                <span><s:property value="#news.issueTime"/></span>

                            </div>

                        </div>

                    </div>
                </s:iterator>


            </div>




        </div>


        <div class="col-sm-3">

            <div class="search-bar">

                <form role="form" method="post" action="frontFindNewsByTitle.action">

                    <div class="form-group has-feedback">

                        <label class="sr-only" for="Search">Search：</label>

                        <input type="search" class="form-control" placeholder="搜索" id="Search" name="title">

                        <span class="glyphicon glyphicon-search form-control-feedback"></span>

                    </div>

                </form>

            </div>

            <div class="side-bar-card clearfix">

                <div class="card">
                    <div class="side-bar-title"> <div class="card-header">公告</div></div>
                    <div class="card-body" style="margin-left:20px;">新闻管理系统v1.0</div>
                </div>

            </div>

            <div class="side-bar-card side-bar-recommend clearfix">

                <div class="side-bar-title">推荐阅读</div>

                <div class="side-bar-body">

                    <div class="side-bar-list">
                        <div class="side-bar-item">
                            <a href="frontNewsDetail.action?cid=${session.clicks.get(0).getId()}" class="side-item-title">${session.clicks.get(0).getTitle()}</a>
                            <div class="side-item-info">${session.clicks.get(0).getClicks()}阅读 | ${session.clicks.get(0).getIssueTime()}</div>
                        </div>
                        <div class="side-bar-item">
                            <a href="frontNewsDetail.action?cid=${session.clicks.get(1).getId()}" class="side-item-title">${session.clicks.get(1).getTitle()}</a>
                            <div class="side-item-info">${session.clicks.get(1).getClicks()}阅读 | ${session.clicks.get(1).getIssueTime()}</div>
                        </div>
                        <div class="side-bar-item">
                            <a href="frontNewsDetail.action?cid=${session.clicks.get(2).getId()}" class="side-item-title">${session.clicks.get(2).getTitle()}</a>
                            <div class="side-item-info">${session.clicks.get(2).getClicks()}阅读 | ${session.clicks.get(2).getIssueTime()}</div>
                        </div>
                        <div class="side-bar-item">
                            <a href="frontNewsDetail.action?cid=${session.clicks.get(3).getId()}" class="side-item-title">${session.clicks.get(3).getTitle()}</a>
                            <div class="side-item-info">${session.clicks.get(3).getClicks()}阅读 | ${session.clicks.get(3).getIssueTime()}</div>
                        </div>
                        <div class="side-bar-item">
                            <a href="frontNewsDetail.action?cid=${session.clicks.get(4).getId()}" class="side-item-title">${session.clicks.get(4).getTitle()}</a>
                            <div class="side-item-info">${session.clicks.get(4).getClicks()}阅读 | ${session.clicks.get(4).getIssueTime()}</div>
                        </div>
                    </div>

                </div>

            </div>

        </div>


    </div>

</div>

<div class="modal-footer">

    <address class="text-center">

        <p> ©2019-2020新闻管理系统 </p>

        <div href="#">ApeNixX</div>

    </address>

</div>


</body>
</html>
