package com.sise.news.dao;

import com.sise.news.entity.Category;

import java.util.List;


public interface CategoryDao {
	public void addCategory(Category category);
	public void updateCategory(Category category);
	public Category getCategoryById(Integer id);
	public void deleteCategory(Category category);
	public List<Category> findAllCategory();
	public List<Category> findCategoryByPageNum(Integer num);
}
