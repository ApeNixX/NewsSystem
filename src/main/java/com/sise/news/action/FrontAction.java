package com.sise.news.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sise.news.entity.Category;
import com.sise.news.entity.News;
import com.sise.news.service.CategoryService;
import com.sise.news.service.NewsService;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class FrontAction extends ActionSupport {
    private CategoryService categoryService;
    private NewsService newsService;
    private List<Category> categorys;
    private int cid;
    private List<News>newses;

    private List<News>newses1;

    private String title;
    private News news;
    private Date startDate;
    private Date endDate;

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public List<News> getNewses1() {
        return newses1;
    }

    public void setNewses1(List<News> newses1) {
        this.newses1 = newses1;
    }

    public CategoryService getCategoryService() {
        return categoryService;
    }

    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    public NewsService getNewsService() {
        return newsService;
    }

    public void setNewsService(NewsService newsService) {
        this.newsService = newsService;
    }

    public List<Category> getCategorys() {
        return categorys;
    }

    public void setCategorys(List<Category> categorys) {
        this.categorys = categorys;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public List<News> getNewses() {
        return newses;
    }

    public void setNewses(List<News> newses) {
        this.newses = newses;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    //前端首页
    public String frontPage(){
        categorys=categoryService.getAllCategory();
        newses=newsService.findNewsOrderByTimes();
        newses1=newsService.findNewsByClicksASC();
//        ActionContext.getContext().getSession().put("newses", newses);
        ActionContext.getContext().getSession().put("clicks", newses1);
        return "front";
    }

    public String frontNewsDetail(){
        categorys=categoryService.getAllCategory();
        news=newsService.getNewsById(cid);
        newses1=newsService.findNewsByClicksASC();
        ActionContext.getContext().getSession().put("clicks", newses1);
        int clicks=((int)news.getClicks())+1;
        news.setClicks(clicks);
        newsService.updateNews(news);
        return "frontNewsDetail";
    }

    //前端显示类型新闻
    public String frontFindNewsByCategory (){
        categorys=categoryService.getAllCategory();
        newses=newsService.findPartNews(cid);
        newses1=newsService.findNewsByClicksASC();
        ActionContext.getContext().getSession().put("clicks", newses1);

        return "part";
    }
    //搜索新闻
    public String frontFindNewsByTitle(){
        categorys=categoryService.getAllCategory();
        newses=newsService.findNewsByLikeTitle(title);
        newses1=newsService.findNewsByClicksASC();
        ActionContext.getContext().getSession().put("clicks", newses1);
        if(newses==null){
            ActionContext.getContext().getSession().put("find","不存在类似新闻请重新查询");
            return "front";
        }
        return "part";
    }

    public String frontFindNewsByTime(){
        categorys=categoryService.getAllCategory();
        DateFormat df=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String start=df.format(startDate);
        DateFormat dfnow=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String end=df.format(endDate);
        newses=newsService.findNewsByIssueTime(start, end);
        newses1=newsService.findNewsByClicksASC();
        ActionContext.getContext().getSession().put("clicks", newses1);
        if(newses==null){
            ActionContext.getContext().getSession().put("find","不存在该时间段的新闻请重新查询");
            return "front";
        }
        return "part";
    }
}
