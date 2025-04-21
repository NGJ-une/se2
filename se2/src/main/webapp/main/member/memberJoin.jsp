<%@page import="com.hotel.mypage.PwchangeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HELIA HOTEL : 회원가입</title>
  <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
        }

        form {
            width: 650px;
            padding: 20px;
            margin: 0 auto;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #6b4c2f;
        }

        label {
            display: block;
            margin-bottom: 5px;
            text-align: left;
            font-size: 14px;
            color: #333;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"], input[type="reset"] {
            background-color: #eee;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover, input[type="reset"]:hover {
            background-color: #eee;
        }

        input[type="reset"]:hover {
            background-color: #E4D9C7;
        }

        .email-group {
            display: flex;
            justify-content: space-between;
        }

        .email-group input {
            width: 48%;
        }

        hr {
            width: 100%;
            border: none;
            border-top: 2px solid #eeeeeec0;
            margin: 10px 0 20px;
        }

        .idCheck {
            width: 500px;
            padding: 10px;
            margin-bottom: 15px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="button"] {
            width: 17%;
            background-color: #eeeeeec0;
            border: none;
            cursor: pointer;
        }

        input[type="button"]:hover {
            background-color: #E4D9C7;
        }

        a {
            text-decoration: none;
            color: #b58143;
            margin: 0 10px;
        }

        input[type="submit"] {
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #E4D9C7;
        }

        a:hover {
            color: #f0b675;
            text-decoration: underline;
        }

        .password-wrapper {
            position: relative;
            width: 100%;
        }

        .password-wrapper input {
            width: 100%;
            padding-right: 40px;
        }

        .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 18px;
            padding-bottom: 15px;
        }

        .pwdMissMatch {
            color: red;
            font-size: 14px;
            margin-top: 10px;
        }

        .step-wrapper {
            display: flex;
            justify-content: center;
        }

        .step-container {
            display: flex;
            gap: 2rem;
        }

        .step {
            text-align: center;
            padding: 1rem;
            border-bottom: 3px solid #ccc;
            color: #888;
            font-weight: bold;
            min-width: 120px;
        }

        .step.active {
            border-bottom: 4px solid #825517;
            color: #000;
        }

      /* 기존 스타일 수정 */
.error-msg {
    color: red;
    font-size: 12px;
    display: none;
}

input.invalid ~ .error-msg {
    display: block;
}
#birthError {
    color: red;
    display: none; /* 기본적으로 숨기기 */
}
.invalid {
    border: 1px solid red; /* 잘못된 입력일 경우 빨간 테두리 */
}
    </style>


<script>
const form = document.forms['memberJoin'];
const fnameInput = form['fname'];
const lnameInput = form['lname'];
const email1Input = form['email1'];
const email2Input = form['email2'];
const pwdInput = form['pwd'];
const confirmPwdInput = form['pwdcheck'];
const telInput = form['tel'];
const birthInput = form['birth'];
const answerInput = form['answer'];

const fnameError = document.getElementById("fnameError");
const lnameError = document.getElementById("lnameError");
const email1Error = document.getElementById("email1Error");
const email2Error = document.getElementById("email2Error");
const pwdError = document.getElementById("pwdError");
const confirmPwdError = document.getElementById("confirmPwdError");
const telError = document.getElementById("telError");
const birthError = document.getElementById("birthError");
const answerError = document.getElementById("answerError");

// ID 중복 체크
function openIdCheck() {
    var popupWidth = 600;
    var popupHeight = 300;
    var popupX = Math.ceil(( window.screen.width - popupWidth ) / 2);
    var popupY = Math.ceil(( window.screen.height - popupHeight ) / 2); 
    window.open('idCheck.jsp', 'idCheck', 'width=' + popupWidth + ',height=' + popupHeight + ',left=' + popupX + ',top=' + popupY);
}

// 비밀번호 보이기/숨기기
function togglePwd(id) {
    const input = document.getElementById(id);
    if (input.type === "password") {
        input.type = "text";
    } else {
        input.type = "password";
    }
}

