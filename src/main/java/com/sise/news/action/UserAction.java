package com.sise.news.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.sise.news.entity.User;
import com.sise.news.service.UserService;

public class UserAction extends ActionSupport implements ModelDriven {
    private User user=new User();
    private UserService userService;
    private String str;

    public String getStr() {
        return str;
    }

    public void setStr(String str) {
        this.str = str;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public Object getModel() {
        return user;
    }

    public String loginPage(){
        return "loginPage";
    }

    public String login(){
        User user1=userService.getUser(user.getUsername(),user.getPassword());
        if(user1==null){
            str="帐号或密码错误";
            return "login";
        }
        ActionContext.getContext().getSession().put("login",user1);
        return "admin";
    }

    public String logout(){
        ActionContext.getContext().getSession().remove("login");
        return "login";
    }
}
