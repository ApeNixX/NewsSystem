package com.sise.news.Interceptor;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionProxy;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class Interceptor extends AbstractInterceptor {
    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        //得到正在执行的代理对象
        ActionProxy proxy = actionInvocation.getProxy();

        //通过代理对象得到正在执行的方法
        String method = proxy.getMethod();


        //如果方法的名字不是login，那么就让他们返回到login页面上
        if (!method.equals("login")) {

            //查看用户是否登陆了
            Object user = ActionContext.getContext().getSession().get("login");

            //如果没有登陆，回到login页面
            if (user == null) {

                return "input";
            } else {

                //登陆了，那么就让它访问具体的用户信息页面
                return actionInvocation.invoke();
            }
        } else {

            //如果是访问login方法，那么就让它执行
            return actionInvocation.invoke();
        }

    }
}
