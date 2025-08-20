package com.example.casestudy_product.repository;

import com.example.casestudy_product.model.Category;

import java.util.List;

public interface ICategoryRepository {
    List<Category> findAll();

    Category findById(int id);
}