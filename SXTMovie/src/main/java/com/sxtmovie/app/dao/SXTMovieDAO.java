package com.sxtmovie.app.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sxtmovie.mybatis.SqlMapConfig;

public class SXTMovieDAO {
	
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public SXTMovieDAO() {
		sqlsession = factory.openSession(true);
	}
	
	public boolean LoginAction(String userId, String userPw) {
		
		boolean result = false;
		
		Map<String, String> data = new HashMap<>();
		data.put("userId", userId);
		data.put("userPw", userPw);
		
		int cnt = sqlsession.selectOne("SXTMovie.LoginAction",data); 
		if(cnt==1) {result = true;}
		
		return result;
	}
 
}

