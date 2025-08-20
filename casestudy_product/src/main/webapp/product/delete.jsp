<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Delete Product</title>
</head>
<body>
<h2>Are you sure you want to delete this product?</h2>
<p><strong>${product.name}</strong></p>
<form action="/products" method="post">
    <input type="hidden" name="action" value="delete"/>
    <input type="hidden" name="id" value="${product.id}"/>
    <input type="submit" value="Delete"/>
</form>
<a href="/products">Cancel</a>
</body>
</html>
