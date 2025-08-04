package org.example.ss9_java_web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/display-discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String moTaSanPham = req.getParameter("description");  // sửa name cho đúng
        double giaNiemYet = Double.parseDouble(req.getParameter("price"));  // sửa
        double tiLeChietKhau = Double.parseDouble(req.getParameter("discount"));  // sửa

        double soTienChietKhau = giaNiemYet * tiLeChietKhau * 0.01;
        double giaSauChietKhau = giaNiemYet - soTienChietKhau;

        req.setAttribute("moTaSanPham", moTaSanPham);
        req.setAttribute("giaNiemYet", giaNiemYet);
        req.setAttribute("tiLeChietKhau", tiLeChietKhau);
        req.setAttribute("soTienChietKhau", soTienChietKhau);
        req.setAttribute("giaSauChietKhau", giaSauChietKhau);

        req.getRequestDispatcher(jsp").forward(req, resp);
    }
"display-discount.
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
