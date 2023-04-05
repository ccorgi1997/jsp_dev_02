<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href='style.css'>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<body>
    <header id="header"></header>
    <main>
        <div class="loginArea">
            <div id="loginTitle">
                <h1>회원 로그인</h1>
                <hr style="border: solid 2px #4346FF ">
                <p id="loginText">아이디와 비밀번호를 입력해 주세요.</p>
            </div>
            <form action="" name="login_form" id="login_form" align="center">
                <div style="position:relative;">
                    <i class="bi bi-person"></i>
                    <input type="text" name="userId" class="loginLb" ><br>
                </div>
                <div style="position:relative;">
                    <i class="bi bi-lock"></i>
                    <input type="password" name="userPw" class="loginLb" >
                </div>
                <input type="submit" class="btn_login" value="로그인"><br>
            </form>
            <a href="${pageContext.request.contextPath}/sxt/signup.mo" id="goSignUpLabel">아직 회원이 아니신가요? ></a>
        </div>
    </main>    
    <footer id="footer"></footer>
</body>
<script src='function.js'></script>
</html>