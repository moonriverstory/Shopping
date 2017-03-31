<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/jsp/common_js.jsp" %>
<%@ include file="/WEB-INF/jsp/common_css.jsp" %>

<html>
<head>
    <title>商品查询购买系统</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="icon" href="http://v3.bootcss.com/favicon.ico">

    <script type="text/javascript">
        //登录提示方法
        function loginsubmit() {
            $("#loginform").submit();
        }
    </script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form class="form-signin" id="loginform" name="loginform" action="<c:url value='/'/>login" method="post">
                <div class="form-group">
                    <label for="username">用户名</label><input type="text" name="username" class="form-control" id="username" style="WIDTH: 300px"/>
                </div>
                <div class="form-group">
                    <label for="Password1">密 码</label><input type="password" name="password" class="form-control" id="Password1" style="WIDTH: 300px" />
                </div>
                <div class="form-group">
                    <label>验证码</label>
                    <input name="randomcode" size="8"/>
                    <img id="randomcode_img" src="<c:url value='/validatecode.jsp'/>" alt="" width="56" height="20" align='absMiddle'/>
                    <a href=javascript:randomcode_refresh()>刷新</a><!-- TODO -->
                </div>
                <div class="checkbox">
                    <label><input type="checkbox" name="rememberMe"/>自动登录</label>
                </div>
                <button type="submit" class="btn btn-lg btn-primary btn-block" onclick="loginsubmit()">登录</button>
            </form>
        </div>
    </div>
</div>

</body>
</HTML>
