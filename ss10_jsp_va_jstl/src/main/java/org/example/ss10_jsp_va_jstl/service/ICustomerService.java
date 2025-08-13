package org.example.ss10_jsp_va_jstl.service;

import org.example.ss10_jsp_va_jstl.model.Customer;
import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();
}
