package com.sise.news.service;

import com.sise.news.entity.User;

public interface UserService {
    public User getUser(String name,String password);
}
