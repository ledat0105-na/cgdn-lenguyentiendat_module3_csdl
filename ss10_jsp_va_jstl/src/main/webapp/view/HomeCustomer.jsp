<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh sách khách hàng</title>
    <style>
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
        }
        img {
            width: 80px;
            height: auto;
        }
    </style>
</head>
<body>
<h2 style="text-align:center;">Danh sách khách hàng</h2>
<table>
    <tr>
        <th>STT</th>
        <th>Họ tên</th>
        <th>Email</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach items="${listCustomer}" var="customer" varStatus="status">
        <tr>
            <td>${status.index + 1}</td>
            <td>${customer.name}</td>
            <td>${customer.email}</td>
            <td>${customer.address}</td>
            <td><img src="${pageContext.request.contextPath}/images/${customer.image}" alt="Ảnh"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