// 이름은 한글과 영어만 허용
function blockName(input, errorElementId) {
    const regex = /^[가-힣a-zA-Z]+$/; // 한글 또는 영어
    const errorElement = document.getElementById(errorElementId);

    if (!regex.test(input.value)) {
        input.classList.add("invalid");
        if (errorElement) errorElement.style.display = "block";
    } else {
        input.classList.remove("invalid");
        if (errorElement) errorElement.style.display = "none";
    }
}

// 비밀번호: 영어, 숫자, 특수문자만 허용
function blockPwd(input) {
    const regex = /^[A-Za-z0-9@$!%*#?&]+$/; // 영문, 숫자, 특수문자만 허용
    const hangulRegex = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글 체크용 정규식
    if (hangulRegex.test(input.value)) {
        pwdError.style.display = "block";
        input.classList.add("invalid");
    } else if (!regex.test(input.value)) {
        pwdError.style.display = "block";
        input.classList.add("invalid");
    } else {
        pwdError.style.display = "none";
        input.classList.remove("invalid");
    }
}

// 비밀번호 일치 여부
function checkPwdMatch() {
    const pwd = pwdInput.value.trim();
    const confirmPwd = confirmPwdInput.value.trim();

    if (pwd !== confirmPwd || pwd === "" || confirmPwd === "") {
        confirmPwdError.style.display = "block";
        confirmPwdInput.classList.add("invalid");
        return false;
    } else {
        confirmPwdError.style.display = "none";
        confirmPwdInput.classList.remove("invalid");
        return true;
    }
}

// 이메일 유효성 체크: 한글 포함 안됨
function blockEmail1(input) {
    const error = document.getElementById("emailError1");
    const hangulRegex = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
    if (hangulRegex.test(input.value)) {
        error.style.display = "block";
        input.classList.add("invalid");
    } else {
        error.style.display = "none";
        input.classList.remove("invalid");
    }
}

// 이메일 2
function blockEmail2(input) {
    const error = document.getElementById("emailError2");
    const hangulRegex = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
    if (hangulRegex.test(input.value)) {
        error.style.display = "block";
        input.classList.add("invalid");
    } else {
        error.style.display = "none";
        input.classList.remove("invalid");
    }
}

// 이메일 자동 채우기 셀렉트문
function emailChange() {
    const select = document.getElementById("emailSel");
    const email2 = document.getElementById("email2");

    if (select.value !== "type") {
        email2.value = select.value;
        email2.readOnly = true;
    } else {
        email2.value = "";
        email2.readOnly = false;
    }
}

// 주소 입력 필드 유효성 검사
function blockAddr(input) {
    const error = document.getElementById("addrError");
    const regex = /^[A-Za-z0-9가-힣\s\-\_\.\(\)\[\]]+$/;

    if (!regex.test(input.value)) {
        input.classList.add("invalid");
        error.style.display = "block";
    } else {
        input.classList.remove("invalid");
        error.style.display = "none";
    }
}

// 질문 답변 입력 필드 유효성 검사


function blockAnswer(input) {
    const answerError = document.getElementById("answerError"); 
    const regex = /^[^\W_]+$/u; // 밑줄과 특수문자 제외, 유니코드 지원
    if (!regex.test(input.value)) {
        input.classList.add("invalid");
        answerError.style.display = "block";
        return false;
    } else {
        input.classList.remove("invalid");
        answerError.style.display = "none";
        return true;
    }
}


// 이메일 한글 넣었는지 확인하는 것
function checkEmailMatch() {
    const email1 = document.getElementById("email1");
    const email2 = document.getElementById("email2");
    const error1 = document.getElementById("emailError1");
    const error2 = document.getElementById("emailError2");

    const hangulRegex = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

    let valid = true;

    if (hangulRegex.test(email1.value)) {
        error1.style.display = "block";
        email1.classList.add("invalid");
        valid = false;
    } else {
        error1.style.display = "none";
        email1.classList.remove("invalid");
    }

    if (hangulRegex.test(email2.value)) {
        error2.style.display = "block";
        email2.classList.add("invalid");
        valid = false;
    } else {
        error2.style.display = "none";
        email2.classList.remove("invalid");
    }

    return valid;
}

// 전화번호: 숫자와 하이픈만 허용
function blockTel(input) {
    // 한글/영어 제거
    input.value = input.value.replace(/[^0-9-]/g, '');

    // 최종 유효성 검사
    const regex = /^[0-9-]+$/;
    if (!regex.test(input.value)) {
        telError.style.display = "block";
        input.classList.add("invalid");
        return false;
    } else {
        telError.style.display = "none";
        input.classList.remove("invalid");
        return true;
    }
}


// 생년월일: 19세 미만 가입 불가

document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("form");
    const birthInput = document.querySelector('input[name="birth"]');
    const birthError = document.getElementById("birthError");

    // 생년월일 최대 날짜 설정 (20살 이상만 선택 가능하도록)
    function setMaxBirthDate() {
        const today = new Date();
        const adultYear = today.getFullYear() - 20;
        const maxDate = new Date(adultYear, today.getMonth(), today.getDate());

        const yyyy = maxDate.getFullYear();
        const mm = String(maxDate.getMonth() + 1).padStart(2, '0');
        const dd = String(maxDate.getDate()).padStart(2, '0');

        birthInput.max = `${yyyy}-${mm}-${dd}`;
    }

    setMaxBirthDate();

    // 폼 제출 시 유효성 검사 (서버에서 최종적으로 생년월일을 확인)
    form.onsubmit = function (event) {
        let valid = true;

        if (!checkPwdMatch()) valid = false;
        if (!checkEmailMatch()) valid = false;
        if (!blockTel(telInput)) valid = false;

        if (!valid) {
            event.preventDefault(); // 폼 제출 막기
        }
    };
});



