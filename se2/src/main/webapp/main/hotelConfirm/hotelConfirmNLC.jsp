<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- number type인 input태그 스크롤 없애는 CSS ( 비표준 임) -->
<style>
input::-webkit-inner-spin-button{-webkit-appearance: none; }
</style>
</head>
<body>
<%@ include file="/header2.jsp" %>
<section>
	<article>
		<form name="ConfirmNumberCheck" action="hotelConfirmNLC_ok.jsp" method="post">
			<h2>예약번호로 예약내역 확인</h2>
			<hr>
			<ul>
				<li>저희 호텔에 오신것을 환영합니다.</li>
				<li>예약번호를 입력해 주시기 바랍니다.</li>
				<li>저희 호텔에 회원이 되시면 회원만을 위한 특별한 혜택을 받아보실 수 있습니다.</li>
				<li><a href="/se2/main/member/login.jsp">로그인</a>을 하시면 바로 예약 내역을 바로 확인 하실 수 있습니다.</li>
			</ul>
			<fieldset>
				<legend>예약번호로 예약확인</legend>
				<table>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id" required></td>
					</tr>
					<tr>
						<th>예약번호</th>
						<td><input type="number" name="confirmNumber" required>
					</tr>
					<tr>
						<td><input type="reset" value="비우기"></td>
						<td><input type="submit" value="예약 확인"></td>
					</tr>
				</table>
			</fieldset>
		</form>
	</article>
</section>
<%@ include file="/footer2.jsp" %>
</body>
</html>