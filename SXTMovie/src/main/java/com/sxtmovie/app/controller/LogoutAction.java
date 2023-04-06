package com.sxtmovie.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sxtmovie.action.Action;
import com.sxtmovie.action.ActionForward;

public class LogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		ActionForward forward = new ActionForward();
		HttpSession session = req.getSession();
		
		session.setAttribute("userId", "");
 
		forward.setPath("/sxt/index.mo");
		return forward;
	}

}
