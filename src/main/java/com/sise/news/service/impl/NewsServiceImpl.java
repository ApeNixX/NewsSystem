package com.sise.news.service.impl;

import com.sise.news.dao.NewsDao;
import com.sise.news.entity.News;
import com.sise.news.service.NewsService;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
@Transactional(readOnly=false)
public class NewsServiceImpl implements NewsService {
    @Resource
    private NewsDao newsDao;

    @Override
    public List<News> getNewsByCategory_id(Integer id) {
        return newsDao.getNewsByCategory_id(id);
    }

    @Override
    public List<News> findAllNews() {
        return newsDao.findAllNews();
    }

    @Override
    public List<News> findNewsByPageNum(Integer num) {
        return newsDao.findNewsByPageNum(num);
    }

    @Override
    public List<News> findPartNews(Integer num) {
        return newsDao.findPartNews(num);
    }

    @Override
    public List<News> findPartNewsByNum(Integer id, Integer num) {
        return newsDao.findPartNewsByNum(id,num);
    }

    @Override
    public News getNewsById(Integer id) {
        return newsDao.getNewsById(id);
    }

    @Override
    public void updateNews(News news) {
        newsDao.updateNews(news);
    }

    @Override
    public void deleteNews(News news) {
        newsDao.deleteNews(news);
    }

    @Override
    public void addNews(News news) {
        newsDao.addNews(news);
    }

    @Override
    public List<News> findNewsByClicksASC() {
        return newsDao.findNewsByClicksASC();
    }

    @Override
    public List<News> findNewsOrderByTimes() {
        return newsDao.findNewsOrderByTimes();
    }

    @Override
    public List<News> findNewsByLikeTitle(String title) {
        return newsDao.findNewsByLikeTitle(title);
    }

    @Override
    public List<News> findNewsByIssueTime(String start, String end) {
        return newsDao.findNewsByIssueTime(start,end);
    }


}
