<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            <form action="" name="signup_form" id="signup_form" align="center">
                <div style="position:relative;">
                    <label class="signup_label">회원 아이디</label>
                    <input type="text" name="userId" id="userId" class="signup_input" required>
                    <input type="button" id="doubleChkBt" value="중복확인">
                    <p class="signupAlert">중복확인 텍스트</p>
                </div>
                <div style="position:relative;">
                    <label class="signup_label">비밀번호</label>
                    <input type="password" name="userPw" class="signup_input" required>
                </div>
                <div style="position:relative;">
                    <label class="signup_label">비밀번호 확인</label>
                    <input type="text" name="userPwCheck" class="signup_input" required >
                </div>
                <div style="position:relative;">
                    <label class="signup_label">생년월일</label>
                    <input type="text" name="userBirth" id="datePicker" class="signup_input" required>
                </div>
                <div style="position:relative;">
                    <label class="signup_label">전화번호</label>
                    <input type="text" name="userPhone" class="signup_input" required>
                </div>
                <input type="submit" class="btn_signup" value="회원가입">
            </form>
        </div>
    </main>    	
    <footer id="footer"></footer>
</body>
<script src='function.js'></script>
<script>
	$(review_dp());
</script>
</html>