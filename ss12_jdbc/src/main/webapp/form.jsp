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
    <title>Add User</title>
    <style>
        body { font-family: Arial; padding: 20px; }
        form { width: 300px; margin: auto; }
        label { display: block; margin-top: 10px; }
        input { width: 100%; padding: 5px; }
        button { margin-top: 10px; padding: 5px 10px; }
    </style>
</head>
<body>
<h2>Add New User</h2>
<form action="/users?action=create" method="post">
    <label>Name: <input type="text" name="name" required></label>
    <label>Email: <input type="email" name="email" required></label>
    <label>Country: <input type="text" name="country" required></label>
    <button type="submit">Save</button>
</form>
</body>
</html>

