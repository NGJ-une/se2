<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hotel.*" %>
<jsp:useBean id="hdao" class = "com.hotel.mypage.DepositDAO"></jsp:useBean>
<%
int money = Integer.parseInt(request.getParameter("money"));

String id = "asd123";
int result = hdao.chargeAmount(money, id);
String msg = result > 0 ? "금액이 충전되었습니다." : "충전 실패~";

%>
<script>
window.alert('<%=msg%>');
location.href = 'deposit.jsp';
</script>