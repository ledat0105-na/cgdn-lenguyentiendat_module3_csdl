package org.example.ss12_mvc.repository;

import org.example.ss12_mvc.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();
    Product findById(int id);
    void save(Product product);      // create
    void update(int id, Product product);
    void delete(int id);
    List<Product> searchByName(String name);
}
