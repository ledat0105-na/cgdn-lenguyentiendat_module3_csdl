package com.example.casestudy_product.service;


import com.example.casestudy_product.model.Category;
import com.example.casestudy_product.repository.CategoryRepository;
import com.example.casestudy_product.repository.ICategoryRepository;

import java.util.List;


public class CategoryService implements ICategoryService {
    private final ICategoryRepository repository = new CategoryRepository();


    @Override
    public List<Category> findAll() {
        return repository.findAll();
    }

    @Override
    public Category findById(int id) {
        return repository.findById(id);
    }
}