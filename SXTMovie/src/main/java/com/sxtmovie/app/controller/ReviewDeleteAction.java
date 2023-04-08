package com.sxtmovie.app.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sxtmovie.action.Action;
import com.sxtmovie.action.ActionForward;
import com.sxtmovie.app.dao.SXTMovieDAO;

public class ReviewDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		SXTMovieDAO mdao = new SXTMovieDAO();
		ActionForward forward = new ActionForward();
		int reviewNum= Integer.parseInt(req.getParameter("reviewNum"));
		if(mdao.DeleteReview(reviewNum)) {
			forward.setRedirect(true);
			forward.setPath("/sxt/MypageAction.mo");
		}else {
			try {
				forward.setRedirect(false);
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('삭제가 완료되지 않았습니다.');history.back();</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return forward;
	}

}
