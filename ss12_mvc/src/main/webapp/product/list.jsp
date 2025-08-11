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
    <title>Danh sách sản phẩm</title>
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

        form {
            max-width: 800px;
            margin: 0 auto 15px auto;
            display: flex;
            gap: 10px;
            align-items: center;
        }

        input[type="text"] {
            flex: 1;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            padding: 8px 16px;
            border: none;
            background-color: #4CAF50;
            color: white;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        form a {
            padding: 8px 12px;
            background-color: #2196F3;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }

        form a:hover {
            background-color: #0b7dda;
        }

        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        a.action-link {
            color: #2196F3;
            text-decoration: none;
            font-weight: bold;
        }

        a.action-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h2>Danh sách sản phẩm</h2>

<form action="${pageContext.request.contextPath}/products" method="get">
    <input type="hidden" name="action" value="search"/>
    <input type="text" name="keyword" placeholder="Tìm theo tên..." />
    <button type="submit">Tìm</button>
    <a href="${pageContext.request.contextPath}/products?action=create">Thêm mới</a>
</form>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Tên</th>
        <th>Giá</th>
        <th>Nhà sản xuất</th>
        <th>Hành động</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="p" items="${listProducts}">
        <tr>
            <td>${p.id}</td>
            <td>${p.name}</td>
            <td>${p.price}</td>
            <td>${p.manufacturer}</td>
            <td>
                <a class="action-link" href="${pageContext.request.contextPath}/products?action=view&id=${p.id}">Xem</a> |
                <a class="action-link" href="${pageContext.request.contextPath}/products?action=edit&id=${p.id}">Sửa</a> |
                <a class="action-link" href="${pageContext.request.contextPath}/products?action=delete&id=${p.id}">Xóa</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
