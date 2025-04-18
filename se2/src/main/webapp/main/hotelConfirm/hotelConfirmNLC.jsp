<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HELIA HOTEL : 예약확인</title>
<link rel="stylesheet" type="text/css" href="/se2/css/commonsLayout.css">
<link rel="stylesheet" type="text/css" href="/se2/main/hotelConfirm/css/nlc.css">
</head>
<body>
<%@ include file="/header.jsp" %>
<section class="confirmNLC">
  <article>
    <div class="confirm-box wrapper">
      <form name="ConfirmNumberCheck" action="hotelConfirmNLC_ok.jsp" method="post">
        <h2>예약번호로 예약내역 확인</h2>
        <p class="subtext">예약번호만 알고있어도 간편하게 확인할 수 있습니다.</p>
        <ul class="info-list">
          <li>HELIA 호텔에 오신 것을 환영합니다.</li>
          <li>예약번호를 입력해 주시기 바랍니다.</li>
          <li>회원 가입 시, 다양한 혜택을 누릴 수 있습니다.</li>
          <li><a href="/se2/main/member/login.jsp">로그인</a>하시면 더 빠른 조회가 가능합니다.</li>
        </ul>

        <fieldset>
          <legend>예약번호로 확인</legend>
          <div class="form-row">
            <label for="id">아이디</label>
            <input type="text" name="id" id="id" required>
          </div>
          <div class="form-row">
            <label for="confirmNumber">예약번호</label>
            <input type="number" name="confirmNumber" id="confirmNumber" required>
          </div>
          <div class = "confirmFailMsg">
                    		<%
		    String errorMsg = (String) session.getAttribute("errorMsg");
		    if (errorMsg != null) {
		%>
		    <p><%= errorMsg %></p>
		<%
		        session.removeAttribute("errorMsg");
		    }
		%>
		</div>
          <div class="form-buttons">
            <input type="reset" value="비우기">
            <input type="submit" value="예약 확인">
          </div>
        </fieldset>
      </form>
    </div>
  </article>
</section>
<%@ include file="/footer.jsp" %>
</body>
</html>