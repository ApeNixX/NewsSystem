package com.sise.news.dao;

import com.sise.news.entity.News;

import java.util.List;



public interface NewsDao {
	public void addNews(News news);
	public void updateNews(News news);
	public News getNewsById(Integer id);
	public void deleteNews(News news);
	public List<News> findAllNews();
	public List<News> findPartNews(Integer num);
	public List<News> findPartNewsByNum(Integer id, Integer num);
	public List<News> findNewsByPageNum(Integer num);
	public List<News> getNewsByCategory_id(Integer id);
	public List<News> findNewsByClicksASC();
	public List<News> findNewsOrderByTimes();
	public List<News> findNewsByLikeTitle(String title);
	public List<News> findNewsByIssueTime(String start, String end);
}
