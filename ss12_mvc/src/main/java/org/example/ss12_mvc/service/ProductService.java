package org.example.ss12_mvc.service;

import org.example.ss12_mvc.model.Product;
import org.example.ss12_mvc.repository.IProductRepository;
import org.example.ss12_mvc.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService{
    private final IProductRepository repo = new ProductRepository();

    @Override
    public List<Product> findAll() { return repo.findAll(); }
    @Override
    public Product findById(int id) { return repo.findById(id); }
    @Override
    public void save(Product product) { repo.save(product); }
    @Override
    public void update(int id, Product product) { repo.update(id, product); }
    @Override
    public void delete(int id) { repo.delete(id); }
    @Override
    public List<Product> searchByName(String name) { return repo.searchByName(name); }
}
