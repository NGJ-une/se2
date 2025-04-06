<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class = "com.hotel.mypage.PwchangeDAO"></jsp:useBean>
<%
String sid = (String)session.getAttribute("sessionid");
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
        .box1 {
          padding: 20px;
          margin-right: 5px;
          border: 2px solid black;
          width: 200px;
          background-color: whitesmoke;
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
    <div class="container">
      <section class="box1">
          <label>마이페이지</label>
          <hr>
          <br>
          <div>충전하기</div>
          <br>
          <div>프로필 수정</div>
          <br>
          <div>비밀번호 변경</div>
          <br>
          <div>문의내역</div>
          <br>
          <div>회원탈퇴</div>
      </section>
      <section class="box2">
      <form name = "profileEditCheck" action = "profileEditCheck_ok.jsp">
          <h1>비밀번호 확인</h1>
          <hr>
          <fieldset>
            <label>회원ID :</label>
            <%=sid %>
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
</html>