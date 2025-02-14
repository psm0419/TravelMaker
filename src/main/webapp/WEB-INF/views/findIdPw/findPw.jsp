<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="/user/findPw" method="post" id="findpwForm">

		<div class="findPw_container">

			<!-- 비밀번호 찾기 아이디 입력창 -->
			<div class="div_findPw_input_id">
				<input type="text" class="findPw_input_id" value=""
					placeholder="아이디" maxlength="20" id="findpw_id" name="userId">
				<br>
			</div>

			<!-- 비밀번호 찾기 주민등록번호 입력창 -->
			<div class="div_findpw_input_pw">
				<input type="text" class="findId_input_jumin"
					placeholder="주민등록번호를 입력해주세요 (- 제외)" name="jumin" id="findPw_jumin">
				<br>
			</div>

			<!-- 비밀번호 찾기 이메일 입력창 -->
			<div class="div_findPw_input_pw">
				<input type="email" class="signup_input_email"
					placeholder="ex.abcd@abc.com" id="findPw_email" name="email">
				<br>
			</div>

			<button type="submit">비밀번호 찾기</button>

		</div>
	</form>

</body>

<script>

document.getElementById("findpwForm").addEventListener("submit", function (event) {
    event.preventDefault(); 
 
    let findPwId = document.getElementById("findpw_id").value.trim();
    let findPwJumin = document.getElementById("findPw_jumin").value.trim();
    let findPwEmail = document.getElementById("findPw_email").value.trim();
    
    if (!findPwId || !findPwJumin || !findPwEmail) {
        alert("모든 정보를 입력하세요.");
        return;
    }
    
    // 비밀번호 찾기 요청
    
    fetch("http://localhost:8080/user/findPw",{
    	method: "POST",
    	headers: { "Content-Type" : "application/json"},
   		body: JSON.stringify({findPwForId: findPwId,  findPwForJumin: findPwJumin, findPwForEmail: findPwEmail }) 
	})
    	.then(response => response.text())
        .then(data => {
            alert(data); // "비밀번호가 이메일로 발송 되었습니다" 메시지 확인
        })
        .catch(error => {
            console.error("Error:", error);
            alert("이메일 전송 중 오류가 발생했습니다.");
        })
	});
	
	
</script>
</html>