<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel Maker Sign Up Page</title>
<style>

/* 결과 메시지 스타일 */
#verificationResult {
	font-size: 16px;
	font-weight: bold;
	margin-top: 10px;
}

.success {
	color: green;
}

.error {
	color: red;
}

.hidden {
	display: none;
}
</style>
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
					<input type="text" class="signup_input_id" value=""
						placeholder="아이디" maxlength="20" autocapitalize="off"
						id="signup_id" name="userId"> <br>
					<p id="userIdCheckResult"></p>
				</div>

				<!-- 비밀번호 입력창 -->
				<div class="div_signup_input_pw">
					<input type="password" class="signup_input_pw" value=""
						placeholder="비밀번호" maxlength="20" id="signup_pw" name="pw">
					<br>
					<p id="pwMsg"></p>
				</div>

				<!-- 비밀번호 확인 입력창 -->
				<div class="div_signup_input_pw_check">
					<input type="password" class="signup_input_pw_check" value=""
						placeholder="비밀번호 확인" maxlength="20" id="signup_pw_check"
						name="pw_check"> <br>
					<p id="pwCheckMsg"></p>
				</div>

				<!-- 닉네임 입력창 -->
				<div class="div_signup_input_nickname">
					<input type="text" class="signup_input_nickname" placeholder="닉네임"
						name="nickName" id="signup_nickname"> <br>
					<p id="userNickNameCheckResult"></p>
				</div>
			</div>

			<!-- 이름 전화번호 이메일 입력창 -->
			<div class="div_signup_sup">

				<!-- 이름 입력창 -->
				<div class="div_signup_input_name">
					<input type="text" class="signup_input_name"
						placeholder="이름을 입력해주세요" name="userName"> <br>
				</div>

				<!-- 주민등록번호 입력창 -->
				<div class="div_signup_input_jumin">
					<input type="text" class="signup_input_jumin"
						placeholder="주민등록번호를 입력해주세요 (- 제외)" name="jumin" id="signup_jumin">
					<br>
					<p id="userJuminCheckResult"></p>
				</div>

				<!-- 휴대폰 번호 입력창 -->
				<div class="div_signup_input_tel">
					<input type="tel" class="signup_input_tel"
						placeholder="ex.01012341234" name="tel" id="signup_tel">
					<button type="button" class="btn_signup_input_tel_certifiel">인증하기</button>
					<br>
					<p id="userTelCheckResult"></p>
				</div>


				<!-- 이메일 입력창 -->
				<div class="div_signup_input_email">
					<input type="email" class="signup_input_email"
						placeholder="ex.abcd@abc.com" id="sign_email" name="email">

					<!-- 이메일 인증하기 버튼 -->
					<button type="button" class="btn_signup_input_email_certifiel"
						id="emailapprove">인증하기</button>
					<p id="useremailapproveResult"></p>
					<p id="userEmailCheckResult"></p>
					
					
					<div class="signup_code" id="signup_code_container">
						<!-- 인증 코드 입력 form 태그 안에 있을 시 새로고침이 되므로 빼어놓음 -->
						<div id="verificationSection"
							class="${showVerificationSection ? '' : 'hidden'}">
							<input type="text" id="verification_code" name="code"
								placeholder="인증 코드 입력" required>
							<button type="button" onclick="verifyEmail()">인증 확인</button>
							<!-- 			인증코드 유효성 메세지 -->
							<p id="codeMsg"></p>
							<!-- 인증 결과 표시 -->
							<p id="verificationResult"
								class="${success ? 'success' : 'error'}">${verificationMessage}</p>
						</div>
					</div>
				</div>


				<div>약관 동의 공간 클래스 지정 해야함</div>
				<!-- 약관 동의 버튼 처음 비활성화 -->
				<br> <input type="checkbox" id="termsAgreement" disabled>동의
				<br> <br>

				<button type="button" id="cancelBtn">
					<a href="login">취소</a>
				</button>

				<!-- 확인 버튼은 처음에 비활성화 -->
				<button type="submit" id="submitBtn" disabled>확인</button>
			</div>
		</div>
	</form>



	<!-- 폼 끝 -->
