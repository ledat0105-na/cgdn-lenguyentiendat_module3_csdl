package org.example.ss10_jsp_va_jstl.controller;

import org.example.ss10_jsp_va_jstl.model.Customer;
import org.example.ss10_jsp_va_jstl.service.CustomerService;
import org.example.ss10_jsp_va_jstl.service.ICustomerService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/customers")
public class CustomerServlet extends HttpServlet {
    private final ICustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Customer> list = customerService.findAll();
        req.setAttribute("listCustomer", list);
        req.getRequestDispatcher("/view/HomeCustomer.jsp").forward(req, resp);
    }
}
