<%--
  Created by IntelliJ IDEA.
  User: LEDAT
  Date: 8/11/2025
  Time: 4:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm sản phẩm</title>
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
            background: white;
            max-width: 500px;
            margin: 0 auto;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        label {
            display: block;
            margin-top: 12px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 8px;
            margin-top: 4px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        textarea {
            resize: vertical;
        }

        button {
            margin-top: 16px;
            padding: 10px 16px;
            background-color: #4CAF50;
            border: none;
            color: white;
            font-size: 14px;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
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
<h2>Thêm sản phẩm</h2>
<form action="${pageContext.request.contextPath}/products" method="post">
    <input type="hidden" name="action" value="create" />
    <label>Tên:</label>
    <input type="text" name="name" required/>

    <label>Giá:</label>
    <input type="number" step="0.01" name="price" required/>

    <label>Mô tả:</label>
    <textarea name="description"></textarea>

    <label>Nhà sản xuất:</label>
    <input type="text" name="manufacturer"/>

    <button type="submit">Lưu</button>
</form>
<div style="text-align: center;">
    <a href="${pageContext.request.contextPath}/products">Trở lại</a>
</div>
</body>
</html>