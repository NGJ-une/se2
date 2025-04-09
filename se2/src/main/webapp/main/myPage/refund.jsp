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
		font-family: 'Noto sans KR', sans-serif;
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
      box-shadow: 0 4px 10px rgba(0,0,0,0.08);
      font-size: 16px;
    }
    h1{
    font-size: 28px;
    color: #333;
    margin-bottom: 30px;
    border-bottom: 3px solid #eee;
    }
    .currentMoney {
    	font-size: 18px;
    	margin-bottom: 25px;
    	color: #007BFF;
    	font-weight: bold;
    }
    label {
    	display: block;
    	margin-bottom: 10px;
    	font-size: 16px;
    	color: #555;
    }
    input[type="number"] {
    	width: 300px;
    	padding: 12px;
    	font-size: 16px;
    	border: 1px solid #ccc;
    	border-radius: 8px;
    	margin-bottom: 20px;
    }
  </style>
</head>
<body>
<%@include file = "/header2.jsp" %>
  <div class="container">
  <%@include file="sideBar.jsp" %>
    <section class="box2">
    <form name ="refund" action = "refund_ok.jsp">
        <h1>환불하기</h1>

        <%
        String id = (String)session.getAttribute("sessionid");
        int money = mdao.importAmount(id);
        %>
        <label class = "currentMoney">현재 보유 금액 : <%=money %></label>

        <br>
        <br>
        <label>환불할 금액  </label>
        <input type="number" name = "mmoney" required="required">
        <br>
        <label>환불 받을 은행 </label>
        <select name = "bbank">
        <option value = "0">은행 선택</option>
        <option value = "1">농협</option>
        <option value = "2">국민</option>
        <option value = "3">신한</option>
        <option value = "4">카카오</option>
        </select>
        <br>
         <label>계좌 번호 : </label>
         <input type = "number" name = "bacount" required="required">
        <br>
        <br>
        <input type="submit" value="환불">
        <input type="reset" value="취소">
    </form>
    </section>
  </div>
<%@include file = "/footer2.jsp" %>
</body>
</html>

