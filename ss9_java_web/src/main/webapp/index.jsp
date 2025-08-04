<%--
  Created by IntelliJ IDEA.
  User: LEDAT
  Date: 8/4/2025
  Time: 8:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MÁY TÍNH CHIẾT KHẤU SẢN PHẨM</title>
</head>
<body>
<h2>NHẬP THÔNG TIN SẢN PHẨM</h2>

<form action="display-discount" method="post">
    <label>Mô tả sản phẩm:</label><br>
    <input type="text" name="description" required><br><br>

    <label>Giá niêm yết (VNĐ):</label><br>
    <input type="number" step="0.01" name="price" required><br><br>

    <label>Phần trăm chiết khấu (%):</label><br>
    <input type="number" step="0.01" name="discount" required><br><br>

    <input type="submit" value="Tính chiết khấu">
</form>
</body>
</html>
