<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class = "com.hotel.mypage.PwchangeDAO"></jsp:useBean>
<%
String id = (String)session.getAttribute("sessionid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HELIA HOTEL : 프로필 수정</title>
  
  <style>
  * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Noto Sans KR', sans-serif;
      background-color: #f0f2f5;
    }

    .container {
      display: flex;
      width: 1200px;
      margin: 50px auto;
      gap: 20px;
    }

    .box2 {
      flex: 2;
      padding: 40px;
      border-radius: 12px;
      background-color: #ffffff;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
      font-size: 16px;
    }

    h1 {
      font-size: 28px;
      color: #333;
      margin-bottom: 30px;
      border-bottom: 3px solid #eee;
      padding-bottom: 10px;
    }

    label {
      display: block;
      margin-bottom: 10px;
      font-size: 16px;
      color: #555;
    }

    .user-id {
      margin-bottom: 20px;
      font-weight: bold;
      color: #b58143;
    }

    input[type="password"] {
      width: 300px;
      padding: 12px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 8px;
      margin-bottom: 20px;
    }

    input[type="submit"],
    input[type="button"] {
      padding: 12px 24px;
      font-size: 16px;
      margin-right: 10px;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: 0.3s ease;
    }

    input[type="submit"] {
      background-color: #b58143;
      color: white;
  		
}
    }

    input[type="submit"]:hover {
      background-color: #d89e5e;
    }

    input[type="button"] {
      background-color: #ddd;
      color: #333;
    }

    input[type="button"]:hover {
      background-color: #bbb;
    }
    
    .pwdErrorMsg {
        color: red;
	    font-size: 14px;
	    margin-top: 10px;
    }
    
</style>
</head>
<body>
  <%@include file="/header.jsp" %> 
    <div class="container">
      <%@include file="sideBar.jsp" %>
      <section class="box2">
      <form name="profileEditCheck" action="profileEditCheck_ok.jsp">
        <h1> 프로필 수정 </h1>

        <label class="user-id">회원 ID: <%= sid %></label>

        <label for="pwd">비밀번호</label>
        <input type="password" id="pwd" name="pwd" required>

		<%
		    String errorMsg = (String) session.getAttribute("errorMsg");
		    if (errorMsg != null) {
		%>
		    <p class = "pwdErrorMsg"><%= errorMsg %></p>
		<%
		        session.removeAttribute("errorMsg");
		    }
		%>
        <br>
        <input type="submit" value="확인">
        <input type="button" value="취소" onclick="history.back()">
      </form>
      </section>
    </div>
  </body>
  <%@include file="/footer.jsp" %>
</html>