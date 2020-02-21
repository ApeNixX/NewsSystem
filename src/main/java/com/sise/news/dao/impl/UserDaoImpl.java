package com.sise.news.dao.impl;

import java.util.List;

import com.sise.news.dao.UserDao;
import com.sise.news.entity.User;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;


@SuppressWarnings("ALL")

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {

	@Override
	public User getUserByUserName(final String name, final String password) {
		User user=new User();
		List<User>lists=getHibernateTemplate().execute(new HibernateCallback<List<User>>() {
			@Override
			public List doInHibernate(Session session) throws HibernateException {
				Query query = session.createQuery("from User where username=? and password=?");
				query.setParameter(0, name);
				query.setParameter(1, password);
				List<User>lists=query.list();
				return lists;
			}
		});
		if(lists.size()==0){
			return null;
		}else{
			user=lists.get(0);
			return user;
		}
		
	}

}
