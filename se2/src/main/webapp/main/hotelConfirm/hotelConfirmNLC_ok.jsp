<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="hcdao" class="com.hotel.confirm.HotelConfirmDAO"></jsp:useBean>
<%
//예약번호 값 받아오기 
String confirmNumber_s=request.getParameter("confirmNumber");
//아이디 값 받아오기
String id=request.getParameter("id");
//숫자이거나 빈문자열 자체를 막았지만 -> 빈문자열이거나 null 일시 예약번호로 예약확인 페이지로 load 
if(confirmNumber_s.equals("")||confirmNumber_s==null&&id.equals("")||id==null) {
	%>
	<script>
		<!-- \n 개행으로 2출로 표시-->
		window.alert('잘못된 입력입니다 \n 다시 입력바랍니다'); 
		location.href='hotelConfirmNM.jsp';
	</script>
	<%
	return;  //이후 코드가 실행 되지 않도록 return
}
//예약번호 int type으로 파씽
int confirmNumber=Integer.parseInt(confirmNumber_s);

// DB 검색 후 없을 시 경고창 알림 
boolean result = hcdao.ConfirmNumberCheck(confirmNumber, id);
if(result==false){
    session.setAttribute("errorMsg", "예약 번호로 예약된 내역이 없습니다. <br> 다시 입력해 주시길 바랍니다.");
    response.sendRedirect("hotelConfirmNLC.jsp");
}else{
	//받았던 confirmM 으로 예약번호/id 값 넘기기 
	response.sendRedirect("hotelConfirmNL.jsp?ridx="+confirmNumber+"&mid="+id);
}
%>