<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
<h2>Edit Product</h2>
<form action="/products" method="post">
    <input type="hidden" name="action" value="edit"/>
    <input type="hidden" name="id" value="${product.id}"/>
    <label>Name: <input type="text" name="name" value="${product.name}"/></label><br/>
    <label>Price: <input type="number" name="price" value="${product.price}" step="0.01"/></label><br/>
    <label>Description: <input type="text" name="description" value="${product.description}"/></label><br/>
    <label>Manufacturer: <input type="text" name="manufacturer" value="${product.manufacturer}"/></label><br/>
    <label>Category:
        <select name="category">
            <c:forEach items="${categories}" var="category">
                <option value="${category.id}" <c:if test="${category.id == product.categoryId}">selected</c:if>>${category.name}</option>
            </c:forEach>
        </select>
    </label><br/>
    <input type="submit" value="Update"/>
</form>
<a href="/products">Back to list</a>
</body>
</html>
