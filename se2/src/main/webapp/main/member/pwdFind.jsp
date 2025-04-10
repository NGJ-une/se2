<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
 <style>
 
    * {
	   	margin: 0;
	    padding: 0;
	    box-sizing: border-box; /* 패딩과 테두리를 크기 계산에 포함 */
	}
	body {
	    text-align: center; /* 화면 중앙 배치 효과 */
	    margin:0 auto;
	    padding:0;
	}
    .container {
        display: flex;
        width:1200px;
        margin:0 auto;
    }

    
    form {
    	width:500px;
    	text-align: center;
    	margin: 100px auto;  
    }
    
    input {
         width: 100%;
         padding: 10px;
         margin: 10px 0;
         font-size: 14px;
         box-sizing: border-box;
         border: 1px solid #ccc;
    }
    
    hr {
         width: 100%;
         border: none;
         border-top: 2px solid #eee;
         margin: 10px 0 20px;
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
       


  </style>
</head>
<body>
<%@include file="/header.jsp" %>
    <div class="container">
             <form name="pwdFind" action="pwdFind_ok.jsp" method="post">
                <h2>비밀번호 찾기</h2>
                <hr>
               <input type="text" name="id" placeholder="아이디" required>
                <input type="text" name="tel" placeholder="전화번호" required>
                <input type="submit" value="비밀번호 찾기">
               
               <p> 
                <a href="idFind.jsp"> 아이디 찾기</a> |
                <a href="login.jsp">로그인</a>	|
                <a href="memberJoin.jsp">	회원가입	</a>
                </p>
            </form> 
    </div>  
 <%@include file="/footer.jsp" %>
</body>
</html>