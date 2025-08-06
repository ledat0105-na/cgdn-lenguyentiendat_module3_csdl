package org.example.ss10_calculator.servlet;

import org.example.ss10_calculator.model.Calculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculate")
public class CalculatorController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/calculator-form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        float firstOperand = Float.parseFloat(req.getParameter("first-operand"));
        float secondOperand = Float.parseFloat(req.getParameter("second-operand"));
        char operator = req.getParameter("operator").charAt(0);

        float result;
        String message;

        try {
            Calculator Calculator = null;
            result = Calculator.calculate(firstOperand, secondOperand, operator);
            message = firstOperand + " " + operator + " " + secondOperand + " = " + result;
        } catch (Exception ex) {
            message = "Error: " + ex.getMessage();
        }

        req.setAttribute("resultMessage", message);
        req.getRequestDispatcher("/calculator-form.jsp").forward(req, resp);
    }
}
