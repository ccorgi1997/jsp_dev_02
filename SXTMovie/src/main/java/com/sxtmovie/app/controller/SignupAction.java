package com.sxtmovie.app.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sxtmovie.action.Action;
import com.sxtmovie.action.ActionForward;
import com.sxtmovie.app.dao.SXTMovieDAO;
import com.sxtmovie.app.dao.UserBean;

public class SignupAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		SXTMovieDAO mdao = new SXTMovieDAO();
		ActionForward forward = new ActionForward();
		
		UserBean userbean = new UserBean();
		userbean.setUserId(req.getParameter("userId"));
		userbean.setUserPw(req.getParameter("userPw"));
		userbean.setUserBirth(req.getParameter("userBirth"));
		userbean.setUserPhone(req.getParameter("userPhone"));
		
		if(mdao.SignUpAction(userbean)) {
			forward.setRedirect(true);
			forward.setPath("/sxt/index.mo");
		}else {
			try {
				forward.setRedirect(false);
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('회원가입이 완료되지 않았습니다.');history.back();</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return forward;
	}

}
