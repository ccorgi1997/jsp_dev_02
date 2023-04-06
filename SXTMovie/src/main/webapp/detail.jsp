<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href='${pageContext.request.contextPath}/style.css'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<% int index = Integer.parseInt(request.getParameter("movieRank"))-1;
	pageContext.setAttribute("movieRank", index); 
%>
<c:set var="movieData" value="${MovieList[pageScope.movieRank]}"/>
    <header id="header"></header>
    <main>
        <div class="detail_imgarea">
            <img src="${movieData.movieImgsrc }" alt="포스터" title="포스터">
        </div>
        <div class="detail_textarea" >
           	<c:choose>
           		<c:when test="${movieData.movieAge eq '12'}">
            	  	<button class="ratebutton"  style="background-color:#F2E503" value="${movieData.movieAge}" >${movieData.movieAge}</button>
           		</c:when>
           		<c:when test="${movieData.movieAge eq '15'}">
         	     	<button class="ratebutton"  style="background-color:#FAC710" value="${movieData.movieAge}" >${movieData.movieAge}</button>
           		</c:when>
           		<c:when test="${movieData.movieAge eq '18'}">
            	 	 <button class="ratebutton"  style="background-color:#DA0063" value="${movieData.movieAge}" >${movieData.movieAge}</button>
           		</c:when>
           		<c:otherwise>
              		<button class="ratebutton" value="${movieData.movieAge}" >${movieData.movieAge }</button>
           		</c:otherwise>	                    			                    		
            </c:choose>        	
            <strong>${movieData.movieTitle }</strong><br>
            <p id="detail_et">${movieEt }</p>
            <p id="detail_num">
                예매율 <span id="reserv_rate">${movieData.movieRvRate }</span> | 🥚 <span id="ge_pct">${movieData.movieGeRate }</span> 
                <br> 개봉 : <span id="release_dt">${movieData.movieOpDate }</span>
            </p>
            <hr style="border: solid 2px #4346FF;">
            <p id="detail_ct">${movieStory}</p>
            <form name="detail_forward" id="detail_forward" action="" method="post">
            <input type="hidden" value="${movieData.movieTitle }" name="movieTitle">
            <input type="hidden" value="${movieData.movieAge}" name="movieAge">
            <input type="hidden" value="${movieEt }" name="movieEt">
                	<c:choose>
                		<c:when test="${empty sessionScope.userId}">
               				 <input class="detail_bt" id="detail_tb" type="button" value="예매하기"
               				 onclick="window.location.href='${pageContext.request.contextPath}/sxt/login.mo'">
                			 <input class="detail_bt" id="detail_rb" type="button" value="내 리뷰 남기기"
                			 onclick="window.location.href='${pageContext.request.contextPath}/sxt/login.mo'"> 
                		</c:when>
                		<c:otherwise>
   			           		 <input class="detail_bt" id="detail_tb" type="submit" value="예매하기">
               				 <input class="detail_bt" id="detail_rb" type="submit" value="내 리뷰 남기기">    			
                		</c:otherwise>
                	</c:choose>              
            </form>
        </div>
    </main>
    <footer id="footer"></footer>
</body>
 <script >
 	$(document).ready(function() {
		$("#header").load("/header.jsp");  // 원하는 파일 경로를 삽입하면 된다
		$("#footer").load("/footer.html");  // 원하는 파일 경로를 삽입하면 된다
	});
</script>
</html>