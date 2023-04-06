package com.sxtmovie.app.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sxtmovie.action.ActionForward;

@WebServlet("*.mo")
public class SXTFrontController extends HttpServlet{
 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String requestURI = request.getRequestURI();
		 ActionForward forward = null;
		 switch(requestURI) {
		 	case "/sxt/crawl.mo" : forward = new CrawlerAction().execute(request,response); break;
		 	case "/sxt/index.mo" : forward = new ActionForward(true, "/index.jsp"); break;
		 	case "/sxt/login.mo" : forward = new ActionForward(true, "/login.jsp"); break;
		 	case "/sxt/signup.mo" : forward = new ActionForward(true, "/signup.jsp"); break;
		 	case "/sxt/chart.mo" : forward = new ActionForward(true, "/chart.jsp"); break;
		 	case "/sxt/LoginAction.mo" : forward = new LoginAction().execute(request,response); break;
		 	case "/sxt/LogoutAction.mo" : forward = new LogoutAction().execute(request,response); break;
		 	case "/sxt/MypageAction.mo" : forward = new MypageAction().execute(request,response); break;
		 }
		 
		 // 전송에 대한 일괄처리
		 if(forward != null) {
			 if(forward.isRedirect()) {
				 // true : redirect
				 response.sendRedirect(forward.getPath());
			 }else {
				 // false : forward
				 RequestDispatcher disp 
				 	= request.getRequestDispatcher(forward.getPath());
				 disp.forward(request, response);
			 }
		 }
	}
	
	
}
