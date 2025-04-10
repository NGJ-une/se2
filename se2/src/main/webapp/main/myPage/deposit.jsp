<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mdao" class="com.hotel.mypage.DepositDAO"></jsp:useBean>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>충전하기</title>
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

    .info-box {
      flex: 1;
      background-color: #ffffff;
      border-radius: 12px;
      padding: 30px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
      color: #444;
    }

    h1 {
      font-size: 28px;
      color: #333;
      margin-bottom: 30px;
      border-bottom: 3px solid #eee;
    }

    label {
      display: block;
      margin-bottom: 10px;
      font-size: 16px;
      color: #555;
    }

    .currentMoney {
      font-size: 18px;
      margin-bottom: 25px;
      color: #b58143;
      font-weight: bold;
    }

    input[type="number"] {
      width: 300px;
      padding: 12px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 8px;
      margin-bottom: 20px;
    }

    input[type="submit"],
    input[type="reset"] {
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

    input[type="submit"]:hover {
      background-color: #f0b675;
    }

    input[type="reset"] {
      background-color: #e0e0e0;
      color: #333;
    }

    input[type="reset"]:hover {
      background-color: #bdbdbd;
    }

    .info-box h3 {
      margin-bottom: 15px;
      color: #444;
    }

    .info-box p {
      font-size: 15px;
      margin-bottom: 10px;
      line-height: 1.6;
    }

    .emoji {
      font-size: 22px;
      margin-right: 6px;
    }
  </style>
</head>
<body>
  <%@include file="/header.jsp" %>
  <div class="container">
    <%@include file="sideBar.jsp" %>

    <section class="box2">
      <form name="deposit" action="deposit_ok.jsp">
        <h1>포인트 충전</h1>
        <%
          String id = (String)session.getAttribute("sessionid");
          int money = mdao.importAmount(id);
        %>
        <label class="currentMoney">현재 보유 금액 : <%=money %> 원</label>

        <label for="money">충전할 금액 입력</label>
        <input type="number" id="money" name="money" placeholder="예: 10000" required>

        <br>
        <input type="submit" value="충전하기">
        <input type="reset" value="초기화">
      </form>
    </section>

    <aside class="info-box">
      <h3>충전 유의사항</h3>
      <p><span class="emoji">1.</span> 최소 충전 금액은 1,000원입니다.</p>
      <p><span class="emoji">2.</span> 충전 후 환불은 환불하기를 통해 가능합니다.</p>
      <p><span class="emoji">3.</span> 환불 후 환불이 완료되기 전까지 영업일 기준 2~3 일 정도 소요 됩니다.</p>
      <p><span class="emoji">☎</span> 문의: 1234-5678</p>
    </aside>
  </div>
  <%@include file="/footer.jsp" %>
</body>
</html>
