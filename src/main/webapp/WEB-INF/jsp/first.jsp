<!DOCTYPE html>
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
            var item = {'id': '1', 'name': '首页', 'url': "<c:url value='/welcome.jsp'/>", 'closable': false};
            closableTab.addTab(item);
        });

        //退出系统方法
        function logout() {
            $.confirm({
                title: 'Confirm!',
                content: '您确定要退出本系统吗?',
                buttons: {
                    "确定": function () {
                        location.href = "<c:url value='/'/>logout";
                    },
                    "取消": function () {
                        $.alert('Canceled!');
                    }
                }
            });
        }

        //帮助
        function show_help() {
            window.open("<c:url value='/help/help.html'/>", '帮助文档');
        }

        //添加右侧主窗标签页
        function addWindowTab(name, url) {
            //js正则表达式不要用单引号或者双引号括起来，要以两个斜线/ /括起来，g代表全部匹配都算
            var item = {'id': url.replace(/\//g,''), 'name': name, 'url': url, 'closable': true};
            closableTab.addTab(item);
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
                <input type="text" class="form-control"/>
            </div>
            <button type="submit" class="btn btn-default">TODO</button>
        </form>
        <ul class="nav navbar-nav navbar-right">
            <li>
                <a href="javascript:show_help()">帮助</a>
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
                            <a href="javascript:addWindowTab('${menu.name}','${menu.url}')">${menu.name}</a>
                        </li>
                    </c:forEach>
                </ul>
            </c:if>
        </div>
        <!-- 右侧主窗体 -->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <!-- Dynamic tabs 相关代码 begin -->
            <ul class="nav nav-tabs" role="tablist">
            </ul>
            <div class="tab-content" style="width:100%;">
            </div>
            <!-- Dynamic tabs 相关代码 end -->
        </div>
    </div>
</div>


</body>
</html>
