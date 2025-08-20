package com.example.casestudy_product.service;


import com.example.casestudy_product.model.Product;
import com.example.casestudy_product.repository.IProductRepository;
import com.example.casestudy_product.repository.ProductRepository;

import java.util.List;


public class ProductService implements IProductService {
    private final IProductRepository repository = new ProductRepository();


    @Override
    public List<Product> findAll() {
        return repository.findAll();
    }


    @Override
    public Product findById(int id) {
        return repository.findById(id);
    }


    @Override
    public void save(Product product) {
        repository.save(product);
    }


    @Override
    public void update(int id, Product product) {
        repository.update(id, product);
    }


    @Override
    public void delete(int id) {
        repository.delete(id);
    }


    @Override
    public List<Product> searchByName(String name) {
        return repository.searchByName(name);
    }
}