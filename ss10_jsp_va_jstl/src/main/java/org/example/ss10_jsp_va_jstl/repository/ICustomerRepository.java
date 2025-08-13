package org.example.ss10_jsp_va_jstl.repository;

import org.example.ss10_jsp_va_jstl.model.Customer;
import java.util.List;

public interface ICustomerRepository {
        List<Customer> findAll();
}
