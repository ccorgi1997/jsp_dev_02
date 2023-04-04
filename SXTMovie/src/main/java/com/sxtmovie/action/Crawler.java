package com.sxtmovie.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.sxtmovie.app.dao.MovieBean;

public class Crawler{
 
	public List<MovieBean> CrawlerAction() throws IOException {
		
		String url="http://www.cgv.co.kr/movies/?lt=1&ft=0";
		Document document = Jsoup.connect(url).get();  
		Elements ols = document.getElementsByTag("ol");
		
		List<MovieBean> movieList = new ArrayList<>();
		
		for(Element ol : ols) {
			
			Elements lis = ol.getElementsByTag("li");
			for(Element li : lis) {
				if(li.text() != "") {
					
					MovieBean movie = new MovieBean();
					movie.setMovieRank(Integer.parseInt(li.getElementsByClass("rank").text().substring(3)));
					movie.setMovieImgsrc(li.getElementsByTag("img").attr("src").trim());
					movie.setMovieTitle(li.getElementsByClass("title").text().trim());
					
					Elements percents = li.getElementsByClass("percent");
					int i = 0;
					for(Element percent : percents) { 
						if(i==0) {
							movie.setMovieRvRate(percent.getElementsByTag("span").text().trim());
							++i;
						}else {
							movie.setMovieGeRate(percent.getElementsByTag("span").text().trim());
						}
					}
					
					String date = li.getElementsByClass("txt-info").text();
					movie.setMovieOpDate(date.substring(0,10));
					
					movie.setMovieDday(li.getElementsByTag("em").text().trim()); 
					
					movieList.add(movie);
				}
			}
		}
		
		return movieList;
		
	}
}