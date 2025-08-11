package org.example.ss12_mvc.controller;

import org.example.ss12_mvc.model.Product;
import org.example.ss12_mvc.service.IProductService;
import org.example.ss12_mvc.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = {"/", "/products"})
public class ProductServlet extends HttpServlet {
    private final IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "create":
                showCreateForm(req, resp);
                break;
            case "edit":
                showEditForm(req, resp);
                break;
            case "delete":
                showDeleteConfirm(req, resp);
                break;
            case "view":
                showView(req, resp);
                break;
            case "search":
                search(req, resp);
                break;
            default:
                listProducts(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "create":
                createProduct(req, resp);
                break;
            case "edit":
                updateProduct(req, resp);
                break;
            case "delete":
                deleteProduct(req, resp);
                break;
            case "search":
                search(req, resp);
                break;
            default:
                resp.sendRedirect(req.getContextPath() + "/products");
                break;
        }
    }

    private void listProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> list = productService.findAll();
        req.setAttribute("listProducts", list);
        req.getRequestDispatcher("/product/list.jsp").forward(req, resp);
    }

    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/product/create.jsp").forward(req, resp);
    }

    private void createProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        double price = parseDouble(req.getParameter("price"));
        String description = req.getParameter("description");
        String manufacturer = req.getParameter("manufacturer");

        Product p = new Product(0, name, price, description, manufacturer);
        productService.save(p);
        resp.sendRedirect(req.getContextPath() + "/products");
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = parseInt(req.getParameter("id"));
        Product p = productService.findById(id);
        req.setAttribute("product", p);
        req.getRequestDispatcher("/product/edit.jsp").forward(req, resp);
    }

    private void updateProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        double price = parseDouble(req.getParameter("price"));
        String description = req.getParameter("description");
        String manufacturer = req.getParameter("manufacturer");

        Product p = new Product(id, name, price, description, manufacturer);
        productService.update(id, p);
        resp.sendRedirect(req.getContextPath() + "/products");
    }

    private void showDeleteConfirm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = parseInt(req.getParameter("id"));
        Product p = productService.findById(id);
        req.setAttribute("product", p);
        req.getRequestDispatcher("/product/delete.jsp").forward(req, resp);
    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = parseInt(req.getParameter("id"));
        productService.delete(id);
        resp.sendRedirect(req.getContextPath() + "/products");
    }

    private void showView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = parseInt(req.getParameter("id"));
        Product p = productService.findById(id);
        req.setAttribute("product", p);
        req.getRequestDispatcher("/product/view.jsp").forward(req, resp);
    }

    private void search(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("keyword");
        List<Product> results = productService.searchByName(keyword);
        req.setAttribute("listProducts", results);
        req.getRequestDispatcher("/product/list.jsp").forward(req, resp);
    }

    private int parseInt(String s) {
        try {
            return Integer.parseInt(s);
        } catch (Exception e) {
            return 0;
        }
    }

    private double parseDouble(String s) {
        try {
            return Double.parseDouble(s);
        } catch (Exception e) {
            return 0.0;
        }
    }
}