<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hotel.*" %>
<jsp:useBean id="hdao" class = "com.hotel.mypage.DepositDAO"></jsp:useBean>
<%
int money = Integer.parseInt(request.getParameter("money"));

String id = "asd123";
if(money < 1000) {
	%>
	<script>
	window.alert('1,000원 이하로는 충전할 수 없습니다.')
	location.href = 'deposit.jsp';
	</script>
	<%
}else {
int result = hdao.chargeAmount(money, id);
String msg = result > 0 ? "금액이 충전되었습니다." : "충전 실패~";
%>
<script>
window.alert('<%=msg%>');
location.href = 'deposit.jsp';
</script>
<%
}
%>