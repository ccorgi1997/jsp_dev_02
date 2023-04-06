<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href='style.css'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<body>
    <header id="header"></header>
    <main>
        <h2 id="chart_title">무비차트</h2>
        <div class="chart_area">
        	<c:forEach var="movie" items="${MovieList }">
	            <div class="chart_cardarea">
	                <div class="chart_card">
	                    <div class="card_rank">${movie.movieRank }</div>
	                    <a href="${pageContext.request.contextPath}/sxt/DetailAction.mo?movieRank=${movie.movieRank }&movieHref=http://www.cgv.co.kr${movie.movieHref }">
		                    <img class="card_img" src="${movie.movieImgsrc}">
		                    <div style=" display:inline-flex;margin:10px auto;" >
		                    	<c:choose>
		                    		<c:when test="${movie.movieAge eq '12'}">
					                    <button class="ratebutton"  style="background-color:#F2E503" value="${movie.movieAge}" >${movie.movieAge }</button>
		                    		</c:when>
		                    		<c:when test="${movie.movieAge eq '15'}">
					                    <button class="ratebutton"  style="background-color:#FAC710" value="${movie.movieAge}" >${movie.movieAge }</button>
		                    		</c:when>
		                    		<c:when test="${movie.movieAge eq '18'}">
					                    <button class="ratebutton"  style="background-color:#DA0063" value="${movie.movieAge}" >${movie.movieAge }</button>
		                    		</c:when>
		                    		<c:otherwise>
					                    <button class="ratebutton" value="${movie.movieAge}" >${movie.movieAge }</button>
		                    		</c:otherwise>	                    			                    		
		                    	</c:choose>
			                    <h5 class="ctcard_title" style="color:black;">${movie.movieTitle}</h5>
		                    </div>
	                    </a>
	                    <p class="card_detail">
	                    	<span class="card_dday">${movie.movieDday }</span>
	                        예매율 <span>${movie.movieRvRate }</span> | 
	                        🥚 <span>${movie.movieGeRate }</span>
	                    </p>
	                    <button class="card_button">예매하기</button>
	                </div>
	            </div>
        	</c:forEach>
        </div>
    </main>    	
    <footer id="footer"></footer>
</body>
<script src='function.js'></script>
</html>