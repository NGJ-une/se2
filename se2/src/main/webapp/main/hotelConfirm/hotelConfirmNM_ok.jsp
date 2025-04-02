<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="hcDAO" class="com.hotel.confirm.HotelConfirmDAO"></jsp:useBean>
<%
//예약번호 값 받아오기 
String confirmNumber_s=request.getParameter("confirmNumber");
//숫자이거나 빈문자열 자체를 막았지만 -> 빈문자열이거나 null 일시 예약번호로 예약확인 페이지로 load 
if(confirmNumber_s.equals("")||confirmNumber_s==null) {
	%>
	<script>
		window.alert('잘못된 입력입니다'); 
		location.href='hotelConfirmNM.jsp';
	</script>
	<%
	return;
}
//int type으로 파씽
int confirmNumber=Integer.parseInt(confirmNumber_s);

// DB 검색 후 없을 시 경고창 알림 
boolean result = hcDAO.ConfirmNumberCheck(confirmNumber);
if(result==false){
	%>
	<script>
		window.alert('예약번호로 예약된 내역이 없습니다');
		location.href='hotelConfirmNM.jsp';
	</script>
	<%
}else{
	//받았던 값 넘기기 
	response.sendRedirect("hotelConfirmM.jsp?confirmNumber="+confirmNumber);
}
%>