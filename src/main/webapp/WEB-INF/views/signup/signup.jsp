<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel Maker Sign Up Page</title>
<link href="/css/signup/signup.css" rel="stylesheet" type="text/css">	
</head>
<body>

<div class="signup_container">

    <!-- 회원가입 로고 -->
    <div class="signup_logo"><h1>sign up page 로고 및 회원가입</h1></div>
    
    <!-- 아이디 입력창 -->
    아이디 <input type="text" class ="signup_input_id" placeholder="아이디를 입력하세요.">
    <button type="button">중복확인</button> <br>
        <span id="signup_span_id">아이디 최대 몇자 경고 구간</span> <br>

    <!-- 비밀번호 입력창 -->
    비밀번호 <input type="password" class="signup_input_pw" placeholder="비밀번호를 입력하세요."> <br>
        <span>연속되지 않고 특수문자 포함 최소 8글자</span> <br>

    <!-- 비밀번호 확인 이력창 -->
    비밀번호 확인 <input type="password" class="signup_input_confirm" placeholder="비밀번호를 다시 입력하세요."> <br>
        <span>비밀번호와 같은 걸로</span> <br>

    <!-- 닉네임 입력창 -->
    닉네임 <input type="text" class="signup_input_nickname" placeholder="닉네임을 설정해 주세요."> 
    <button type="button">중복확인</button> <br>
        <span>특수문자 제외한 8글자</span> <br>

    <!-- 이름 입력창 -->
    이름 <input type="text" class="signup_input_name" placeholder="이름을 입력해주세요"> <br>
    <span>이름 입력창</span> <br>

    <!-- 휴대폰 번호 입력창 -->
    휴대폰 번호 <input type="tel" class="signup_input_tel" placeholder="ex.01012341234">
    <button type="button">인증하기</button> <br>
        <span>01012341234</span> <br>

    <!-- 이메일 입력창 -->
    이메일 <input type="email" class="signup_input_email" placeholder="ex.abcd@abc.com">
    <button type="button">인증하기</button> <br>
        <span>이메일 공간</span> <br>

</div>

<br>

<div>약관 동의 공간 클래스 지정 해야함</div> <br>
<input type="checkbox">동의

</body>

<script>

</script>
</html>