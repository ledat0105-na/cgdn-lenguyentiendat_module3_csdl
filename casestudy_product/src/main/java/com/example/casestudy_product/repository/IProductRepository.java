package com.example.casestudy_product.repository;


import com.example.casestudy_product.model.Product;

import java.util.List;


public interface IProductRepository {
    List<Product> findAll();

    Product findById(int id);

    void save(Product product);

    void update(int id, Product product);

    void delete(int id);

    List<Product> searchByName(String name);
}