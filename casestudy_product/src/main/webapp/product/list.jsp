<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
<h2>Product List</h2>

<form action="/products" method="get">
    <input type="hidden" name="action" value="search"/>
    <input type="text" name="searchName" placeholder="Search by name"/>
    <input type="submit" value="Search"/>
</form>

<a href="/products?action=create">Create New Product</a>

<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>ID</th><th>Name</th><th>Price</th><th>Description</th><th>Manufacturer</th><th>Category</th><th>Actions</th>
    </tr>
    <c:forEach items="${listProducts}" var="product">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.description}</td>
            <td>${product.manufacturer}</td>
            <td>
                <c:forEach items="${categories}" var="cat">
                    <c:if test="${cat.id == product.categoryId}">${cat.name}</c:if>
                </c:forEach>
            </td>
            <td>
                <a href="/products?action=view&id=${product.id}">View</a> |
                <a href="/products?action=edit&id=${product.id}">Edit</a> |
                <a href="/products?action=delete&id=${product.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
