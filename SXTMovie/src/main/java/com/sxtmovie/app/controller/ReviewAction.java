package com.sxtmovie.app.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sxtmovie.action.Action;
import com.sxtmovie.action.ActionForward;
import com.sxtmovie.app.dao.ReviewBean;
import com.sxtmovie.app.dao.SXTMovieDAO;
import com.sxtmovie.app.dao.TicketBean;

public class ReviewAction implements Action{

 
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		SXTMovieDAO mdao = new SXTMovieDAO();
		ActionForward forward = new ActionForward();
		
		ReviewBean reviewbean = new ReviewBean();
		reviewbean.setUserId(req.getParameter("userId"));
		reviewbean.setMovieTitle(req.getParameter("movieTitle"));
		reviewbean.setComments(req.getParameter("comments"));
		reviewbean.setReviewDate(req.getParameter("reviewDate"));
		reviewbean.setStar(Integer.parseInt(req.getParameter("star")));
		
		if(mdao.ReviewAction(reviewbean)) {
			forward.setRedirect(true);
			forward.setPath("/sxt/MypageAction.mo");
		}else {
			try {
				forward.setRedirect(false);
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('리뷰 작성이 완료되지 않았습니다.');history.back();</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return forward;
	}

}