</body>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
  
  //====================== 이메일 인증 파트===================
  		  
	  let emailVreifile = false; //이메일 인증 기본 비활성화
  
    //이메일 인증 버튼
    document.addEventListener("DOMContentLoaded", function () {
    // 버튼 클릭 이벤트 리스너 추가 
    document.getElementById("emailapprove").addEventListener("click", sendEmail);
});
    
    function sendEmail(){
    	let email = document.getElementById('sign_email').value;
    	
    	if(!email){
    		alert("이메일을 입력하세요.");
    		return;
    	}
    
    	 console.log("이메일 인증 요청:", email); // 디버깅용
    
    fetch("http://localhost:8080/user/sendVerificationEmail", { // 백엔드 API 호출
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email: email })
    })
    .then(response => response.text())
    .then(data => {
        alert(data); // "이메일이 발송되었습니다. (3분 이내 입력)" 메시지 확인
    
     // 인증 코드 입력 칸 활성화
        document.getElementById("verificationSection").classList.remove("hidden");
        document.getElementById("emailapprove").disabled = true; // 인증 후 이메일 수정 불가
        document.getElementById("verificationSection").style.display = "block"; // 인증 코드 입력창 표시
    })
    .catch(error => {
        console.error("Error:", error);
        alert("이메일 전송 중 오류가 발생했습니다.");
    });
}
    
    //이메일 발송 결과

    //인증번호 입력
    
    function verifyEmail() {
    let code = document.getElementById('verification_code').value;

    let codeRegex = /^\d{6}$/;
    
    if (!code) {
        alert("인증 코드를 입력하세요.");
        return;
    }

    fetch("http://localhost:8080/user/verifyEmail", { // 백엔드 엔드포인트 확인
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ code: code }) // 인증 코드 전달
    })
    .then(response => response.text())
    .then(data => {
    	
        let resultMessage = document.getElementById("verificationResult");

        if (!codeRegex.test(code)) {
            verificationMsg.textContent = "인증 코드는 6자리 숫자여야 합니다.";
            verificationMsg.style.color = "red";
        } else {
        
	        if (data === "인증 성공!") {
	            resultMessage.textContent = "✅ 인증되었습니다!";
	            resultMessage.className = "success";
	            emailVreifile = true; //인증 활성화
	            document.getElementById("termsAgreement").disabled = false;
	        } else {
	            resultMessage.textContent = "❌ " + data;
	            resultMessage.className = "error";
	        }
        }
    })
    .catch(error => {
        console.error("Error:", error);
        alert("인증 확인 중 오류가 발생했습니다.");
    });
}
    

 	//======================유효성 검사=========================
 		
 	let submitBtn = document.getElementById("submitBtn"); // 확인 버튼
    let termsCheckbox = document.getElementById("termsAgreement"); // 약관 체크박스
    
    let isIdValid = false;
    let isPwValid = false;
    let isNickValid = false;
    let isJuminValid = false;
    let isTelValid = false;
    let isEmailValid = false;
    let emailVerified = false; // 이메일 인증 여부
    let termsChecked = false; // 약관 동의 여부
 		
 		//아이디 중복확인
 		
 	let signupInput = document.getElementById('signup_id');  //아이디 값 확인
    let span_checkDupMsg = document.getElementById("userIdCheckResult");
 	
    let idRegex = /^[a-zA-Z0-9]{6,20}$/;
    
    signupInput.addEventListener('input',()=>{ // 실시간 입력 감지
		
		let inputId = document.getElementById('signup_id').value.trim();
		
		console.log(inputId);
		
		let objData = { //javascript Object 타입
			'id':inputId
		};
		
		let jsonData = JSON.stringify(objData);
		
		$.ajax({
			type: "POST",
			url: "http://localHost:8080/user/checkDupId",
			headers :{
				"Content-type" : "appication/json;"
			},
			data: inputId,
			success: function(result){
				console.log("ajax success");
				console.log(result);
				
				if(!idRegex.test(inputId)){
					span_checkDupMsg.textContent = '아이디는 6~20자의 영문 및 숫자로 입력해야 합니다.';
					span_checkDupMsg.style.color = 'red';
				}else {
					if(result == "Y"){ //중복
						span_checkDupMsg.textContent = '중복된 아이디 입니다.';
						span_checkDupMsg.style.color = 'red';
						isValid = false;
					}else { //중복 x
						span_checkDupMsg.textContent = '사용 가능한 아이디입니다.'; 
						span_checkDupMsg.style.color = 'green';
						isIdValid = true;
					}
				}
				
			},
			error: function(error){
				console.log(error);
			}
        })
    });
 		
    //닉네임 중복확인 실시간
    
    let NickInput = document.getElementById('signup_nickname');  //닉네임값
    let span_checkDupNicknameMsg = document.getElementById("userNickNameCheckResult");
 	
    let nickRegex = /^[가-힣a-zA-Z0-9]{2,10}$/;
    
   		 NickInput.addEventListener('input',()=>{
		
		let NickInput = document.getElementById('signup_nickname').value.trim();
		
		console.log(NickInput);
		
		let objData = { //javascript Object 타입
			'nickname':NickInput
		};
		
		let jsonData = JSON.stringify(objData);
		
		$.ajax({
			type: "POST",
			url: "http://localHost:8080/user/checkDupNickName",
			headers :{
				"Content-type" : "appication/json;"
			},
			data: NickInput,
			success: function(result){
				console.log("ajax success");
				console.log(result);
				
				if(!nickRegex.test(NickInput)){
					span_checkDupNicknameMsg.textContent = '닉네임은 2~10자로 한글, 영문, 숫자로 입력하세요.';
					span_checkDupNicknameMsg.style.color = 'red';
				}else {
					
					if(result == "Y"){ //중복
						span_checkDupNicknameMsg.textContent = '중복된 닉네임 입니다.';
						span_checkDupNicknameMsg.style.color = 'red';
						isValid = false;
					}else { //중복 x
						span_checkDupNicknameMsg.textContent = '사용 가능한 닉네임입니다.'; 
						span_checkDupNicknameMsg.style.color = 'green';
						isNickValid = true;
					}
				}
				
			},
			error: function(error){
				console.log(error);
			}
        })
    });
   		 
   	  //주민번호 중복확인 실시간
   	    
   let JuminInput = document.getElementById('signup_jumin');  //주민번호 값
   let span_checkDupJuminMsg = document.getElementById("userJuminCheckResult");
	
   let juminRegex = /^\d{2}([0]\d|[1][0-2])([0][1-9]|[1-2]\d|[3][0-1])[1-4]\d{6}$/;
	
   JuminInput.addEventListener('input',()=>{
	
	let JuminInput = document.getElementById('signup_jumin').value.trim();
	
	console.log(JuminInput);
	
	let objData = { //javascript Object 타입
		'jumin':JuminInput
	};
	
	let jsonData = JSON.stringify(objData);
	
	$.ajax({
		type: "POST",
		url: "http://localHost:8080/user/checkDupJumin",
		headers :{
			"Content-type" : "appication/json;"
		},
		data: JuminInput,
		success: function(result){
			console.log("ajax success");
			console.log(result);
			
			if(!juminRegex.test(JuminInput)){
				span_checkDupJuminMsg.textContent = '주민등록번호는 13자리 입니다.';
				span_checkDupJuminMsg.style.color = 'red';
			}else {
			
				if(result == "Y"){ //중복
					span_checkDupJuminMsg.textContent = '이미 가입되어 있는 주민등록번호 입니다.';
					span_checkDupJuminMsg.style.color = 'red';
					isValid = false;
				}else { //중복 x
					span_checkDupJuminMsg.textContent = '회원가입 가능한 주민등록번호 입니다.'; 
					span_checkDupJuminMsg.style.color = 'green';
					isJuminValid = true;
				}
			}
			
		},
		error: function(error){
			console.log(error);
		}
       })
   });
   	   		 
   	  //휴대전화 중복확인 실시간
      
   let TelInput = document.getElementById('signup_tel');  //닉네임값
   let span_checkDupTelMsg = document.getElementById("userTelCheckResult");
   
   let telRegex = /^010\d{8}$/;
	
   TelInput.addEventListener('input',()=>{
	
	let TelInput = document.getElementById('signup_tel').value.trim();
	
	console.log(TelInput);
	
	let objData = { //javascript Object 타입
		'tel':TelInput
	};
	
	let jsonData = JSON.stringify(objData);
	
	$.ajax({
		type: "POST",
		url: "http://localHost:8080/user/checkDupTel",
		headers :{
			"Content-type" : "appication/json;"
		},
		data: TelInput,
		success: function(result){
			console.log("ajax success");
			console.log(result);
			
			if(!telRegex.test(TelInput)){
				span_checkDupTelMsg.textContent = '전화번호는 010으로 시작하는 11자리 숫자 입니다.';
				span_checkDupTelMsg.style.color = 'red';
			}else {
				
				if(result == "Y"){ //중복
					span_checkDupTelMsg.textContent = '이미 가입된 전화번호 입니다.';
					span_checkDupTelMsg.style.color = 'red';
					isValid = false;
				}else { //중복 x
					span_checkDupTelMsg.textContent = '회원가입 가능한 전화번호 입니다.'; 
					span_checkDupTelMsg.style.color = 'green';
					isTelValid = true;
				}
			}
			
		},
		error: function(error){
			console.log(error);
		}
       })
   });
   	     		 
   	     		 
   	     		 
 //이메일 중복확인 실시간
   
   let EmailInput = document.getElementById('sign_email');  //닉네임값
   let span_checkDupEmailMsg = document.getElementById("userEmailCheckResult");
	
   let emailRegex =  /(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))/;
   
   EmailInput.addEventListener('input',()=>{
	
	let EmailInput = document.getElementById('sign_email').value.trim();
	
	console.log(EmailInput);
	
	let objData = { //javascript Object 타입
		'email':EmailInput
	};
	
	let jsonData = JSON.stringify(objData);
	
	$.ajax({
		type: "POST",
		url: "http://localHost:8080/user/checkDupEmail",
		headers :{
			"Content-type" : "appication/json;"
		},
		data: EmailInput,
		success: function(result){
			console.log("ajax success");
			console.log(result);
			
			
			if(!emailRegex.test(EmailInput)){
				span_checkDupEmailMsg.textContent = '올바른 이메일 주소를 입력하세요.';
				span_checkDupEmailMsg.style.color = 'red';
			}else {
			
				if(result == "Y"){ //중복
					span_checkDupEmailMsg.textContent = '이미 가입된 이메일 입니다.';
					span_checkDupEmailMsg.style.color = 'red';
					isValid = false;
				}else { //중복 x
					span_checkDupEmailMsg.textContent = '회원 가입 가능한 이메일 입니다.'; 
					span_checkDupEmailMsg.style.color = 'green';
					isEmailValid = true;
				}
			}
			
		},
		error: function(error){
			console.log(error);
		}
       })
   });
 	
   
