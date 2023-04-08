<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>&lt;SXT&gt; 예매 페이지</title>
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
	<header id="header"></header>
	<div style="background-color:#666666;margin:0;">
	    <main style="margin:0 auto;padding-top:70px;">
	        <form name="ticketing_form" id="ticketing_form" method="post" action="${pageContext.request.contextPath}/sxt/TicketingAction.mo">
	        	<input type="hidden" name="movieTitle" value="${param.movieTitle}">
	        	<input type="hidden" name="userId" value="${sessionScope.userId}">
	        	<input type="hidden" id="seatNum" name="seatNum" value=" ">
	            <div class="tk_title">
                   	<c:choose>
                   		<c:when test="${param.movieAge eq '12'}">
		                    <button class="ratebutton"  style="background-color:#F2E503" value="${param.movieAge}" >${param.movieAge }</button>
                   		</c:when>
                   		<c:when test="${param.movieAge eq '15'}">
		                    <button class="ratebutton"  style="background-color:#FAC710" value="${param.movieAge}" >${param.movieAge }</button>
                   		</c:when>
                   		<c:when test="${param.movieAge eq '18'}">
		                    <button class="ratebutton"  style="background-color:#DA0063" value="${param.movieAge}" >${param.movieAge }</button>
                   		</c:when>
                   		<c:otherwise>
		                    <button class="ratebutton" value="${param.movieAge}" >${param.movieAge }</button>
                   		</c:otherwise>	                    			                    		
                   	</c:choose>
	                <strong>${param.movieTitle }</strong><br>
	            </div>
	            <div class="ticketing_dt">
	                <i class="bi bi-calendar3"></i>
	                <input type="text" name="movieDate" id="datePicker_tk" placeholder="예매 날짜 선택">
	            </div>
	            <div id="screen"><span>SCREEN</span></div>
	            <div id="seatsarea" ></div>
	            <input type="submit" id="submit_tk" value="선택 완료" >
	        </form>
	    </main>
	</div>
    <footer id="footer" ></footer>
</body>
<script src='${pageContext.request.contextPath}/function.js'></script>
<script>

	$(makeseats());
	$(ticketing_dp());
	
    tkform = document.ticketing_form;
    
    $('#seatsarea').on('click', (e) => {
    	if(!tkform.movieDate.value){
    		alert("영화 날짜를 먼저 선택해 주세요.");
    		return false;    		
    	}
        $('#'+e.target.value).toggleClass('seat_clicked')
    })
    $('#submit_tk').on('click',ticketValidation);
    
	function ticketValidation(e){
 
    	let selected = $('.seat_clicked');
    	let seats = '';
    	$.each(selected, function(index, seat){
    		seats += (seat.value+",");
    	});
    	seats = seats.slice(0,-1);
    	
    	if(!seats){
    		alert("좌석을 선택해 주세요.");
    		return false;
    	}
    	if(confirm(`예매 날짜 = \${tkform.movieDate.value}\n선택한 좌석 = \${seats}\n해당 예매 정보가 맞습니까?`)){
    		$('#seatNum').val(seats);
    		alert("예매가 완료되었습니다.")
    		tkform.submit();
    	}else{
    		return false;
    	}
    	
    }
</script>
</html>