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
    * {
	   margin: 0;
	   padding: 0;
	   box-sizing: border-box; /* 패딩과 테두리를 크기 계산에 포함 */
	}
	
	body {
	    text-align: center; /* 화면 중앙 배치 효과 */
	    margin:0 auto;
	    padding:0;
		/*background: #e8e8e8;*/
	}
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
  <%@include file="/footer.jsp" %>
</html>