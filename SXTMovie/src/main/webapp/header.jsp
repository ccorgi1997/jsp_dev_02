<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

    <header>
        <div class="header">
        	<a href="/sxt/index.mo">
	            <img id="logo" src="https://i.ibb.co/dDscJNf/logo.png" alt="로고" title="메인페이지">
        	</a>
            <div style="float:right">
                <div id="boxoffice"></div>
                <div class="navbar">
                	<c:choose>
                		<c:when test="${empty sessionScope.userId}">
		                    <a class="iconlabel" title="로그인" href="${pageContext.request.contextPath}/sxt/login.mo">
		                        <i class="bi bi-lock"></i>
		                        <label class="iconlabeltext">로그인</label>
		                    </a>
                		</c:when>
                		<c:otherwise>
		                    <a class="iconlabel" title="로그아웃" onclick="logoutConfirm()">
		                        <i class="bi bi-unlock"></i>
		                        <label class="iconlabeltext">로그아웃</label>
		                    </a>                			
                		</c:otherwise>
                	</c:choose>
                    <a class="iconlabel" title="회원가입" href="${pageContext.request.contextPath}/sxt/signup.mo">
                        <i class="bi bi-person-add"></i>
                        <label class="iconlabeltext">회원가입</label>
                    </a>
                	<c:choose>
                		<c:when test="${empty sessionScope.userId}">
		                    <a class="iconlabel" title="마이페이지" href="${pageContext.request.contextPath}/sxt/login.mo">
		                        <i class="bi bi-person-circle"></i>
		                        <label class="iconlabeltext">마이페이지</label>
		                    </a>
                		</c:when>
                		<c:otherwise>
		                    <a class="iconlabel" title="마이페이지" href="${pageContext.request.contextPath}/sxt/MypageAction.mo">
		                        <i class="bi bi-person-circle"></i>
		                        <label class="iconlabeltext">마이페이지</label>
		                    </a>             			
                		</c:otherwise>
                	</c:choose>                    
                </div>
            </div>
        </div>
        <hr style=" margin:0;clear:both;">
    </header>
<script>
	function logoutConfirm(){
		if( confirm("정말 로그아웃하시겠습니까?")){
			alert("로그아웃되었습니다.");
			location.href = '/sxt/LogoutAction.mo';
		}
	}
	
    let today = new Date();
    let yy = today.getFullYear();
    let mm = ('0' + (today.getMonth() + 1)).slice(-2);
    let dd = ('0' + (today.getDate()-1)).slice(-2);
    let day = yy+mm+dd;
    let i = 0;
    
    $(function(){
    	setInterval(boxoffice,2000);
    });
    
    function boxoffice(){
 		$.ajax({
			  type: "GET", // GET 방식으로 요청한다.
			  url: "https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=24dfa1e924cd9a27fdf3e9cb568b5f2a&targetDt="+day,
			  data: {}, // 요청하면서 함께 줄 데이터 (GET 요청시엔 비워두세요)
			  success: function(response){ // 서버에서 준 결과를 response라는 변수에 담음
			    let boxOfficeList = response["boxOfficeResult"]["dailyBoxOfficeList"];
	           	let temp_html = '';
	           	if(boxOfficeList[i].rankOldAndNew == 'OLD'){
	                temp_html = `<label id="borank">\${boxOfficeList[i].rank}</label><label id="botitle">\${boxOfficeList[i].movieNm}</label>`
	           	}else{
	                temp_html = `<label id="bonew">\${boxOfficeList[i].rankOldAndNew}</label><label id="borank">\${boxOfficeList[i].rank}</label><label id="botitle">\${boxOfficeList[i].movieNm}</label>`
	           	}
	           	$('#boxoffice').html(temp_html);
	           	i++;
	           	if(i==10){i = 0;} 
			  }
		}) 
    }
    
	
</script>