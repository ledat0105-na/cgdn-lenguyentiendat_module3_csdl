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
<head><title>Edit User</title></head>
<body>
<h2>Chỉnh sửa User</h2>
<form>
    ID: ${user.id} <br>
    Name: ${user.name} <br>
    Email: ${user.email} <br>
    Country: ${user.country} <br>
</form>
</body>
</html>

