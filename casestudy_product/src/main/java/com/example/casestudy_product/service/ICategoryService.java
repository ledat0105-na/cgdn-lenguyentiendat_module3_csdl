package com.example.casestudy_product.service;

import com.example.casestudy_product.model.Category;

import java.util.List;

public interface ICategoryService {
    List<Category> findAll();

    Category findById(int id);
}
