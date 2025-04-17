<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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

	h2 {
	margin-bottom: 20px; font-size: 24px;  color: #6b4c2f;
	}
    
    form {
    	width:500px;
    	text-align: center;
    	margin: 100px auto;  
    }
    
    input,select {
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
    
   	 a:hover {
    		color: #6b4c2f; 
    		text-decoration: underline; /* 호버 시 밑줄을 추가 */
	} 
    
    input[type="submit"] {
         border: none;
         cursor: pointer;
	}

    input[type="submit"]:hover {
    	background-color: #E4D9C7;
    }    
   
   .idFindErrorMsg {
   		color: red;
	    font-size: 14px;
	    margin-top: 10px;
   }
    

    
  </style>
</head>
<body>
<%@include file="/header.jsp" %>
    <section class="container"> 
            	<form name="idFind" action="idFind_ok.jsp" method="post">
               	 <h2>아이디찾기</h2>
               	 <hr>
                   	 <input type="text" name="tel" placeholder="전화번호 (000 - 0000 - 0000)">

            
                     <select name="question"  required > 
							<option value="1">  질문 1 : 보물 1호는? </option>
                            <option value="2">  질문 2 : 내가 다닌 초등학교 이름은? </option>
                            <option value="3">  질문 3 : 짝사랑했던 이성친구 이름은? </option>
                            <option value="4">  질문 4 : 어렸을 적 별명은?  </option>
                            <option value="5">  질문 5 : 내가 살던 고향은? </option>
                     </select>   
                     <input type="text" name="answer" placeholder="답변" required>
               	 	 <input type="submit" value="아이디찾기">
               	 	 		<%
		    String errorMsg = (String) session.getAttribute("errorMsg");
		    if (errorMsg != null) {
		%>
		    <p class = "idFindErrorMsg"><%= errorMsg %></p>
		<%
		        session.removeAttribute("errorMsg");
		    }
		%>
               	<p> 
               		 <a href="pwdFind.jsp"> 비밀번호 찾기</a> |
                	<a href="login.jsp">로그인</a>	|
                	<a href="memberJoin.jsp">	회원가입	</a>
                </p>
            	</form>
  		  </section>     
  <%@include file="/footer.jsp" %>
</body>
</html>