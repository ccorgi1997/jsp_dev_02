<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href='style.css'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
	<% if(session.getAttribute("MovieList")==null){response.sendRedirect("./sxt/crawl.mo");}%>
</head>
<body>
    <header id="header"></header>
     <div class="container c_banner">
            <div class="row main_banner" >
         		<img src="https://caching2.lottecinema.co.kr/lotte_image/2023/JohnWick/JohnWick_1920774.jpg" class="banner_img" alt="...">
                <div class="col banner_set">
                    <div class="col">
                        <h1 id="movie_name" >존 윅 4</h1>
                        <p id="short_info" >
                            북미 박스오피스 1위 <br>
                            전 세계를 열광 시킨 액션 블록버스터 ! <br>
                        </p>
                        <div id="banner_button_set">
                            <div>
                                <a href="#" class="btn btn-dark detail_b"> 상세보기&nbsp;&nbsp;> </a>
                            </div>
                            <i class="bi bi-pause-circle pause"> </i>
                            <i class="bi bi-volume-mute mute"> </i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container" id="cardcontainer">
             <div class="row r_moviechart">
                    <div class="chart_text">
                            <h1 id="movie_chart" > 무비 차트 </h1>&nbsp;&nbsp;
                            <h1 id="movie_rank" style="display:inline !important;"> TOP 5 </h1>
                            <div style="display:inline !important;">
                                <h5 id="more_chart" >
                                    차트 더 보기
                                    <i href="#" class="bi bi-plus-square-fill plus_icon"></i>
                                </h5>
                            </div>
                    </div>
                <div class="row card_moviechart">
			        <c:set var="loop_flag" value="false" />
			        <c:forEach var = "movie" items ="${MovieList}">
					    <c:if test="${not loop_flag }">
					        <c:if test="${movie.movieRank eq 5 }">
					            <c:set var="loop_flag" value="true" />
					        </c:if>
		                    <div class="col card_frameset">
		                        <div class="row cardset">
		                            <div class="card text-center card_posterFrame">
		                            	<div class="cardimg">
		                            		<strong>${movie.movieRank}</strong>
			                                <img src= "${movie.movieImgsrc}" class="card-img-top" alt="${movie.movieRank }+위">
		                            	</div>
		                                <div class="card-body">
		                                    <h5 class="card-title">${movie.movieTitle }</h5>
		                                    <h6 class="card-text">
		                                        예매율 ${movie.movieRvRate} |  🥚 ${movie.movieGeRate }
		                                    </h6>
		                                </div>
		                            </div>
		                            <a href="#" class="btn btn-primary ticketing">예매하기</a>
		                        </div>
		                    </div>
					    </c:if>        			
        			</c:forEach>
                </div>
            </div>
        </div>
    <footer id="footer"></footer>
</body>

<script src='function.js'></script>
</html>