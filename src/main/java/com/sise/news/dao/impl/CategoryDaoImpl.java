package com.sise.news.dao.impl;

import java.util.List;

import com.sise.news.dao.CategoryDao;
import com.sise.news.entity.Category;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;


@SuppressWarnings("ALL")
@Transactional
public class CategoryDaoImpl extends HibernateDaoSupport implements CategoryDao {

	@Override
	public void addCategory(Category category) {
		getHibernateTemplate().save(category);
	}

	@Override
	public void updateCategory(Category category) {
		getHibernateTemplate().update(category);
	}

	@Override
	public Category getCategoryById(Integer id) {
		return getHibernateTemplate().get(Category.class, id);
	}

	@Override
	public void deleteCategory(Category category) {
		getHibernateTemplate().delete(category);
	}

	@Override
	public List<Category> findAllCategory() {
		return (List<Category>) getHibernateTemplate().find("from Category");
	}

	@Override
	public List<Category> findCategoryByPageNum(final Integer num) {
		final String hql="from Category order by id ASC";
		return (List<Category>) getHibernateTemplate().execute(new HibernateCallback<List<Category>>() {

			@Override
			public List doInHibernate(Session session) throws HibernateException {
				Query query = session.createQuery(hql);
				query.setFirstResult(num); 
				query.setMaxResults(3); 
				List<Category> list = query.list(); 
				return list;
			}
		});
	}

}
