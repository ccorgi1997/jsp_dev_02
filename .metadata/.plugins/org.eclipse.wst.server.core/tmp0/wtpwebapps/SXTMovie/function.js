/**
 * 
 */
// 모든 페이지에 header, footer load
$(document).ready(function() {

	$("#header").load("./header.jsp");  // 원하는 파일 경로를 삽입하면 된다
	$("#footer").load("./footer.html");  // 원하는 파일 경로를 삽입하면 된다
});
// 리뷰 페이지 datepicker - 오늘 이후로는 선택 불가

function review_dp(){
		$('#datePicker').datepicker({
			dateFormat: 'yy-mm-dd' //달력 날짜 형태
			, showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			, showMonthAfterYear: true // 월- 년 순서가아닌 년도 - 월 순서
			, changeYear: true //option값 년 선택 가능
			, changeMonth: true //option값  월 선택 가능                
			, yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
			, monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 텍스트
			, monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip
			, dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 텍스트
			, dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'] //달력의 요일 Tooltip
			, minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
			, maxDate: "+0D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
		});
} 

// 예매 페이지 datepicker - 오늘부터 일주일
function ticketing_dp(){
    $('#datePicker_tk').datepicker({
        dateFormat: 'yy-mm-dd' //달력 날짜 형태
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
        ,changeYear: true //option값 년 선택 가능
        ,changeMonth: true //option값  월 선택 가능                
        ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
        ,minDate: "-0D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "+7D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
    });
} 
 
// 예매 페이지 시트추가 반복문
    function makeseats(){
        let seatsarea = $('#seatsarea')
        let seatrow = ['A','B','C','D','E','F','G','H','I','J'];
        let seatcol = ['1','2','3','4','5','6','7','8','9','10'];
        for(row in seatrow){
            
            for(col in seatcol){ 
                let temp_html = '<input type="button" class="seatbutton" id="'+seatrow[row]+seatcol[col]+'" name="'+seatrow[row]+seatcol[col]+'" value="'+seatrow[row]+seatcol[col]+'">'
                 seatsarea.append(temp_html)
                 if(col==4){
                    seatsarea.append('<span class="seatrow">'+seatrow[row]+'</span>')
                 }
            }
            seatsarea.append('<br>')
        }
    }
    
// 좌석선택 효과
    function seatclick(e){
		alert("")
        $('#'+e.target.value).toggleClass('seat_clicked')
    }
    
// 로그인페이지 validationMsg
	let lf = document.login_form;
 	$('#lg_userId').focusout(function(){
		if(!lf.userId.value.trim()){
			$("#idAlert").html('<div class="loginAlert">아이디를 입력하세요.</div')
		}else{
			$("#idAlert").empty();
		}
	}); 
 	$('#lg_userPw').focusout(function(){
		if(!lf.userPw.value.trim()){
			$("#pwAlert").html('<div class="loginAlert">비밀번호를 입력하세요.</div')
		}else{
			$("#pwAlert").empty();
		}
	});  
	
 // 로그인 submit validation

	function loginValidation(){
		if(!lf.userId.value.trim()){
			alert("아이디를 입력하세요.");
			lf.userId.focus();
			return false;
		} 
		if(!lf.userPw.value.trim()){
			alert("비밀번호를 입력하세요.");
			lf.userPw.focus();
			return false;
		} 
		lf.submit();
	}

// 회원가입 페이지 validationMsg
	let sf = document.signup_form;
 	$('#userId').focusout(function(){
		if(!sf.userId.value.trim()){
			$("#su_IdAlert").text('아이디를 입력하세요.')
		}else if(!/^[a-zA-Z][0-9a-zA-Z]{7,14}$/.test(sf.userId.value.trim())){ 
			$("#su_IdAlert").text('아이디 형식은 영문, 숫자 혼합 8~15자입니다.')
		}else{
			$("#su_IdAlert").text('');
		}
	}); 
 	$('#userPw').focusout(function(){
		if(!sf.userPw.value.trim()){
			$("#su_PwAlert").text('비밀번호를 입력하세요.')
		}else if(!/^[a-zA-Z][0-9a-zA-Z]{7,14}$/.test(sf.userPw.value.trim())){ 
			$("#su_PwAlert").text('비밀번호 형식은 영문, 숫자 혼합 8~15자입니다.')
		}else{
			$("#su_PwAlert").text('');
		}
	}); 
 	$('#userPwCheck').focusout(function(){
		if(!sf.userPwCheck.value.trim()){
			$("#su_PwChkAlert").text('비밀번호 확인란을 입력하세요.')
		}else if(sf.userPwCheck.value.trim()!= sf.userPw.value.trim()){ 
			$("#su_PwChkAlert").text('비밀번호 확인란이 일치하지 않습니다.')
		}else{
			$("#su_PwChkAlert").text('');
		}
	}); 
 	$('#userBirth').focusout(function(){
		if(!sf.userBirth.value.trim()){
			$("#su_BirthAlert").text('생년월일을 입력하세요.')
		}else if(!/^\d{8}$/.test(sf.userBirth.value.trim())){ 
			$("#su_BirthAlert").text('생년월일 형식은 정수 8자리입니다.')
		}else{
			$("#su_BirthAlert").text('');
		}
	}); 
 	$('#userPhone').focusout(function(){
		if(!sf.userPhone.value.trim()){
			$("#su_PhoneAlert").text('전화번호를 입력하세요.')
		}else if(!/^\d{9,11}$/.test(sf.userPhone.value.trim())){ 
			$("#su_PhoneAlert").text('전화번호 형식은 정수 9~11자리입니다.')
		}else{
			$("#su_PhoneAlert").text('');
		}
	});
	
 // 회원가입 submit validation

function signupValidation(){
		
		if(!sf.userId.value.trim()){
			alert("아이디를 입력하세요.");
			sf.userId.focus();
			return false;
		} 
		if(!sf.userPw.value.trim()){
			alert("비밀번호를 입력하세요.");
			sf.userPw.focus();
			return false;
		} 
		if(!sf.userPwCheck.value.trim()){
			alert("비밀번호 확인란을 입력하세요.");
			sf.userPwCheck.focus();
			return false;
		} 		
		if(!sf.userBirth.value.trim()){
			alert("생년월일을 입력하세요.");
			sf.userBirth.focus();
			return false;
		} 
		if(!sf.userPhone.value.trim()){
			alert("전화번호를 입력하세요.");
			sf.userPhone.focus();
			return false;
		}
		if(!/^[a-zA-Z][0-9a-zA-Z]{7,14}$/.test(sf.userId.value.trim())){
			alert("아이디 형식을 확인하세요!");
			sf.userId.focus();
			return false;
		} 
		if(!/^[a-zA-Z][0-9a-zA-Z]{7,14}$/.test(sf.userPw.value.trim())){
			alert("비밀번호 형식을 확인하세요!");
			sf.userPw.focus();
			return false;
		}
		if(sf.userPwCheck.value.trim()!= sf.userPw.value.trim()){
			alert("비밀번호 확인란이 일치하지 않습니다.");
			sf.userPwCheck.focus();
			return false;
		} 
		if(!/^\d{8}$/.test(sf.userBirth.value.trim())){
			alert("생년월일 형식을 확인하세요!");
			sf.userBirth.focus();
			return false;
		} 
		if(!/^\d{9,11}$/.test(sf.userPhone.value.trim())){
			alert("전화번호 형식을 확인하세요!");
			sf.userPhone.focus();
			return false;
		}  
		 				
		sf.submit();
}