<%--
  Created by IntelliJ IDEA.
  User: LEDAT
  Date: 8/15/2025
  Time: 8:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>List Users</title></head>
<body>
<h2>Danh sách User</h2>
<a href="/users?action=create">Thêm mới User</a>
<table border="1" cellpadding="5">
  <tr>
    <th>ID</th><th>Name</th><th>Email</th><th>Country</th><th>Action</th>
  </tr>
  <c:forEach var="u" items="${listUser}">
    <tr>
      <td>${u.id}</td>
      <td>${u.name}</td>
      <td>${u.email}</td>
      <td>${u.country}</td>
      <td>
        <a href="/users?action=edit&id=${u.id}">Edit</a>
      </td>
    </tr>
  </c:forEach>
</table>
</body>
</html>

