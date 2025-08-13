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
    <title>Chi tiết sản phẩm</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .product-detail {
            max-width: 500px;
            margin: 30px auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .product-detail p {
            font-size: 16px;
            margin: 10px 0;
        }

        .product-detail strong {
            color: #4CAF50;
        }

        a {
            display: inline-block;
            margin-top: 15px;
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }

        a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<h2>Chi tiết sản phẩm</h2>

<div class="product-detail">
    <c:if test="${not empty product}">
        <p><strong>Tên:</strong> ${product.name}</p>
        <p><strong>Giá:</strong> ${product.price}</p>
        <p><strong>Mô tả:</strong> ${product.description}</p>
        <p><strong>Nhà sản xuất:</strong> ${product.manufacturer}</p>
    </c:if>
    <a href="${pageContext.request.contextPath}/products">⬅ Trở lại</a>
</div>

</body>
</html>
