package org.example.ss10_jsp_va_jstl.repository;

import org.example.ss10_jsp_va_jstl.model.Customer;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static final List<Customer> customers = new ArrayList<>();

    static {
        customers.add(new Customer(1, "Nguyễn Văn A", "a@gmail.com", "Hà Nội", "anh1.jpg"));
        customers.add(new Customer(2, "Trần Thị B", "b@gmail.com", "Đà Nẵng", "anh2.jpg"));
        customers.add(new Customer(3, "Lê Văn C", "c@gmail.com", "TP.HCM", "anh3.jpg"));
        customers.add(new Customer(4, "Mai Thị D", "d@gmail.com", "Huế", "anh4.jpg"));
        customers.add(new Customer(5, "Lý Văn E", "e@gmail.com", "Cần Thơ", "anh5.jpg"));
    }

    @Override
    public List<Customer> findAll() {
        return customers;
    }
}
