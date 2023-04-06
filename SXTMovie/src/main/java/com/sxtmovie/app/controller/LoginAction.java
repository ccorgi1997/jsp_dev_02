package com.sxtmovie.app.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sxtmovie.action.Action;
import com.sxtmovie.action.ActionForward;
import com.sxtmovie.app.dao.SXTMovieDAO;

public class LoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		ActionForward forward = new ActionForward();
		SXTMovieDAO mdao = new SXTMovieDAO();
		HttpSession session = req.getSession();
		
		String userId = req.getParameter("userId");
		String userPw = req.getParameter("userPw");
		
		if(mdao.LoginAction(userId, userPw)) {
			session.setAttribute("userId", userId);
			forward.setPath("/sxt/index.mo");
			forward.setRedirect(true);
		}else {
			try {
				forward.setRedirect(false);
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('로그인에 실패했습니다.');history.back();</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return forward;
	}

}
