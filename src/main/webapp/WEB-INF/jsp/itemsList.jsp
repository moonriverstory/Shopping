<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>查询商品列表</title>
    <script type="text/javascript">
        function deleteItems() {
            //将form的action指向删除商品的地址
            document.itemsForm.action = "<c:url value='/'/>items/deleteItems";
            //进行form提交
            document.itemsForm.submit();
        }
    </script>
</head>
<body>

<form name="itemsForm" action="<c:url value='/'/>items/queryItems" method="post">
    查询条件：
    <table width="100%" border=1>
        <tr>
            <th>
                商品名称
            </th>
            <td>
               <input type="text" name="itemName" value="${itemName}"/>
            </td>
            <td><input type="submit" value="查询"/>
                <input type="button" value="删除" onclick="deleteItems()">
            </td>
        </tr>
    </table>
    商品列表：
    <table width="100%" border=1>
        <tr>
            <td></td>
            <td>商品名称</td>
            <td>商品价格</td>
            <td>生产日期</td>
            <td>商品描述</td>
            <td>操作</td>
            <td>restful链接</td>
        </tr>
        <c:forEach items="${itemsList}" var="item">
            <tr>
                <td><input type="checkbox" name="delete_id" value="${item.id}"></td>
                <td>${item.name}</td>
                <td>${item.price}</td>
                <td><fmt:formatDate value="${item.createtime}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
                <td>${item.detail }</td>
                <td>
                    <!--有item:update权限才现实修改链接，没有权限则不显示修改链接-->
                    <shiro:hasPermission name="item:update">
                        <a href="<c:url value='/'/>items/editItems?id=${item.id}">修改</a>
                    </shiro:hasPermission>
                </td>
                <td><a href="<c:url value='/'/>items/viewItems/${item.id}">商品查看</a></td>
            </tr>
        </c:forEach>
    </table>
</form>
</body>

</html>