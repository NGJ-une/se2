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

		input[type="reset"]:hover {
    		background-color: #f0b675;
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
    		background-color: #f0b675;
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
    		background-color: #f0b675;
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
		}
    	
    	
   </style>

    <script>
        // 아이디 중복체크
        function openIdCheck() {
           // window.open('idCheck.jsp','idCheck','width=500,height=250');
         	var popupWidth = 600;
			var popupHeight = 300;
			var popupX = Math.ceil(( window.screen.width - popupWidth )/2);
			var popupY = Math.ceil(( window.screen.height - popupHeight )/2); 

			window.open('idCheck.jsp','idCheck', 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY)
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

        
        /** !! 비밀번호 입력 확인하는 코드 !!! */
        function togglePwd(id, icon) {
    		const input = document.getElementById(id);
   				if (input.type === "password") {
        			input.type = "text";
       				 icon.textContent = "🙈"; // 눈 감은 아이콘
    			} else {
        			input.type = "password";
        			icon.textContent = "👁️"; // 눈 아이콘
    }
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
        <input class="idCheck" type="text" name="id" placeholder="아이디" readonly required>
        <input type="button" value="중복검사" onclick="openIdCheck();">

        <label>비밀번호</label>
        <input type="password" name="pwd" placeholder="비밀번호" required>
        <span class="toggle-password" onclick="togglePwd('pwd', this)">👁️</span>

        <label>비밀번호 확인</label>
        <input type="password" name="pwdcheck" placeholder="비밀번호 확인" required>
        <span class="toggle-password" onclick="togglePwd('pwdcheck', this)">👁️</span>
        
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
        	 <a href="login.jsp">  로그인  </a>	|	
             <a href="idFind.jsp"> 아이디 찾기  </a> |
             <a href="pwdFind.jsp">	비밀번호 찾기	</a>
        </p>
    </form>
    <%@ include file="/footer2.jsp" %>
</body>
</html>