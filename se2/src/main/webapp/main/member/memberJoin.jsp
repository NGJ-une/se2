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
            box-sizing: border-box; /* 패딩과 테두리를 크기 계산에 포함 */
        }
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; text-align: center; }
        
        form { 
            width: 650px; 
            padding: 20px; 
            margin: 0 auto; 
            border-radius: 8px; 
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); 
        }
        
        h2 { margin-bottom: 20px; font-size: 24px;  color: #6b4c2f;}
        
        label { display: block; margin-bottom: 5px; text-align: left; font-size: 14px; color: #333; }
        
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
        
        .email-group input { width: 48%; }
        
        hr {
            width: 100%;
            border: none;
            border-top: 2px solid #eeeeeec0;
            margin: 10px 0 20px;
        }

        .idCheck {
            width: 500px; /* 원하는 너비 */
            padding: 10px; 
            margin-bottom: 15px; 
            font-size: 14px; 
            border: 1px solid #ccc; 
            border-radius: 4px; 
        }

        input[type="button"]{ 
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
    		color: #f0b675; /* 호버 시 색상을 변경 */
    		text-decoration: underline; /* 호버 시 밑줄을 추가 */
}

		
        /** 비밀번호 눈 확인 */
        .password-wrapper {
            position: relative;
            width: 100%;
        }

        .password-wrapper input {
            width: 100%;
            padding-right: 40px; /* 아이콘 공간 확보 */
        }

        .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 18px;
            padding-bottom : 15px;
        }
        
        .pwdMissMatch {
	        color: red;
		    font-size: 14px;
		    margin-top: 10px;
        }
        
     
     /** 약관동의 / 회원정보 입력 / 가입완료 */   
        
     .step-wrapper {
        display: flex;
        justify-content: center; /* wrapper 안에서 가운데 정렬 */
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
        

.error-msg {
    color: red;
    font-size: 12px;
    display: none; /* 기본적으로 숨김 */
    margin-top: 5px;
}

.invalid {
    border: 1px solid red;
}

/* 빨간색 테두리 추가 */
input:invalid {
    border: 1px solid black;
}

/* 오류 메시지가 보일 때 */
input.invalid + .error-msg {
    display: inline-block; 
}
        
    </style>

    <script>
    // 아이디 중복체크
    function openIdCheck() {
        var popupWidth = 600;
        var popupHeight = 300;
        var popupX = Math.ceil(( window.screen.width - popupWidth ) / 2);
        var popupY = Math.ceil(( window.screen.height - popupHeight ) / 2); 

        window.open('idCheck.jsp', 'idCheck', 'width=' + popupWidth + ',height=' + popupHeight + ',left=' + popupX + ',top=' + popupY)
    }

    // 비밀번호 확인
    function pwdCheck() {
        let pwd = document.memberJoin.pwd.value;
        let pwdcheck = document.memberJoin.pwdcheck.value;
        var errorMsg = document.getElementById("pwdErrorMsg");

        if (pwd !== pwdcheck) {
            errorMsg.textContent = "비밀번호가 일치하지 않습니다.";
            document.memberJoin.pwd.focus();
            return false;
        }
        errorMsg.textContent = "";
        return true;
    }

    // 비밀번호 입력 확인하는 코드
    function togglePwd(id) {
        const input = document.getElementById(id);
        if (input.type === "password") {
            input.type = "text";  // 비밀번호를 텍스트로 변경
        } else {
            input.type = "password";  // 비밀번호를 다시 숨김
        }
    }
    
    function emailChange() {
        var setlmail = document.getElementById("email2");
        var getemail = document.getElementById("emailSel").value;
        if (getemail != "type") {
            setlmail.value = getemail;
        } else {
            setlmail.value = ""; 
        }
    }
    
    // 19세 미만 가입 불가
    document.addEventListener("DOMContentLoaded", function () {
        const birthInput = document.querySelector('input[name="birth"]');
        const errorMsg = document.getElementById("birthError");
        const today = new Date();
        const adultYear = today.getFullYear() - 19;
        const maxDate = new Date(adultYear, 11, 31); // 12월 31일

        const yyyy = maxDate.getFullYear();
        const mm = String(maxDate.getMonth() + 1).padStart(2, '0');
        const dd = String(maxDate.getDate()).padStart(2, '0');

        // 최대 날짜 제한
        birthInput.max = `${yyyy}-${mm}-${dd}`;

        // 가입 폼 전송 전에 19세 미만 체크
        document.forms['memberJoin'].onsubmit = function(event) {
            const birthDate = new Date(birthInput.value);

            if (birthDate > maxDate) {
                errorMsg.style.display = "inline";  
                event.preventDefault(); 
                return false;
            } else {
                errorMsg.style.display = "none";  
            }
        };
    });

    // 이름 숫자 포함 시
    function blockName(input) {
        const regex = /[0-9]/g;
        const error = document.getElementById("nameError");

        if (regex.test(input.value)) {
            error.style.display = "block";
            input.classList.add("invalid");
        } else {
            error.style.display = "none";
            input.classList.remove("invalid");
        }
    }

    // 전화번호 유효성: 숫자, 하이픈만 허용
    function blockTel(input) {
        const error = document.getElementById("telError");
        input.value = input.value.replace(/[^0-9\-]/g, "");

        if (/[^0-9\-]/.test(input.value)) {
            error.style.display = "block";
            input.classList.add("invalid");
        } else {
            error.style.display = "none";
            input.classList.remove("invalid");
        }
    }
    
    // 주소 유효성 검사: 특수문자 제외
    function blockAddr(input) {
        const error = document.getElementById("addrError");
        if (/[^가-힣a-zA-Z0-9\s\-]/.test(input.value)) {
            error.style.display = "block";
            input.classList.add("invalid");
        } else {
            error.style.display = "none";
            input.classList.remove("invalid");
        }
    }

    // 이메일 앞부분: 영문 숫자만
    function blockEmail1(input) {
        const error = document.getElementById("emailError1");
        if (/[^a-zA-Z0-9]/.test(input.value)) {
            error.style.display = "block";
            input.classList.add("invalid");
        } else {
            error.style.display = "none";
            input.classList.remove("invalid");
        }
    }

    // 이메일 도메인: 영문 + 점(.)만
    function blockEmail2(input) {
        const error = document.getElementById("emailError2");
        if (/[^a-zA-Z.]/.test(input.value)) {
            error.style.display = "block";
            input.classList.add("invalid");
        } else {
            error.style.display = "none";
            input.classList.remove("invalid");
        }
    }

    // 비밀번호: 영문, 숫자, !@#만 허용 / 한글 금지
    function blockPwd(input) {
        const error = document.getElementById("pwdError");
        if (/[ㄱ-ㅎ가-힣]/.test(input.value)) {
            error.style.display = "block";
            input.classList.add("invalid");
        } else {
            error.style.display = "none";
            input.classList.remove("invalid");
        }
    }

    // 전체 폼 유효성 검사
    document.forms['memberJoin'].onsubmit = function(event) {
        const fname = document.getElementsByName("fname")[0];
        const lname = document.getElementsByName("lname")[0];
        const pwd = document.getElementById("pwd");
        const pwdcheck = document.getElementById("pwdcheck");
        const tel = document.getElementById("tel");
        const addr = document.getElementById("addr");
        const email1 = document.getElementsByName("email1")[0];
        const email2 = document.getElementsByName("email2")[0];
        const emailSel = document.getElementById("emailSel");

        // 이름이 비어있거나 숫자를 포함한 경우
        if (fname.value.trim() === "" || lname.value.trim() === "") {
            alert("이름을 입력해주세요.");
            event.preventDefault();
            return false;
        }

        // 비밀번호 확인이 맞지 않을 경우
        if (!pwdCheck()) {
            event.preventDefault();
            return false;
        }

        // 전화번호와 주소 유효성 검사
        if (!tel.value || !addr.value) {
            alert("전화번호와 주소를 모두 입력해주세요.");
            event.preventDefault();
            return false;
        }

        // 이메일 유효성 검사
        if (!email1.value || !email2.value) {
            alert("이메일을 올바르게 입력해주세요.");
            event.preventDefault();
            return false;
        }

        return true;
    };
</script>

 
    
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
    
    <form name="memberJoin" action="memberJoin_ok.jsp" method="post" onsubmit="return pwdCheck();">
        <h2>회원가입</h2>
        <hr>




		<label>이름</label>
    	<input type="text" name="fname" placeholder="First Name" required oninput="blockName(this)">
		<small id="nameError" class="error-msg">이름에는 숫자를 입력할 수 없습니다.</small>

		<input type="text" name="lname" placeholder="Last Name" required oninput="blockName(this)">
		<small id="nameError" class="error-msg">이름에는 숫자를 입력할 수 없습니다.</small>



    <label>생년월일</label>
    <input type="date" name="birth" required>
    <small id="birthError" class="error-msg">19세 이상만 가입 가능합니다.</small>


    <label>아이디</label>
    <input class="idCheck" type="text" name="id" placeholder="아이디" readonly required>
    <input type="button" value="중복검사" onclick="openIdCheck();">

    <label>비밀번호</label>
    <div class="password-wrapper">
        <input type="password" name="pwd" id="pwd" placeholder="비밀번호" required oninput="blockPwd(this)">
        <span class="toggle-password" onclick="togglePwd('pwd')">👁️‍🗨️</span>
        <small id="pwdError" class="error-msg">비밀번호에 한글은 사용할 수 없습니다.</small>
    </div>

    <label>비밀번호 확인</label>
    <div class="password-wrapper">
        <input type="password" name="pwdcheck" id="pwdcheck" placeholder="비밀번호 확인" required oninput="blockPwd(this)">
        <span class="toggle-password" onclick="togglePwd('pwdcheck')">👁️‍🗨️</span>
        <small id="pwdError" class="error-msg">비밀번호에 한글은 사용할 수 없습니다.</small>
    </div>
    <p id="pwdErrorMsg" class="pwdMissMatch"></p>

   
    <label for="email1">E-mail</label>
    <div class="email-group">
        <input type="text" name="email1" id="email1" placeholder="E-mail" required oninput="blockEmail1(this)"> @
        <input type="text" name="email2" id="email2" placeholder="Domain" required oninput="blockEmail2(this)">
        <select id="emailSel" onchange="emailChange()">
            <option value="type">직접입력</option>
            <option value="naver.com">naver.com</option>
            <option value="google.com">google.com</option>
            <option value="nate.com">nate.com</option>
            <option value="daum.net">daum.net</option>
        </select>
    </div>
    <small id="emailError1" class="error-msg">이메일 앞부분에는 한글이나 특수문자를 사용할 수 없습니다.</small>
    <small id="emailError2" class="error-msg">도메인에는 한글이나 특수문자를 사용할 수 없습니다.</small>


    <label>전화번호 (000 - 0000 - 0000)</label>
    <input type="text" name="tel" placeholder="전화번호" required oninput="blockTel(this)">
    <small id="telError" class="error-msg">숫자와 하이픈(-)만 입력 가능합니다.</small>


    <label>주소</label>
    <input type="text" name="addr" placeholder="주소" required oninput="blockAddr(this)">
    <small id="addrError" class="error-msg">주소에는 특수문자를 사용할 수 없습니다.</small>


    <label>질문</label>
    <select name="question" required>
        <option value="1">질문 1: 보물 1호는?</option>
        <option value="2">질문 2: 내가 다닌 초등학교 이름은?</option>
        <option value="3">질문 3: 짝사랑했던 이성친구 이름은?</option>
        <option value="4">질문 4: 어렸을 적 별명은?</option>
        <option value="5">질문 5: 내가 살던 고향은?</option>
    </select>

    <label>답변</label>
    <input type="text" name="answer" placeholder="답변" required>

    <input type="submit" value="가입신청">
    <input type="reset" value="다시작성">

    <p>
        <a href="login.jsp">로그인</a> |
        <a href="idFind.jsp">아이디 찾기</a> |
        <a href="pwdFind.jsp">비밀번호 찾기</a>
    </p>
</form>

