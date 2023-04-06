<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    <header>
        <div class="header">
        	<a href="/sxt/index.mo">
	            <img id="logo" src="https://i.ibb.co/dDscJNf/logo.png" alt="로고" title="메인페이지">
        	</a>
            <div style="float:right">
                <div class="boxoffice">
                    <label id="bonew">NEW</label>
                    <label id="borank">1</label>
                    <label id="botitle">영화제목</label>
                </div>
                <div class="navbar">
                	<c:choose>
                		<c:when test="${empty sessionScope.userId}">
		                    <a class="iconlabel" title="로그인" href="/sxt/login.mo">
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
                    <a class="iconlabel" title="회원가입" href="/sxt/signup.mo">
                        <i class="bi bi-person-add"></i>
                        <label class="iconlabeltext">회원가입</label>
                    </a>
                    <a class="iconlabel" title="마이페이지" href="/sxt/mypage.mo">
                        <i class="bi bi-person-circle"></i>
                        <label class="iconlabeltext">마이페이지</label>
                    </a>
                </div>
            </div>
        </div>
        <hr style=" margin:0;clear:both;">
    </header>
<script src='function.js'></script>
<script>
	function logoutConfirm(){
		if( confirm("정말 로그아웃하시겠습니까?")){
			alert("로그아웃되었습니다.");
			location.href = '/sxt/LogoutAction.mo';
		}
	}
</script>