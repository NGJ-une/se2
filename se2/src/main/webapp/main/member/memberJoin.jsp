<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; text-align: center; padding: 30px; }
        
        form { 
    
            width: 650px; 
            padding: 20px; 
            margin: 0 auto; 
            border-radius: 8px; 
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); 
        }
        
        h2 { margin-bottom: 20px; font-size: 24px; }
        
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
        
        .email-group { 
            display: flex; 
            justify-content: space-between; 
        }
        
        .email-group input { width: 48%; }
        
        hr { border: none; border-top: 1px solid #eee; margin: 15px 0; }
    </style>

    <script>
        // 아이디 중복체크
        function openIdCheck() {
            window.open('idCheck.jsp','idCheck','width=500,height=250');
        }

        // 비밀번호 확인
        function pwdCheck() {
            let pwd = document.memberJoin.pwd.value;
            let pwdcheck = document.memberJoin.pwdcheck.value;

            if (pwd !== pwdcheck) {
                alert("비밀번호가 일치하지 않습니다.");
                document.memberJoin.pwd.focus();
                return false;
            }
            return true;
        }
    </script>    
    
</head>
<body>
    <%@ include file="/header2.jsp" %>
    <form name="memberJoin" action="memberJoin_ok.jsp" method="post" onsubmit="return pwdCheck();">
        <h2>회원가입</h2>
        <hr>

        <label>이름</label>
        <input type="text" name="fname" placeholder="First Name" required>
        <input type="text" name="lname" placeholder="Last Name" required>

        <label>생년월일</label>
        <input type="date" name="birth" required>

        <label>아이디</label>
        <input type="text" name="id" placeholder="아이디" readonly required>
        <input type="button" value="중복검사" onclick="openIdCheck();">

        <label>비밀번호</label>
        <input type="password" name="pwd" placeholder="비밀번호" required>

        <label>비밀번호 확인</label>
        <input type="password" name="pwdcheck" placeholder="비밀번호 확인" required>
        
        <label>E-mail</label>
        <div class="email-group">
            <input type="text" name="email1" placeholder="E-mail" required> @ 
            <input type="text" name="email2" placeholder="Domain" required>
        </div>

        <label>전화번호</label>
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
        	 <a href="login.jsp">  로그인  </a>	|	
             <a href="idFind.jsp"> 아이디 찾기</a> |
             <a href="pwdFind.jsp">	비밀번호 찾기	</a>
                </p>
    </form>
    <%@ include file="/footer2.jsp" %>
</body>
</html>