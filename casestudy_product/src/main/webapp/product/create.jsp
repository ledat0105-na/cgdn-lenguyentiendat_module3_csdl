<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create Product</title>
</head>
<body>
<h2>Create New Product</h2>
<form action="/products" method="post">
    <input type="hidden" name="action" value="create"/>
    <label>Name: <input type="text" name="name"/></label><br/>
    <label>Price: <input type="number" name="price" step="0.01"/></label><br/>
    <label>Description: <input type="text" name="description"/></label><br/>
    <label>Manufacturer: <input type="text" name="manufacturer"/></label><br/>
    <label>Category:
        <select name="category">
            <c:forEach items="${categories}" var="category">
                <option value="${category.id}">${category.name}</option>
            </c:forEach>
        </select>
    </label><br/>
    <input type="submit" value="Create"/>
</form>
<a href="/products">Back to list</a>
</body>
</html>
