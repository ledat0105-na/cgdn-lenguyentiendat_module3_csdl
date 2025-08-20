package com.example.casestudy_product.controller;

import com.example.casestudy_product.model.Product;
import com.example.casestudy_product.model.Category;
import com.example.casestudy_product.service.IProductService;
import com.example.casestudy_product.service.ProductService;
import com.example.casestudy_product.service.ICategoryService;
import com.example.casestudy_product.service.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/products")
public class ProductServlet extends HttpServlet {
    private final IProductService productService = new ProductService();
    private final ICategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "view":
                viewProduct(request, response);
                break;
            case "search":
                searchByName(request, response);
                break;
            default:
                listProduct(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                updateProduct(request, response);
                break;
        }
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.findAll();
        List<Category> categoryList = categoryService.findAll();
        request.setAttribute("listProducts", productList);
        request.setAttribute("categories", categoryList);
        request.getRequestDispatcher("/product/list.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categories = categoryService.findAll();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/product/create.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        List<Category> categories = categoryService.findAll();
        request.setAttribute("product", product);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/product/edit.jsp").forward(request, response);
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        request.setAttribute("product", product);
        request.getRequestDispatcher("/product/delete.jsp").forward(request, response);
    }

    private void viewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        request.setAttribute("product", product);
        request.getRequestDispatcher("/product/view.jsp").forward(request, response);
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");
        int categoryId = Integer.parseInt(request.getParameter("category"));

        Product product = new Product(name, price, description, manufacturer, categoryId);
        productService.save(product);
        response.sendRedirect("/products");
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");
        int categoryId = Integer.parseInt(request.getParameter("category"));

        Product product = new Product(id, name, price, description, manufacturer, categoryId);
        productService.update(id, product);
        response.sendRedirect("/products");
    }

    private void searchByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("searchName");
        List<Product> products = productService.searchByName(name);
        List<Category> categories = categoryService.findAll();
        request.setAttribute("listProducts", products);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/product/list.jsp").forward(request, response);
    }
}
