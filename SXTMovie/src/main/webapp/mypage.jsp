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
<title>&lt;SXT&gt; 마이페이지</title>
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
            <span class="mp_tktext" id="mp_tkcnt"><span>${fn:length(TicketList)}</span>건</span>
            <hr class="mp_hr" style = "border:1px solid white;">
            <c:choose >
            	<c:when test="${empty TicketList}">
		            <p class="mp_tktext mp_blanktxt">예매하신 내역이 없습니다.</p>
            	</c:when>
            	<c:otherwise>
            		<c:forEach var="ticket" items = "${TicketList }">
			            <div class="mp_tklist">
			                <span class="mp_mvtitle">${ticket.movieTitle }</span>
			                <i class="bi bi-dash-square-fill mp_icon deleteTicket" 
			                onclick="ticketDelete(${ticket.ticketNum })"></i>
			                <span class="mp_seats">${ticket.seatNum }</span>
			                <span class="mp_mvdate">${fn:substring(ticket.movieDate,0,10) }</span>
			            </div>
            		</c:forEach>
            	</c:otherwise>
            </c:choose>
        </div>
        <div class="mp_area mp_review">
            <span class="mp_rvtext" id="mp_rvtitle">내가 남긴 별점</span>
            <span class="mp_rvtext" id="mp_rvcnt"><span style="color:#4346FF">${fn:length(ReviewList)}</span>건</span>
            <hr class="mp_hr" style = "border:1px solid #4346FF;">
            <c:choose>
            	<c:when test="${empty ReviewList}">
		            <p class="mp_rvtext mp_blanktxt" >남긴 별점이 없습니다.</p>
            	</c:when>
            	<c:otherwise>
            		<c:forEach var="review" items = "${ReviewList}" varStatus="status">
            		<c:set var="comment" value="${review.comments}"/>
            		<c:set var="replaced_comment" value='${fn:replace(comment,  "\'", "&#39;")}'/>
            			<div class="mp_rvlist">
			                <span class="mp_mvtitle"  style="cursor:pointer;" 
			                onclick='popup_open("${replaced_comment}","${status.index }")'>
			                ${review.movieTitle }</span>
			                <i class="bi bi-dash-square-fill mp_icon rv_icon deleteReview" 
			                onclick="reviewDelete(${review.reviewNum})"></i>
			                <span class="mp_stars" >
			                	<c:forEach var="i" begin="1" end="${review.star}" step="1">⭐</c:forEach>
			                </span>
			                <span class="mp_comment">${review.comments}</span>
			                <div class="comment_popup" id="comment_popup${status.index }"></div> 
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
                        <p class="card-text" style="bottom:-2px; right:5px;"><span id="lkcard_title">영화제목</span><br>찜한 날짜 <span>0000-00-00</span></p>
                    </div>
                </div>
                <div class="card" style="width: 13rem;">
                    <i class="bi bi-heart-fill"></i>
                    <div class="imgarea">
                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86720/86720_320.jpg" class="card-img-top" alt="poster">
                    </div>
                    <div class="card-body">
                        <p class="card-text" style="bottom:-2px; right:5px;"><span id="lkcard_title">영화제목</span><br>찜한 날짜 <span>0000-00-00</span></p>
                    </div>
                </div>
                <div class="card" style="width: 13rem;">
                    <i class="bi bi-heart-fill"></i>
                    <div class="imgarea">
                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86720/86720_320.jpg" class="card-img-top" alt="poster">
                    </div>
                    <div class="card-body">
                        <p class="card-text" style="bottom:-2px; right:5px;"><span id="lkcard_title">영화제목</span><br>찜한 날짜 <span>0000-00-00</span></p>
                    </div>
                </div>
                <div class="card" style="width: 13rem;">
                    <i class="bi bi-heart-fill"></i>
                    <div class="imgarea">
                        <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86720/86720_320.jpg" class="card-img-top" alt="poster">
                    </div>
                    <div class="card-body">
                        <p class="card-text" style="bottom:-2px; right:5px;"><span id="lkcard_title">영화제목</span><br>찜한 날짜 <span>0000-00-00</span></p>
                    </div>
                </div>
            </div>
    </main>
    <footer id="footer"></footer>
</body>
<script src='${pageContext.request.contextPath}/function.js'></script>
<script>

 
	function ticketDelete(ticketNum){
		if(confirm('예매를 취소하시겠습니까?')){
			alert('예매가 취소되었습니다.')
			location.href='/sxt/TicketDeleteAction.mo?ticketNum='+ticketNum
		}
	}
	function reviewDelete(reviewNum){
		if(confirm('리뷰를 삭제하시겠습니까?')){
			alert('리뷰가 삭제되었습니다.')
			location.href='/sxt/ReviewDeleteAction.mo?reviewNum='+reviewNum
		}
	}
	function popup_open(comment,index){
		let temp_html = `
		      <p class='popup_comment'>\${comment}</p>
	          <a class='popup_btn' href='javascript:popup_close(\${index});'><i class="bi bi-x-square-fill"></i></a>`
		$('#comment_popup'+index).html(temp_html);
	}
	function popup_close(index){
		$('#comment_popup'+index).empty();
	}
</script>
</html>