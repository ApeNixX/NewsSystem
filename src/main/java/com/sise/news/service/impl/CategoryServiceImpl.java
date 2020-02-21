package com.sise.news.service.impl;

import com.sise.news.dao.CategoryDao;
import com.sise.news.entity.Category;
import com.sise.news.service.CategoryService;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
@Transactional(readOnly=false)
public class CategoryServiceImpl implements CategoryService {
    @Resource
    private  CategoryDao categoryDao;
    @Override
    public List<Category> getAllCategory() {
        return categoryDao.findAllCategory();
    }

    @Override
    public void addCategory(Category category) {
        categoryDao.addCategory(category);
    }

    @Override
    public Category getCategoryById(Integer id) {
        return categoryDao.getCategoryById(id);
    }

    @Override
    public void deleteCategory(Category category) {
        categoryDao.deleteCategory(category);
    }

    @Override
    public void updateCategory(Category category) {
        categoryDao.updateCategory(category);
    }
}
