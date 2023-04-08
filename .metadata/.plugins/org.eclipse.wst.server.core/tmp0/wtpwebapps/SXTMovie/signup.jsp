<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>&lt;SXT&gt; 회원가입</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<link rel="stylesheet" href='style.css'>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
    <header id="header"></header>
    <main>
        <div class="signupArea">
            <div id="signupTitle">
                <h1>신규 회원가입</h1>
                <hr style="border: solid 2px #4346FF ">
            </div>
            <form action="${pageContext.request.contextPath}/sxt/SignupAction.mo" name="signup_form" id="signup_form" align="center" method="post">
                <div id="signup_Id" style="position:relative;">
                    <label class="signup_label">회원 아이디</label>
                    <input type="text" name="userId" id="userId" class="signup_input" placeholder="영문, 숫자 혼합 8~15자">
                    <input type="button" id="doubleChkBt" value="중복확인" onclick="dblCheck()">
                    <p class="signupAlert" id="su_IdAlert"></p>
                </div>
                <div id="signup_Pw" style="position:relative;">
                    <label class="signup_label">비밀번호</label>
                    <input type="password" name="userPw" id="userPw" class="signup_input" placeholder="영문, 숫자 혼합 8~15자">
                    <p class="signupAlert" id="su_PwAlert"></p>
                </div>
                <div id="signup_PwChk" style="position:relative;">
                    <label class="signup_label">비밀번호 확인</label>
                    <input type="password" name="userPwCheck" id="userPwCheck" class="signup_input" >
                    <p class="signupAlert" id="su_PwChkAlert"></p>
                </div>
                <div id="signup_Birth" style="position:relative;">
                    <label class="signup_label">생년월일</label>
                    <input type="text" name="userBirth" id="userBirth" class="signup_input" placeholder="법정생년월일 8숫자">
                    <p class="signupAlert" id="su_BirthAlert"></p>
                </div>
                <div id="signup_Phone" style="position:relative;">
                    <label class="signup_label">전화번호</label>
                    <input type="text" name="userPhone" id="userPhone" class="signup_input" placeholder="- 없이 입력">
                    <p class="signupAlert" id="su_PhoneAlert"></p>
                </div>
                <input type="submit" class="btn_signup" value="회원가입" onclick="signupValidation()">
            </form>
        </div>
    </main>    	
    <footer id="footer"></footer>
</body>
<script src='function.js'></script>
<script>

	function dblCheck(){
		let userId =  $("#userId").val();
		$.ajax({
	        async: true,
	        type : 'POST',
	        data : {"userId":userId},
	        url : "/sxt/dblCheckAction.mo",
	        dataType : "json",
	        success : function(result) {
	            if (result > 0) {
	                alert("이미 존재하는 아이디입니다."); 
	                $("#su_IdAlert").text('사용할 수 없는 아이디입니다.')
	            } else {
	                alert("사용 가능한 아이디입니다.");
	                $("#su_IdAlert").text('사용 가능한 아이디입니다.')
	                $("#userPw").focus();
	            }
	        },error:function(){
	        	alert("ajax 통신 에러");
	        }
	    })
	}
</script>
</html>