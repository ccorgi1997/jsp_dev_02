<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>&lt;SXT&gt; 리뷰 작성</title>
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
    <header id="header"></header>
    <main> 
        <div class="detail_imgarea">
            <img src="${param.movieImgsrc}" alt="포스터" title="포스터">
        </div>
        <div class="detail_reviewarea">
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
            <strong>${param.movieTitle}</strong><br>
            <p id="detail_et">${param.movieEt}</p>
            <hr style="border: solid 2px #4346FF; margin-top:15px;">
            <form name="review_form" id="review_form" method="post" action="${pageContext.request.contextPath}/sxt/ReviewAction.mo">
            	<input type="hidden" name="movieTitle" value="${param.movieTitle}">
            	<input type="hidden" name="userId" value="${sessionScope.userId}">
                <label class="reviewform_lb">본 날짜<input type="text" id="datePicker" name="reviewDate"></label>
                <label class="reviewform_lb">별점
                    <select name="star" style="height:25px;width:200px;" >
                        <option value="0">----별점을 선택해 주세요----</option>
                        <option value="1">⭐</option>
                        <option value="2">⭐⭐</option>
                        <option value="3">⭐⭐⭐</option>
                        <option value="4">⭐⭐⭐⭐</option>
                        <option value="5">⭐⭐⭐⭐⭐</option>
                    </select>
                </label><br>
                <label class="reviewform_lb" style="margin-top:15px;">코멘트
                    <textarea name="comments" id="comments" cols="40" rows="10" maxlength="500"></textarea>
                </label>
                <input class="detail_bt" id="review_sb" type="submit" value="리뷰 저장하기" >
            </form>
        </div>
    </main>
    <footer id="footer"></footer>
</body>
<script src='${pageContext.request.contextPath}/function.js'></script>
<script >
	$(review_dp());
	$('#review_sb').on('click',reviewValidation);
	function reviewValidation(){
		let form = document.review_form;
		if(!form.reviewDate.value){
			alert("본 날짜를 선택해 주세요.")
			form.reviewDate.focus();
			return false;
		}
		if(form.star.value < 1){
			alert("별점을 선택해 주세요.")
			form.star.focus();
			return false;
		}
		if(!form.comments.value){
			alert("코멘트를 작성해 주세요.")
			form.comments.focus();
			return false;
		}
		
		alert("리뷰가 저장되었습니다.");
		form.submit();
	}
</script>
 
</html>