//    // 비밀번호 유효성 검사
 document.addEventListener("DOMContentLoaded", function () {
	 let pwInput = document.getElementById("signup_pw"); // 비밀번호 입력창
	    let pwMsg = document.getElementById("pwMsg"); // 메시지창

    let pwRegex = /^(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,20}$/; 
    // 최소 8자리 이상, 숫자 및 특수문자가 각각 1개 이상

    pwInput.addEventListener("input", function () {
    	
        let pw = pwInput.value.trim(); // 입력값 가져오기
        
        if (pw === "") { // 입력값이 없으면 메시지 숨김
            pwMsg.textContent = "";
            pwMsg.style.display = "none";
        } else {
            pwMsg.style.display = "block"; // 입력 중이면 메시지 표시

            if (!pwRegex.test(pw)) {
                pwMsg.textContent = "비밀번호는 8~20자 문자+숫자+특수문자 입니다.";
                pwMsg.style.color = "red";
                isValid = false;
            } else {
                pwMsg.textContent = "사용 가능한 비밀번호입니다.";
                pwMsg.style.color = "green";
                isPwValid = true;
            }
        }
    });
});
	   
	   
//// 비밀번호 확인 유효성 검사
 document.addEventListener("DOMContentLoaded", function () {
	 
	 let Signup_pwInput = document.getElementById("signup_pw"); // 비밀번호 입력창
	 let pwCheckInput = document.getElementById("signup_pw_check"); // 비밀번호 확인 입력창
	 let pwCheckMsg = document.getElementById("pwCheckMsg"); // 비밀번호 확인 메시지창

    let pwCheckRegex = /^(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,20}$/; 
    // 최소 8자리 이상, 숫자 및 특수문자가 각각 1개 이상

    pwCheckInput.addEventListener("input", function () {
    	
        let pwCheck = pwCheckInput.value.trim(); // 입력값 가져오기
        let password = Signup_pwInput.value.trim();
        
        if (pwCheck === "") { // 입력값이 없으면 메시지 숨김
        	pwCheckMsg.textContent = "";
        	pwCheckMsg.style.display = "none";
        } else {
        	pwCheckMsg.style.display = "block"; // 입력 중이면 메시지 표시

            if (pwCheck !== password) {
            	pwCheckMsg.textContent = "비밀번호가 일치하지 않습니다..";
            	pwCheckMsg.style.color = "red";
            	emailVerified = false;
            } else {
            	pwCheckMsg.textContent = "비밀번호가 일치합니다.";
            	pwCheckMsg.style.color = "green";
            	emailVerified = true;
            }
        }
    });
});
	   
	   
	   
	   
	// 인증 코드 유효성 검사 (6자리 숫자)
	
	document.addEventListener("DOMContentLoaded", function () {
	let codeInput = document.getElementById('verification_code');
    let codeMsg = document.getElementById("codeMsg"); // 메시지창

    let codeRegex = /^\d{6}$/;

    codeInput.addEventListener("input", function () {
    	
        let code = codeInput.value.trim(); // 입력값 가져오기
        
        if (!codeRegex.test(code)) {
        	codeMsg.style.display = "block";
         	codeMsg.textContent = "인증코드는 숫자 6자리 입니다.";
         	codeMsg.style.color = "red";
         	emailVerified = false;
         } else {
         	codeMsg.style.display = "none";
         	emailVerified = true;
         }
        })
    });
	
	//약관 동의 체크
 	termsCheckbox.addEventListener("change", function () {
     termsChecked = termsCheckbox.checked;
     if(termsChecked){
    	 checkFormValidity();
     } else{
    	 !termsCheckbox.checked;
     }
 });
	
	//전부 체크 했을 시에 확인버튼 활성화
 function checkFormValidity() {
     if (isIdValid && isPwValid && isNickValid && isJuminValid && isTelValid && emailVerified && termsChecked) {
         submitBtn.disabled = false; // 모든 조건 충족 시 버튼 활성화
     } else {
         submitBtn.disabled = true; // 하나라도 충족되지 않으면 버튼 비활성화
     }
 }
</script>
</html>