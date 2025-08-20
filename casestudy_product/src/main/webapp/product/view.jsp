<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>View Product</title>
</head>
<body>
<h2>Product Detail</h2>
<table border="1" cellpadding="5">
    <tr><th>ID:</th><td>${product.id}</td></tr>
    <tr><th>Name:</th><td>${product.name}</td></tr>
    <tr><th>Price:</th><td>${product.price}</td></tr>
    <tr><th>Description:</th><td>${product.description}</td></tr>
    <tr><th>Manufacturer:</th><td>${product.manufacturer}</td></tr>
    <tr>
        <th>Category:</th>
        <td>
            <c:forEach items="${categories}" var="cat">
                <c:if test="${cat.id == product.categoryId}">${cat.name}</c:if>
            </c:forEach>
        </td>
    </tr>
</table>
<a href="/products">Back to list</a>
</body>
</html>
