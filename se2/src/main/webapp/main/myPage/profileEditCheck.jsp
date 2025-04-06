<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class = "com.hotel.mypage.PwchangeDAO"></jsp:useBean>
<%
String id = "asd123";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .container {
          display: flex;
        }
        
        .box2 {
          padding: 20px;
          border: 1px solid #ccc;
          width: 800px; 
          background-color: white;
        }
      </style>
</head>
<body>
  <%@include file="/header.jsp" %>
    <div class="container">
      <%@include file="sideBar.jsp" %>
      <section class="box2">
      <form name = "profileEditCheck" action = "profileEditCheck_ok.jsp">
          <h1>비밀번호 확인</h1>
          <hr>
          <fieldset>
            <label>회원ID :</label>
            <%=id %>
            <!-- session에 저장된id 가져올 예정-->
            <br>
            <br>
            <label>비밀번호 :</label>
            <input type = "text" name = "pwd">
            <br>
            <br>
            <input type = "submit" value ="확인">
            <input type = "button" value = "취소">
          </fieldset>
      </form>
      </section>
    </div>
  </body>
  <%@include file="/footer.jsp" %>
</html>