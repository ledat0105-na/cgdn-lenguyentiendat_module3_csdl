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
    <title>Xóa sản phẩm</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #d32f2f;
        }

        .container {
            background: white;
            max-width: 500px;
            margin: 0 auto;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            text-align: center;
        }

        p {
            font-size: 16px;
            margin-bottom: 20px;
        }

        strong {
            color: #000;
        }

        button {
            padding: 10px 16px;
            background-color: #e53935;
            border: none;
            color: white;
            font-size: 14px;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #d32f2f;
        }

        a {
            display: inline-block;
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
<h2>Xóa sản phẩm</h2>
<div class="container">
    <c:if test="${not empty product}">
        <p>Bạn có chắc muốn xóa sản phẩm: <strong>${product.name}</strong> ?</p>
        <form action="${pageContext.request.contextPath}/products" method="post">
            <input type="hidden" name="action" value="delete"/>
            <input type="hidden" name="id" value="${product.id}"/>
            <button type="submit">Xóa</button>
        </form>
    </c:if>
    <a href="${pageContext.request.contextPath}/products">Hủy</a>
</div>
</body>
</html>
