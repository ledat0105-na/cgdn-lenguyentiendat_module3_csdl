<%--
  Created by IntelliJ IDEA.
  User: LEDAT
  Date: 8/13/2025
  Time: 8:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User List</title>
    <style>
        body { font-family: Arial; padding: 20px; }
        table { border-collapse: collapse; width: 100%; }
        th, td { padding: 8px; border: 1px solid #ddd; }
        th { background-color: #f2f2f2; }
        a { text-decoration: none; color: blue; }
    </style>
</head>
<body>
<h2>User List</h2>
<a href="/users?action=create">Add User</a> | <a href="/users?action=search">Search</a>
<br><br>
<table>
    <tr>
        <th>ID</th><th>Name</th><th>Email</th><th>Country</th>
    </tr>
    <c:forEach var="u" items="${users}">
        <tr>
            <td>${u.id}</td>
            <td>${u.name}</td>
            <td>${u.email}</td>
            <td>${u.country}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

