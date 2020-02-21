package com.sise.news.service;

import com.sise.news.entity.Category;

import java.util.List;

public interface CategoryService {
    public List<Category> getAllCategory();
    public void addCategory(Category category);
    public Category getCategoryById(Integer id);
    public void deleteCategory(Category category);
    public void updateCategory(Category category);


}