// 비밀번호 입력값의 유효성을 체크
function validatePwd() {
    blockPwd(pwdInput);
    checkPwdMatch();
}

//a비밀번호 확인 유효성 검사 함수 (validatePwd):
function validatePwd() {
    var pwd = document.getElementById("pwd").value;
    var pwdcheck = document.getElementById("pwdcheck").value;
    var pwdError = document.getElementById("pwdError");

    if (pwd !== pwdcheck) {
        pwdError.style.display = "block";
    } else {
        pwdError.style.display = "none";
    }
}

//생년월일 마지막 유효성 ㄱ머사임

function validateBirthdate() {
    var birthdate = document.querySelector('input[name="birth"]').value;
    var birthError = document.getElementById("birthError");
    var birthdateError = document.getElementById("birthdateError");

    var today = new Date();
    var birthDate = new Date(birthdate);
    var age = today.getFullYear() - birthDate.getFullYear();
    var month = today.getMonth() - birthDate.getMonth();
    
    if (month < 0 || (month === 0 && today.getDate() < birthDate.getDate())) {
        age--;
    }

    if (age < 19) {
        birthError.style.display = "block";
        birthdateError.style.display = "none";
    } else {
        birthError.style.display = "none";
        birthdateError.style.display = "block";
    }
}

//실시간 체크
fnameInput.oninput = () => blockName(fnameInput, fnameError);
lnameInput.oninput = () => blockName(lnameInput, lnameError);
email1Input.oninput = () => blockEmail1(email1Input);
email2Input.oninput = () => checkEmailMatch();
pwdInput.oninput = () => {
    blockPwd(pwdInput);
    checkPwdMatch(); // <- 여기 추가해서 즉시 확인
};
confirmPwdInput.oninput = () => checkPwdMatch();
telInput.oninput = () => blockTel(telInput);
birthInput.oninput = () => {
    setMaxBirthDate(); // <- 입력 즉시 갱신
    isAdult(birthInput); // <- 나이 확인 즉시
};

// form 제출 시
form.onsubmit = function(event) {
    let valid = true; // <-- 제일 위로 이동!

    if (!checkPwdMatch()) valid = false;
    if (!checkEmailMatch()) valid = false;
    if (!blockTel(telInput)) valid = false;
    if (!isAdult(birthInput)) valid = false;

    if (!valid) event.preventDefault();
};

