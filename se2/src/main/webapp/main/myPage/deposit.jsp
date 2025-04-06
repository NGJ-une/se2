<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class = "com.hotel.mypage.DepositDAO"></jsp:useBean>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>가로로 두 공간 만들기</title>
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
    a {
    	text-decoration: none;
    	color : black;
    }
  </style>
</head>
<body>
  <%@include file="/header.jsp" %>
  <div class="container">
    <%@include file="sideBar.jsp" %>
    <section class="box2">
    <form name ="deposit" action = "deposit_ok.jsp">
        <h1>충전하기</h1>

        <%
        String id = (String)session.getAttribute("sessionid");
        int money = mdao.importAmount(sid);
        %>
        <label>현재 금액 : <%=money %></label>

        <br>
        <br>
        <label>충전할 금액 : </label>
        <input type="text" name = "money">
        <br>
        <input type="submit" value="충전">
        <input type="reset" value="취소">
    </form>
    </section>
  </div>
  <%@include file="/footer.jsp" %>
</body>
</html>

