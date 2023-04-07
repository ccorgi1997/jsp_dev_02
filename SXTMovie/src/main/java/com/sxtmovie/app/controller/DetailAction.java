package com.sxtmovie.app.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sxtmovie.action.Action;
import com.sxtmovie.action.ActionForward;
import com.sxtmovie.action.Crawler;

public class DetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		 
		ActionForward forward = new ActionForward();
		Crawler crawler = new Crawler();
		String url = req.getParameter("movieHref");
		req.setAttribute("movieRank", req.getParameter("movieRank"));
		
		try {
			Map<String, String> detailData = crawler.DetailCrawlerAction(url);
			req.setAttribute("movieEt", detailData.get("movieEt"));
			req.setAttribute("movieStory", detailData.get("movieStory"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		forward.setRedirect(false);
		forward.setPath("/detail.jsp");
		return forward;
	}

}
