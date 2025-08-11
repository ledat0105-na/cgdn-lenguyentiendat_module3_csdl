<%--
  Created by IntelliJ IDEA.
  User: LEDAT
  Date: 8/11/2025
  Time: 4:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Sửa sản phẩm</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #1976d2;
        }

        .container {
            background: white;
            max-width: 500px;
            margin: 0 auto;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        label {
            display: block;
            font-weight: bold;
            margin-top: 10px;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 8px;
            margin-top: 4px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        textarea {
            height: 80px;
            resize: vertical;
        }

        button {
            margin-top: 15px;
            padding: 10px 16px;
            background-color: #1976d2;
            border: none;
            color: white;
            font-size: 14px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #1565c0;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 16px;
            text-decoration: none;
            color: #2196F3;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h2>Sửa sản phẩm</h2>
<div class="container">
    <c:if test="${not empty product}">
        <form action="${pageContext.request.contextPath}/products" method="post">
            <input type="hidden" name="action" value="edit" />
            <input type="hidden" name="id" value="${product.id}" />
            <label>Tên:</label>
            <input type="text" name="name" value="${product.name}" required/>

            <label>Giá:</label>
            <input type="number" step="0.01" name="price" value="${product.price}" required/>

            <label>Mô tả:</label>
            <textarea name="description">${product.description}</textarea>

            <label>Nhà sản xuất:</label>
            <input type="text" name="manufacturer" value="${product.manufacturer}"/>

            <button type="submit">Cập nhật</button>
        </form>
    </c:if>
    <a href="${pageContext.request.contextPath}/products">Trở lại</a>
</div>
</body>
</html>
