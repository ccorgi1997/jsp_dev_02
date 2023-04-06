package com.sxtmovie.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sxtmovie.action.Action;
import com.sxtmovie.action.ActionForward;
import com.sxtmovie.app.dao.SXTMovieDAO;

public class MypageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
	
		SXTMovieDAO mdao = new SXTMovieDAO();
		ActionForward forward = new ActionForward();
		
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("userId");
		
		req.setAttribute("TicketList", mdao.TicketSelect(userId));
		req.setAttribute("ReviewList", mdao.ReviewSelect(userId)); 
		forward.setRedirect(false);
		forward.setPath("/mypage.jsp");
		
		return forward;
	}

}
