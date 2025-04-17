<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="reserDAO" class="com.hotel.reser.ReserDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");

int idx = Integer.parseInt(request.getParameter("idx"));
System.out.println(idx);

int payment = reserDAO.getPayment(idx);
int orgPrice = (int)(payment * 100.0 / (100 - (int)session.getAttribute("dcRate")));

int result = reserDAO.cancelReservation(idx, (String)session.getAttribute("sessionid"), orgPrice, payment);

String msg = result > 0 ? "예약 취소 성공" : "예약 취소 실패";

if (result > 0){
	session.setAttribute("balance", (int)session.getAttribute("balance") + payment);
	session.setAttribute("point", (int)session.getAttribute("point") - orgPrice);
}
%>
<script>
	alert('<%= msg %>');
	window.location.href = '/se2/index.jsp';
</script>