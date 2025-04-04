<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String selectedRow = request.getParameter("selectedRow");
String selectedType = request.getParameter("type_" + selectedRow);
String selectedMoney = request.getParameter("money_" + selectedRow);
%>
<jsp:useBean id="reserDTO" class="com.hotel.reser.ReserDTO"></jsp:useBean>
<jsp:useBean id="reserDAO" class="com.hotel.reser.ReserDAO"></jsp:useBean>
<jsp:setProperty property="*" name="reserDTO"/>
<jsp:setProperty property="id" name="reserDTO" value="<%= session.getAttribute("userId") %>"/>
<jsp:setProperty property="type" name="reserDTO" value="<%= selectedType %>"/>
<jsp:setProperty property="money" name="reserDTO" value="<%= selectedMoney %>"/>

<%
int result = reserDAO.reserveRoom(reserDTO);

String msg = result > 0 ? "예약 성공" : "예약 실패";
%>
<script>
	window.alert('<%= msg %>');
	window.location.href = '/se2/main/hotelReser/hotelReser.jsp';
</script>

