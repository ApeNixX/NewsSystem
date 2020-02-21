package com.sise.news.service.impl;

import com.sise.news.dao.UserDao;
import com.sise.news.entity.User;
import com.sise.news.service.UserService;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly=false)
public class UserServiceImpl  implements UserService {
    private UserDao userDao;

    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public User getUser(String name,String password) {
    User user = userDao.getUserByUserName(name,password);
    return  user;
    }


}
