<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/jsp/common_css.jsp" %>
<%@ include file="/WEB-INF/jsp/common_js.jsp" %>


<html>
<head>
    <link rel="icon" href="http://v3.bootcss.com/favicon.ico">
    <title>采购平台</title>

<script type="text/javascript">
    //预加载方法
    $(function () {


    });

    //退出系统方法
    function logout() {
        _confirm('您确定要退出本系统吗?', null,
                function () {
                    location.href = "<c:url value='/'/>logout";
                }
        )
    }

    //帮助
    function showhelp() {
        window.open("<c:url value='/'/>" + "help/help.html", '帮助文档');
    }
</script>
</head>

<body>

<!--上部导航-->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-header">
        <a class="navbar-brand">Shopping Center</a>
    </div>
    <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
            <li>
                <a style="color: green">欢迎当前用户：${activeUser.username}</a>
            </li>
        </ul>
        <form class="navbar-form navbar-left" role="search">
            <div class="form-group">
                <input type="text" class="form-control" />
            </div> <button type="submit" class="btn btn-default">TODO</button>
        </form>
        <ul class="nav navbar-nav navbar-right">
            <li>
                <a href="javascript:showhelp()">帮助</a>
            </li>
            <li>
                <a href="<c:url value='/'/>user/updatepwd">修改密码</a>
            </li>
            <li>
                <a href="javascript:logout()">退出系统</a>
            </li>
        </ul>
    </div>
</nav>

<!--中部-->
<div class="container-fluid">
    <div class="row">
        <!-- 左侧导航 -->
        <div class="col-sm-3 col-md-2 sidebar">
            <c:if test="${activeUser.menus!=null}">
                <ul class="nav nav-sidebar">
                    <c:forEach items="${activeUser.menus}" var="menu">
                        <li>
                            <a href="javascript:addTab('${menu.url}')">${menu.name}</a>
                        </li>
                    </c:forEach>
                </ul>
            </c:if>
        </div>
        <!-- 右侧主窗体 -->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="jumbotron">
                <h1>
                    Tab
                </h1>
                <p>
                    Main Window.
                </p>
                <p>
                    <a class="btn btn-primary btn-large" href="#">Learn more</a>
                </p>
            </div>
            <!--底部地址-->
            <div class="row clearfix" style="margin-left: 7%;width: 80%">
                <div class="col-md-12 column">
                    <address> <strong>Twitter, Inc.</strong><br/> 25 Culture Road, WestLake <br/> Hangzhou, ZJ<br/> <abbr title="Phone">P:</abbr> (123) 456-7890</address>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
