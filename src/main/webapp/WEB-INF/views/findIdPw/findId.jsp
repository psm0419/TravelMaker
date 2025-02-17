<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" type="text/css" href="/css/findidpw/findId.css">
</head>
<body>

	<form action="/user/findId" method="post" id="findidForm">


		<div class="findId_container">
			<div class="headerLogo">
				<img src="/images/TravelMakerLogo.jpg" alt="logo"> 아이디 찾기
			</div>

			<div class="dvi_findId_main">

				<!-- 아이디 찾기 주민등록번호 입력창 -->
				<div class="div_Find_input_jumin">
					<input type="text" class="findId_input_jumin"
						placeholder="주민등록번호를 입력해주세요 (- 제외)" name="jumin" id="findId_jumin">
				</div>
			</div>


			<!-- 아이디 찾기 이메일 입력창 -->
			<div class="div_FindId_input_email">
				<input type="email" class="findId_input_email"
					placeholder="ex.abcd@abc.com" id="findId_email" name="email">
				<br>
			</div>
			<button type="submit">아이디 찾기</button>
			<br>
			<button type="button" class="cancelBtn"
				onclick="location.href='login'">취소</button>
		</div>
	</form>

</body>

<script>


document.getElementById("findidForm").addEventListener("submit", function (event) {
    event.preventDefault(); 
 
    let findIdJumin = document.getElementById("findId_jumin").value.trim();
    let findIdEmail = document.getElementById("findId_email").value.trim();
    
    if (!findIdJumin || !findIdEmail) {
        alert("아이디와 비밀번호를 입력하세요.");
        return;
    }
    
    // 아이디 찾기 요청
    
    fetch("http://localhost:8080/user/findId",{
    	method: "POST",
    	headers: { "Content-Type" : "application/json"},
   		body: JSON.stringify({ findIdForJumin:findIdJumin , findIdForEmail:findIdEmail })
    })
    	.then(response => response.text())
        .then(data => {
            alert(data); // "이메일로 아이디가 발송 되었습니다" 메시지 확인
        })
        .catch(error => {
            console.error("Error:", error);
            alert("이메일 전송 중 오류가 발생했습니다.");
        })
    });
	
//로고버튼 홈화면
document.querySelector(".headerLogo").addEventListener("click", function () {
	    window.location.href = "/"; // 홈 페이지로 이동
	});
	
</script>
</html>