function validateForm() {
    let valid = true; // 폼이 유효한지 확인

    // 각 입력에 대한 유효성 검사
    if (!checkPwdMatch()) valid = false;
    if (!checkEmailMatch()) valid = false;
    if (!blockTel(telInput)) valid = false;
    if (!isAdult(birthInput)) valid = false; // 나이 확인도 추가

    // 유효성 검사에서 실패한 경우, 폼 제출을 막음
    if (!valid) {
        event.preventDefault(); // 폼 제출 막기
    }
    return valid; // 유효성 검사 결과 반환
}
</script>
<script src="validation.js"></script>
<script src="togglePassword.js"></script>

 
    
</head>
<body>
    <%@ include file="/header.jsp" %>
    <br>
    <h1 style="color:#56340c;">신라리워즈 가입</h1>  
	<div class="step-wrapper">
    <div class="step-container">
        <div class="step">약관동의</div>
        <div class="step active">회원정보 입력</div>
        <div class="step">가입완료</div>
    </div>
</div>
<br><br>
    
    <form name="memberJoin" action="memberJoin_ok.jsp" method="post" onsubmit="return validateForm()">
        <h2>회원가입</h2>
        <hr>
 
	<label>성</label>
	<input type="text" name="fname" placeholder="First Name" required
    	   value="${requestScope.fname != null ? requestScope.fname : ''}" oninput="blockName(this, 'fnameError')">
	<div id="fnameError" style="display:none; color:red;">이름을 제대로 입력해주세요.</div>
	<% if (request.getAttribute("fnameError") != null) { %>
    <div style="color:red;"><%= request.getAttribute("fnameError") %></div>
		<% } %>
		
		

	<label>이름</label>
	<input type="text" name="lname" placeholder="Last Name" required
           value="${requestScope.lname != null ? requestScope.lname : ''}" oninput="blockName(this, 'lnameError')">
    <div id="lnameError" style="display:none; color:red;">이름을 제대로 입력해주세요.</div>
	<% if (request.getAttribute("lnameError") != null) { %>
    <div style="color:red;"><%= request.getAttribute("lnameError") %></div>
		<% } %>
		
    <label>생년월일</label>
    <input type="date" name="birth" required value="${requestScope.birth != null ? requestScope.birth : ''}">
    <div id="birthError" style="display:none; color:red;">19세 미만은 가입할 수 없습니다.</div>

    <label>아이디</label>
    <input class="idCheck" type="text" name="id" placeholder="아이디" readonly required
           value="${requestScope.id != null ? requestScope.id : ''}">
    <input type="button" value="중복검사" onclick="openIdCheck();">


	<label>비밀번호</label>
   	<div class="password-wrapper">
	<input type="password" name="pwd" id="pwd" placeholder="비밀번호" required oninput="validatePwd()"
        value="${requestScope.pwd != null ? requestScope.pwd : ''}">
    <span class="toggle-password" onclick="togglePwd('pwd')">👁️‍🗨️</span>
	<!-- JS 전용 에러 -->
	
	<!-- 서버 전용 에러 -->
	<% if (request.getAttribute("pwdError") != null) { %>
  	<div style="color:red;" class="server-error"><%= request.getAttribute("pwdError") %></div>
	<% } %>
	</div>
		
    <label>비밀번호 확인</label>
    <div class="password-wrapper">
    <input type="password" name="pwdcheck" id="pwdcheck" placeholder="비밀번호 확인" required oninput="validatePwd()"
          value="${requestScope.pwdcheck != null ? requestScope.pwdcheck : ''}">
    <span class="toggle-password" onclick="togglePwd('pwdcheck')">👁️‍🗨️</span>
    <div id="pwdError" style="display:none; color:red;">비밀번호를 정확하게 입력해주세요.</div>
    <div id="confirmPwdError" style="display:none; color:red;">비밀번호가 일치하지 않습니다.</div>
    </div>


    <label for="email1">E-mail</label>
    <div class="email-group">
     <input type="text" name="email1" id="email1" placeholder="E-mail" required oninput="blockEmail1(this)"
           value="${requestScope.email1 != null ? requestScope.email1 : ''}"> @
    
         <small id="emailError1" class="error-msg" style="display:none;">이메일 앞부분에는 한글이나 특수문자를 사용할 수 없습니다.</small>
     	   <% if (request.getAttribute("email1Error") != null) { %>
        <div style="color:red;"><%= request.getAttribute("email1Error") %></div>
    		<% } %>
     <input type="text" name="email2" id="email2" placeholder="Domain" required oninput="blockEmail2(this)"
               value="${requestScope.email2 != null ? requestScope.email2 : ''}">
        <select id="emailSel" onchange="emailChange()">
            <option value="type">직접입력</option>
            <option value="naver.com">naver.com</option>
            <option value="google.com">google.com</option>
            <option value="nate.com">nate.com</option>
            <option value="daum.net">daum.net</option>
        </select>
       <div id="emailError2" class="error-msg" style="display:none;">이메일 앞부분에는 한글이나 특수문자를 사용할 수 없습니다.</div>
         <% if (request.getAttribute("email2Error") != null) { %>
        <div style="color:red;"><%= request.getAttribute("email2Error") %></div>
    	<% } %>
    	</div>

	<label>전화번호 (000 - 0000 - 0000)</label>
	<input type="text" name="tel" placeholder="전화번호" required oninput="blockTel(this)"
           value="${requestScope.tel != null ? requestScope.tel : ''}">
	<!-- 클라이언트 전용 오류 메시지 -->
	<div id="telError" style="display:none; color:red;">숫자와 하이픈(-)만 입력 가능합니다.</div>
	<!-- 서버 전용 오류 메시지 -->
	<% if (request.getAttribute("telError") != null) { %>
    <div style="color:red;" class="server-error"><%= request.getAttribute("telError") %></div>
		<% } %>

	<label>주소</label>
	<input type="text" name="addr" placeholder="주소" required oninput="blockAddr(this)"
       value="${requestScope.addr != null ? requestScope.addr : ''}">
	<!-- js 실시간-->
	<small id="addrError" class="error-msg" style="display:none;">
    주소에는 특수문자 (- _ . ( ) [ ]) 외에는 사용할 수 없습니다.
	</small>
	
	<!-- 서버 -->
	<% if (request.getAttribute("addrError") != null) { %>
  	<div class="server-error" style="color:red;"><%= request.getAttribute("addrError") %></div>
		<% } %>
	
    <label>질문</label>
    <select name="question" required>
        <option value="1" ${requestScope.question == '1' ? 'selected' : ''}>질문 1: 보물 1호는?</option>
        <option value="2" ${requestScope.question == '2' ? 'selected' : ''}>질문 2: 내가 다닌 초등학교 이름은?</option>
        <option value="3" ${requestScope.question == '3' ? 'selected' : ''}>질문 3: 짝사랑했던 이성친구 이름은?</option>
        <option value="4" ${requestScope.question == '4' ? 'selected' : ''}>질문 4: 어렸을 적 별명은?</option>
        <option value="5" ${requestScope.question == '5' ? 'selected' : ''}>질문 5: 내가 살던 고향은?</option>
    </select>


	<label>답변</label>
	<input type="text" name="answer" placeholder="답변" required oninput="blockAnswer(this)"
           value="${requestScope.answer != null ? requestScope.answer : ''}">
	<div id="answerError" class="error-msg" style="display:none; color:red;">답변은 특수문자를 사용할 수 없습니다.</div>
	<% if (request.getAttribute("answerError") != null) { %>
    <div style="color:red;" class="server-error"><%= request.getAttribute("answerError") %></div>
	<% } %>

    <input type="submit" value="가입신청">
    <input type="reset" value="다시작성">

    <p>
        <a href="login.jsp">로그인</a> |
        <a href="idFind.jsp">아이디 찾기</a> |
        <a href="pwdFind.jsp">비밀번호 찾기</a>
    </p>
</form>