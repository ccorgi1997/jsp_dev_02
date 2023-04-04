<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href='style.css'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<style>

</style>
<body>
    <header id="header"></header>
    <main>
        <div class="detail_imgarea">
            <img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86720/86720_320.jpg" alt="포스터" title="포스터">
        </div>
        <div class="detail_textarea" >
            <button class="ratebutton" value="이용가">ALL</button>
            <strong>영화 제목</strong><br>
            <p id="detail_et">english movie title</p>
            <p id="detail_num">
                예매율 <span id="reserv_rate">00. 0 %</span> | 🥚 <span id="ge_pct">00%</span> 
                <br> 개봉 : <span id="release_dt">0000. 00. 00</span>
            </p>
            <hr style="border: solid 2px #4346FF;">
            <p id="detail_ct">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vel odio ultricies, ullamcorper tortor sit amet, hendrerit arcu. Donec suscipit laoreet leo. Nam eleifend fringilla hendrerit. Sed laoreet turpis est, non fringilla nisl porta eget. Sed mauris quam, ultrices in varius nec, luctus at tellus. Quisque eu mauris et nulla facilisis egestas non at nisi. Nulla sit amet viverra magna. Proin vitae aliquam erat. Donec ut pretium purus. Integer a ex auctor elit iaculis consequat.</p>
            <form name="detail_forward" id="detail_forward">
                <input class="detail_bt" id="detail_tb" type="button" value="예매하기">
                <input class="detail_bt" id="detail_rb" type="button" value="내 리뷰 남기기"> 
            </form>
        </div>
    </main>
    <footer id="footer"></footer>
</body>

<script src='function.js'></script>

</html>