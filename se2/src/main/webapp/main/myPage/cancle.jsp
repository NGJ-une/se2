<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.hotel.mypage.*" %>
<jsp:useBean id="mdao" class = "com.hotel.mypage.DepositDAO"></jsp:useBean>
<%
String id = (String)session.getAttribute("sessionid");
ArrayList<DepositDTO> arr = mdao.mypageMemberInfo(id);
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
      <form name = "cancleCheck" action = "cancleCheck_ok.jsp">
          <h1>회원탈퇴</h1>
            <hr>
            <fieldset><%=arr.get(0).getMfname() %><%=arr.get(0).getMlname() %> 님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 더 확인합니다.</fieldset>
            <br>
          <label>회원 번호 : </label>
          <%=arr.get(0).getMidx()%>
          <br>
          <br>
          <label>비밀 번호 :</label>
          <input type = "text" name = "pwd">
          <br>
          <br>
          <input type="submit" value="탈퇴">
          <input type="button" value="취소">
      </form>
      </section>
    </div>
  </body>
  <%@include file="/footer.jsp" %>
</html>