<%--
  Created by IntelliJ IDEA.
  User: LEDAT
  Date: 8/13/2025
  Time: 8:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search User by Country</title>
    <style>
        body { font-family: Arial; padding: 20px; }
        form { margin-bottom: 20px; }
        table { border-collapse: collapse; width: 100%; }
        th, td { padding: 8px; border: 1px solid #ddd; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
<h2>Search by Country</h2>
<form action="/users?action=search" method="post">
    <input type="text" name="country" placeholder="Enter country">
    <button type="submit">Search</button>
</form>

<c:if test="${not empty users}">
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
</c:if>
</body>
</html>

