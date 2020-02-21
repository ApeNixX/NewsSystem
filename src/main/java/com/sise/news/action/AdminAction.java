package com.sise.news.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sise.news.entity.Category;
import com.sise.news.entity.News;
import com.sise.news.entity.User;
import com.sise.news.service.CategoryService;
import com.sise.news.service.NewsService;
import com.sise.news.service.UserService;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class AdminAction extends ActionSupport {
    private UserService userService;
    private CategoryService categoryService;
    private NewsService newsService;
    private List<Category> categorys;
    private List<News> newses;
    private Category category;
    private News news;
    private int cid;
    private int pageSize=4;
    private int pageTotal;
    private int pageNum=1;//当前页数
    private float newCount;
    private File file;
    private String fileFileName;
    private String fileContentType;

    public List<News> getNewses() {
        return newses;
    }

    public void setNewses(List<News> newses) {
        this.newses = newses;
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public String getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(String fileContentType) {
        this.fileContentType = fileContentType;
    }

    public NewsService getNewsService() {
        return newsService;
    }

    public void setNewsService(NewsService newsService) {
        this.newsService = newsService;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<Category> getCategorys() {
        return categorys;
    }

    public void setCategorys(List<Category> categorys) {
        this.categorys = categorys;
    }

    public CategoryService getCategoryService() {
        return categoryService;
    }

    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public  String categoryAddPage(){
        return "categoryAddPage";
    }

    public String categoryAdd(){

        List<Category> lists = categoryService.getAllCategory();
        int c=0;
        for(Category categorys:lists){
            if(category.getCategoryName().equals(categorys.getCategoryName())){
                c++;
            }
        }
        System.out.println(c);
        if(c==0){
            categoryService.addCategory(category);
            ActionContext.getContext().getSession().remove("msg");

        }else{
            ActionContext.getContext().getSession().put("msg","类型已存在");
            return "fail";
        }
        return SUCCESS;
    }

    public String categoryList(){
        categorys = categoryService.getAllCategory();
        return "categorylist";
    }

    public String categoryDelete(){
        category=categoryService.getCategoryById(cid);
        List<News> lnews=newsService.getNewsByCategory_id(cid);
        if(lnews.size()==0){
            categoryService.deleteCategory(category);
            ActionContext.getContext().getSession().remove("msg2");
        }else{
            ActionContext.getContext().getSession().put("msg2","存在次类型新闻不可以直接删除");
        }
        return SUCCESS;
    }

    public String categoryUpdate(){
        category=categoryService.getCategoryById(cid);
        return "update";
    }

    public String categoryUpdated(){
        List<Category>lists=categoryService.getAllCategory();
        int c=0;
        for(Category categorys:lists){
            if(category.getCategoryName().equals(categorys.getCategoryName())){
                c++;
            }
        }
        if(c==0){
            categoryService.updateCategory(category);
            ActionContext.getContext().getSession().remove("msg1");
        }else{
            ActionContext.getContext().getSession().put("msg1","类型已经存在");
            return "fail";
        }

        return SUCCESS;
    }

    public String newsList(){
        //分页
        categorys=categoryService.getAllCategory();
        newCount=newsService.findAllNews().size();//新闻总数
        pageTotal=(int) Math.ceil(newCount/pageSize);//总页数
        ActionContext.getContext().getSession().put("pageTotal", pageTotal);
        ActionContext.getContext().getSession().put("pageNum", pageNum);
        newses=newsService.findNewsByPageNum((pageNum-1)*pageSize);
        return "newslist";
    }
    public String listNewsPart(){
        category=categoryService.getCategoryById(cid);
        newses=newsService.findPartNews(cid);
        ActionContext.getContext().getSession().put("cid", cid);
        newCount=newses.size();//该类型新闻总数
        pageTotal=(int)Math.ceil(newCount/pageSize);//总页数
        ActionContext.getContext().getSession().put("pageTotal", pageTotal);
        ActionContext.getContext().getSession().put("pageNum", pageNum);
        categorys=categoryService.getAllCategory();
        newses=newsService.findPartNewsByNum(cid, (pageNum-1)*pageSize);
        return "newslistpart";
    }

    public String newsUpdate(){
        news=newsService.getNewsById(cid);
        categorys=categoryService.getAllCategory();
        return "updates";
    }

    public String newsUpdated(){
        category=categoryService.getCategoryById(cid);
        news.setCategory(category);
        newsService.updateNews(news);
        return SUCCESS;
    }

    public String newsDelete(){
        news=newsService.getNewsById(cid);
        newsService.deleteNews(news);
        return SUCCESS;
    }

    public String newsAdd(){
        categorys=categoryService.getAllCategory();
        ActionContext.getContext().getSession().put("categorys", categorys);
        return "add";

    }

    public String newsAdded() throws IOException {
        category=categoryService.getCategoryById(cid);
        DateFormat df=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String date=df.format(new Date());
        if(file != null){
            String path = ServletActionContext.getServletContext().getRealPath("upload");
            // 创建文件类型对象:
            File diskFile = new File(path + "//" + fileFileName);
            // 文件上传:
            FileUtils.copyFile(file, diskFile);
            news.setImgs("upload/"+ fileFileName);
        }
        news.setIssueTime(date);
        news.setClicks(1);
        news.setCategory(category);
        newsService.addNews(news);
        return SUCCESS;
    }

    public String index(){
        return "index";
    }

}
