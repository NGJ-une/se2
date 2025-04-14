<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date" %>
<%
request.setCharacterEncoding("utf-8");

Date checkIn = Date.valueOf(request.getParameter("checkInStr"));
Date checkOut = Date.valueOf(request.getParameter("checkOutStr"));
int orgPrice = Integer.parseInt(request.getParameter("orgPrice"));
%>
<jsp:useBean id="reserDTO" class="com.hotel.reser.ReserDTO"></jsp:useBean>
<jsp:useBean id="reserDAO" class="com.hotel.reser.ReserDAO"></jsp:useBean>
<jsp:setProperty property="*" name="reserDTO"/>
<%
reserDTO.setCheckIn(checkIn);
reserDTO.setCheckOut(checkOut);

int result = reserDAO.reserveRoom(reserDTO, orgPrice);

String msg = result > 0 ? "예약 성공" : "예약 실패";

if (result > 0){
	session.setAttribute("point", (int)session.getAttribute("point") + orgPrice);
	session.setAttribute("balance", (int)session.getAttribute("balance") + reserDTO.getMoney());
}
%>
<script>
window.alert('<%= msg %>');
window.location.href = '/se2/main/hotelReser/hotelReser.jsp';
</script>




