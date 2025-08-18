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
<head><title>Create User</title></head>
<body>
<h2>Thêm mới User</h2>
<form action="/users?action=create" method="post">
    Name: <input type="text" name="name"><br>
    Email: <input type="text" name="email"><br>
    Country: <input type="text" name="country"><br>
    <input type="submit" value="Save">
</form>
<form>
    <a href="user/createTransaction.jsp">Thêm User Transaction (Test Rollback)</a>
</form>
</body>
</html>

