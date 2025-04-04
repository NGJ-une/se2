<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date" %>
<%
request.setCharacterEncoding("utf-8");

String selectedRow = request.getParameter("selectedRow");
String selectedType = request.getParameter("type_" + selectedRow);
String selectedMoney = request.getParameter("money_" + selectedRow);
Date checkIn = Date.valueOf(request.getParameter("checkInStr"));
Date checkOut = Date.valueOf(request.getParameter("checkOutStr"));
%>
<jsp:useBean id="reserDTO" class="com.hotel.reser.ReserDTO"></jsp:useBean>
<jsp:useBean id="reserDAO" class="com.hotel.reser.ReserDAO"></jsp:useBean>
<jsp:setProperty property="*" name="reserDTO"/>
<%
reserDTO.setId("fff");
reserDTO.setType(selectedType);
reserDTO.setCheckIn(checkIn);
reserDTO.setCheckOut(checkOut);
reserDTO.setMoney(Integer.parseInt(selectedMoney));

int result = reserDAO.reserveRoom(reserDTO);

String msg = result > 0 ? "예약 성공" : "예약 실패";
%>
<script>
	window.alert('<%= msg %>');
	window.location.href = '/se2/main/hotelReser/hotelReser.jsp';
</script>

