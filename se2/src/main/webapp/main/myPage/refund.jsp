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
    a {
    	text-decoration: none;
    	color : black;
    }
  </style>
</head>
<body>
  <div class="container">
    <section class="box1">
        <a href = "myPage_main.jsp"><label>마이페이지</label></a>
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
    <form name ="deposit" action = "deposit_ok.jsp">
        <h1>환불하기</h1>

        <%
        String sid = (String)session.getAttribute("sessionid");
        int money = mdao.importAmount(sid);
        %>
        <label>현재 금액 : <%=money %></label>

        <br>
        <br>
        <label>환불할 금액 : </label>
        <input type="text" name = "money">
        <br>
        <label>환불 받을 은행 :</label>
        <select name = "bank">
        <option value = "0">은행 선택</option>
        <option value = "1">농협</option>
        <option value = "2">국민</option>
        <option value = "3">신한</option>
        <option value = "4">카카오</option>
        </select>
        <br>
        <input type="submit" value="환불">
        <input type="reset" value="취소">
        <!-- 환불하기 했을때 환불내역의 테이블만들지? 환불 신청이 들어오면 환불일 기준 3~5일 에서 환불 진행 예정입니다. 라는 alert와 함께
        환불 내역 테이블에 기록되면 경리가 환불 해주고 테이블에 내역 삭제 할 수 있도록-->
    </form>
    </section>
  </div>
</body>
</html>

