package com.sxtmovie.app.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sxtmovie.app.dao.SXTMovieDAO;

@WebServlet("/sxt/dblCheckAction.mo")
public class DblCheckAction extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		SXTMovieDAO mdao = new SXTMovieDAO();
		String userId = req.getParameter("userId");
        PrintWriter out = resp.getWriter();
        out.print(mdao.DblCheck(userId));
	} 
}
