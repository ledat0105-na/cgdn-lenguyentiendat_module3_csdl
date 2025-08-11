package org.example.ss10_jsp_va_jstl.service;

import org.example.ss10_jsp_va_jstl.model.Customer;
import org.example.ss10_jsp_va_jstl.repository.CustomerRepository;
import org.example.ss10_jsp_va_jstl.repository.ICustomerRepository;
import java.util.List;

public class CustomerService implements ICustomerService {
    private final ICustomerRepository repository = new CustomerRepository();

    @Override
    public List<Customer> findAll() {
        return repository.findAll();
    }
}
