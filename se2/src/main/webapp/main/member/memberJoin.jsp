<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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

        /** 비밀번호 입력 확인하는 코드 */
        function togglePwd(id) {
            const input = document.getElementById(id);
            if (input.type === "password") {
                input.type = "text";  // 비밀번호를 텍스트로 변경
            } else {
                input.type = "password";  // 비밀번호를 다시 숨김
            }
        }
        
        
        
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
        <input type="text" name="fname" placeholder="First Name" required>
        <input type="text" name="lname" placeholder="Last Name" required>

        <label>생년월일</label>
        <input type="date" name="birth" required>

        <label>아이디</label>
        <input class="idCheck" type="text" name="id" placeholder="아이디" readonly required>
        <input type="button" value="중복검사" onclick="openIdCheck();">

        <label>비밀번호</label>
        <div class="password-wrapper">
            <input type="password" name="pwd" id="pwd" placeholder="비밀번호" required>
            <span class="toggle-password" onclick="togglePwd('pwd')">👁️‍🗨️</span>
        </div>

        <label>비밀번호 확인</label>
        <div class="password-wrapper">
            <input type="password" name="pwdcheck" id="pwdcheck" placeholder="비밀번호 확인" required>
            <span class="toggle-password" onclick="togglePwd('pwdcheck')">👁️‍🗨️</span>
        </div>
        <p id="pwdErrorMsg" class = "pwdMissMatch"></p>
        
        <label>E-mail</label>
        <div class="email-group">
            <input type="text" name="email1" placeholder="E-mail" required> @ 
            <input type="text" name="email2" placeholder="Domain" required>
        </div>

        <label>전화번호 (000 - 0000 - 0000)</label>
        <input type="text" name="tel" placeholder="전화번호" required>

        <label>주소</label>
        <input type="text" name="addr" placeholder="주소" required>

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
             <a href="login.jsp"> 로그인 </a> |  
             <a href="idFind.jsp"> 아이디 찾기 </a> |
             <a href="pwdFind.jsp"> 비밀번호 찾기 </a>
        </p>
    </form>
    <%@ include file="/footer.jsp" %>
</body>
</html>
