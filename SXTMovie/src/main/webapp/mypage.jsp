<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<%  %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<link rel="stylesheet" href='${pageContext.request.contextPath}/style.css'>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
	<c:set var="TicketList" value="${requestScope.TicketList }"></c:set>
	<c:set var="ReviewList" value="${requestScope.ReviewList }"></c:set>
    <header id="header"></header>
    <main>
        <div class="mp_title">
            <h3><i class="bi bi-person-circle"></i><span id="mp_userId">${sessionScope.userId}</span>님의 마이페이지</h3>
        </div>
        <div class="mp_area mp_ticket">
            <span class="mp_tktext" id="mp_tktitle">나의 예매내역</span>
            <span class="mp_tktext" id="mp_tkcnt"><span>0</span>건</span>
            <hr class="mp_hr" style = "border:1px solid white;">
            <c:choose >
            	<c:when test="${empty TicketList}">
		            <p class="mp_tktext mp_blanktxt">예매하신 내역이 없습니다.</p>
            	</c:when>
            	<c:otherwise>
            		<c:forEach var="ticket" items = "${TicketList }">
			            <div class="mp_tklist">
			                <span class="mp_mvtitle">${ticket.movieTitle }</span>
			                <span class="mp_seats">${ticket.seatNum }</span>
			                <span class="mp_mvdate">${ticket.movieDate }</span>
			            </div>
            		</c:forEach>
            	</c:otherwise>
            </c:choose>
        </div>
        <div class="mp_area mp_review">
            <span class="mp_rvtext" id="mp_rvtitle">내가 남긴 별점</span>
            <span class="mp_rvtext" id="mp_rvcnt"><span style="color:#4346FF">0</span>건</span>
            <hr class="mp_hr" style = "border:1px solid #4346FF;">
            <c:choose>
            	<c:when test="${empty ReviewList}">
		            <p class="mp_rvtext mp_blanktxt" >남긴 별점이 없습니다.</p>
            	</c:when>
            	<c:otherwise>
            		<c:forEach var="review" items = "${ReviewList}">
            			<div class="mp_rvlist">
			                <span class="mp_mvtitle">${review.movieTitle }</span>
			                <span class="mp_stars" >
			                	<c:forEach var="i" begin="1" end="${review.star}" step="1">⭐</c:forEach>
			                </span>
			                <span class="mp_comment">${review.comments}</span>
			            </div>
            		</c:forEach>
            	</c:otherwise>
            </c:choose>
        </div>
        <div class="mp_title" id="mp_lktitle" >
            <h3><i class="bi bi-heart-fill"></i>내가 찜한 영화<hr id="likedhr" style = "border:2px solid #4346FF; "></h3>
        </div>
            <div class="mp_cardlist">
                <div class="card" style="width: 13rem;">
                    <i class="bi bi-heart-fill"></i>
                    <div class="imgarea">
                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86720/86720_320.jpg" class="card-img-top" alt="poster">
                    </div>
                    <div class="card-body">
                        <p class="card-text"><span id="lkcard_title">영화제목</span><br>찜한 날짜 <span>0000-00-00</span></p>
                    </div>
                </div>
                <div class="card" style="width: 13rem;">
                    <i class="bi bi-heart-fill"></i>
                    <div class="imgarea">
                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86720/86720_320.jpg" class="card-img-top" alt="poster">
                    </div>
                    <div class="card-body">
                        <p class="card-text"><span id="lkcard_title">영화제목</span><br>찜한 날짜 <span>0000-00-00</span></p>
                    </div>
                </div>
                <div class="card" style="width: 13rem;">
                    <i class="bi bi-heart-fill"></i>
                    <div class="imgarea">
                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86720/86720_320.jpg" class="card-img-top" alt="poster">
                    </div>
                    <div class="card-body">
                        <p class="card-text"><span id="lkcard_title">영화제목</span><br>찜한 날짜 <span>0000-00-00</span></p>
                    </div>
                </div>
                <div class="card" style="width: 13rem;">
                    <i class="bi bi-heart-fill"></i>
                    <div class="imgarea">
                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86720/86720_320.jpg" class="card-img-top" alt="poster">
                    </div>
                    <div class="card-body">
                        <p class="card-text"><span id="lkcard_title">영화제목</span><br>찜한 날짜 <span>0000-00-00</span></p>
                    </div>
                </div>
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