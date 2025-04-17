<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        text-align: center;
        margin: 0 auto;
        padding: 0;
    }

    .container {
        display: flex;
        width: 1200px;
        margin: 0 auto;
    }

    form {
        width: 500px;
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

    input[type="submit"] {
        border: none;
        cursor: pointer;
    }
    
    input[type="submit"]:hover {
    	background-color: #E4D9C7;
    }

    hr {
        width: 100%;
        border: none;
        border-top: 2px solid #eee;
        margin: 10px 0 20px;
    }

    .checkbox-container {
    width: 100%;
    margin-top: 10px;
    display: flex;
    align-items: center;
    justify-content: flex-start; 
    padding-left: 2px; 
}

	input[type="checkbox"] {
    width: auto;  
    margin: 0 8px 0 0;
}

    label {
        display: inline;
        font-size: 14px;
        color: #333;
    }

    p {
        margin-top: 20px;
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
	    
    h2 {
    color: #6b4c2f;
    }
     
    .loginfailMsg {
    	color: red;
	    font-size: 14px;
	    margin-top: 10px;
     }
</style>
</head>

<%
String saveid = ""; 
Cookie cks[] = request.getCookies();
if (cks != null) {
    for (int i = 0; i < cks.length; i++) {
        if (cks[i].getName().equals("saveid")) {
            saveid = cks[i].getValue();
        }
    }
}
%>

<body>
<%@include file="/header.jsp" %>
<section class="container">
    <form name="login" action="login_ok.jsp" method="post">
        <h2>로그인</h2>
        <hr>
        
          <h3 style="color: #825517" >HELIA호텔에 오신 것을 환영합니다.</h3>
         <div style="color: #825517">신라리워즈 번호와 비밀번호를 입력해주시기 바랍니다.</div>
       <p style="white-space: nowrap; width: 100%; text-align: center; font-size: 15px;">
    ※ HELIA회원이 되시면 회원만을 위한 다양한 서비스와 혜택을 받으실 수 있습니다.
</p>
        
        <br>
        <hr>
        <br>
        <input type="text" name="userid" placeholder="아이디" value="<%=saveid%>">
        <br>
        <input type="password" name="userpwd" placeholder="비밀번호">
        <br>


        <div class="checkbox-container">
            <label>
                <input type="checkbox" name="saveid" value="on" <%= saveid.equals("") ? "" : "checked" %>>
                아이디 저장
            </label>
        </div>

        <input type="submit" value="  로그인  ">
        
		<%
		    String errorMsg = (String) session.getAttribute("errorMsg");
		    if (errorMsg != null) {
		%>
		    <p class = "loginfailMsg"><%= errorMsg %></p>
		<%
		        session.removeAttribute("errorMsg");
		    }
		%>
        <p>
            <a href="idFind.jsp"> 아이디 찾기 </a> |
            <a href="pwdFind.jsp"> 비밀번호 찾기 </a> |
            <a href="memberJoin.jsp"> 회원가입 </a>
        </p>
    </form>
</section>
</body>
<%@include file="/footer.jsp" %>
</html>