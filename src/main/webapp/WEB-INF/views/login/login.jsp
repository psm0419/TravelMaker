<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login page</title>
<link rel="stylesheet" type="text/css" href="/css/login/login.css">
</head>
<body>

	<form action="/user/login" method="post" id="loginForm">
		<div class="login_container">

		
			<h1 class="login_logo">로고 및 로그인</h1>

			<div class="dvi_login_main">
				<!-- 아이디 입력창 -->
				<div class="div_login_input_id">
					<input type="text" class="login_input_id" value=""
						placeholder="아이디" maxlength="20" autocapitalize="off"
						id="login_id" name="userId" required> <br>
				</div>


				<!-- 비밀번호 입력창 -->
				<div class="div_login_input_pw">
					<input type="password" class="login_input_pw" value=""
						placeholder="비밀번호" maxlength="20" id="login_pw" name="password" required>
					<br>
				</div>

				<br>

			</div>
			<div class="error_text" id="idMsg" style="display: none"></div>
			<div class="error_text" id="pwMsg" style="display: none"></div>
			<br>
			
			<button type="submit" id="btn_login_sumbmit">로그인</button>
			
			<button type="button">
				<a href="SignUp">회원가입</a>
			</button>
			
			<button type="button">
				<a href="findIdPw">아이디/비밀번호찾기</a>
			</button>
		</div>
	</form>
	<!-- 폼 끝 -->

</body>

<script>
// document.addEventListener("DOMContentLoaded", function () {
// }


document.getElementById("loginForm").addEventListener("submit", function (event) {
    event.preventDefault(); 

    let loginId = document.getElementById("login_id").value.trim();
    let loginPw = document.getElementById("login_pw").value.trim();

    // 입력값 유효성 검사
    if (!loginId || !loginPw) {
        alert("아이디와 비밀번호를 입력하세요.");
        return;
    }
    
    const loginHeaders = new Headers();
    loginHeaders.append("Content-Type", "application/json");
    const loginBody = { userId: loginId, pw: loginPw };
    console.log(loginBody);
    
//     //로그인 요청
    fetch("http://localhost:8080/user/login", {
        method: "POST",
        headers: loginHeaders,
        body: JSON.stringify({ userId: loginId, pw: loginPw })
    })
    .then(response => response.text()) //서버 응답 텍스트로 변환
    .then(data => {
        if (data === "로그인 성공!") {
            alert("환영합니다!");
            window.location.href = "/"; // 로그인 후 이동할 페이지
        } else {
            alert(data); //오류 메시지 알림창
        }
    })
    .catch(error => {
        console.error("로그인 오류:", error);
        alert("로그인 요청 중 오류가 발생했습니다.");
    });
});
	

</script>


</html>