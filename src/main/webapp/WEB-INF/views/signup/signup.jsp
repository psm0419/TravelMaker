<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel Maker Sign Up Page</title>
<link rel="stylesheet" type="text/css" href="/css/signup/signup.css">
</head>
<body>


	<form action="/user/signup" method="post">
		<div class="signup_container">

			<!-- 회원가입 로고 -->
			<h1 class="signup_logo">signup 로고 및 회원가입</h1>

			<!-- 회원가입 아이디 비밀번호 닉네임 박스 -->
        <div class="div_signup_main">
            <!-- 아이디 입력창 -->
			<div class="div_signup_input_id">
                <input type="text"class="signup_input_id" value="" placeholder="아이디" maxlength="20" autocapitalize="off"
                id="signup_id" name="signup_id">
				<button type="button" class="btn_signup_input_id_overlapping">중복확인</button>
				<br>
			</div>


			<!-- 비밀번호 입력창 -->
			<div class="div_signup_input_pw">
                <input type="password"class="signup_input_pw" value="" placeholder="비밀번호" maxlength="20"
                id="signup_pw" name="signup_pw"> <br>
			</div>

			<!-- 닉네임 입력창 -->
			<div class="div_signup_input_nickname">
                <input type="text"class="signup_input_nickname" placeholder="닉네임">
				<button type="button" class="btn_signup_input_nickname_overlapping">중복확인</button> <br>
			</div>
        </div>
        <div class="error_text" id="idMsg" style="display: none"></div>
        <div class="error_text" id="pwMsg" style="display: none"></div>

        <!-- 이름 전화번호 이메일 입력창 -->
        <div class="div_signup_sup">
        
			<!-- 이름 입력창 -->
			<div class="div_signup_input_name">
                <input type="text"class="signup_input_name" placeholder="이름을 입력해주세요"> <br>
			</div>

            <!-- 주민등록번호 입력창 -->
			<div class="div_signup_input_jumin">
                <input type="text"class="signup_input_jumin" placeholder="주민등록번호를 입력해주세요 (- 제외)"> <br>
			</div>

			<!-- 휴대폰 번호 입력창 -->
			<div class="div_signup_input_tel">
                <input type="tel"class="signup_input_tel" placeholder="ex.01012341234">
				<button type="button" class="btn_signup_input_tel_certifiel">인증하기</button>
			</div>


			<!-- 이메일 입력창 -->
			<div class="div_signup_input_email">
                <input type="email"class="signup_input_email" placeholder="ex.abcd@abc.com">
				<button type="button" class="btn_signup_input_email_certifiel">인증하기</button>
			</div>
        </div>

			<br>

			<div>약관 동의 공간 클래스 지정 해야함</div>
			<br> <input type="checkbox">동의 <br> <br>



			<button type="button">취소</button>
			<button type="submit">확인</button>


		</div>
	</form>
	<!-- 폼 끝 -->



</body>

<script>

    //아이디 검사식
document.addEventListener("DOMContentLoaded", function () {
    const signupInput = document.getElementById("signup_id");
    const errorText = document.getElementById("idMsg");

    // 특수문자 검출 정규식 (영문, 숫자만 허용)
    const specialChar = /[^?a-zA-Z0-9/]/;

    // 입력 시 실시간 검증
    signupInput.addEventListener("input", function () {
        const inputValue = signupInput.value;
        

        // 1. 특수문자 포함 여부 확인
        if (specialChar.test(inputValue)) {
            errorText.style.display = "block";
            errorText.textContent = "특수 문자 및 한글과 띄어쓰기는 지원하지 않습니다.";
            errorText.style.color = "red";
            signupInput.style.color = "red";
        } 
        // 2. 길이 조건 확인 (6~20자)
        else if (inputValue.length > 20 || inputValue.length < 6) {
            errorText.style.display = "block";
            errorText.textContent = "아이디는 6자 이상 최대 20자 까지 지원합니다.";
            errorText.style.color = "red";
            signupInput.style.color = "red";
        } 
        else {
            // 조건을 만족하면 오류 메시지 숨김
            errorText.style.display = "none";
            signupInput.style.color = "grey";
        }
    });

    // 포커스 아웃 시 필수 입력 체크
    signupInput.addEventListener("blur", function () {
        if (signupInput.value.trim() === "") {
            errorText.style.display = "block";
            errorText.textContent = "아이디는 필수 입력입니다.";
            errorText.style.color = "red";
            signupInput.style.color = "red";
        }
    });

    // 포커스를 얻으면 에러 메시지 숨김
    signupInput.addEventListener("focus", function () {
        errorText.style.display = "none";
        signupInput.style.color = "grey";
    });
});

</script>
</html>