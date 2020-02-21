package com.sise.news.dao;


import com.sise.news.entity.User;

public interface UserDao {
	public User getUserByUserName(String name, String password);
}
