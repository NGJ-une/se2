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
      width:1500px;
      margin:0 auto;
    }

    .box2 {
      padding: 20px;
      border: 1px solid #ccc;
      width: 1200px; 
      background-color: white;
    }
  </style>
</head>
<body>
<%@include file = "/header.jsp" %>
  <div class="container">
  <%@include file="sideBar.jsp" %>
    <section class="box2">
    <form name ="refund" action = "refund_ok.jsp">
        <h1>환불하기</h1>

        <%
        String id = (String)session.getAttribute("sessionid");
        int money = mdao.importAmount(id);
        %>
        <label>현재 금액 : <%=money %></label>

        <br>
        <br>
        <label>환불할 금액 : </label>
        <input type="text" name = "mmoney" required="required">
        <br>
        <label>환불 받을 은행 :</label>
        <select name = "bbank">
        <option value = "0">은행 선택</option>
        <option value = "1">농협</option>
        <option value = "2">국민</option>
        <option value = "3">신한</option>
        <option value = "4">카카오</option>
        </select>
        <br>
         <label>계좌 번호 : </label>
         <input type = "text" name = "bacount" required="required">
        <br>
        <br>
        <input type="submit" value="환불">
        <input type="reset" value="취소">
    </form>
    </section>
  </div>
<%@include file = "/footer.jsp" %>
</body>
</html>

