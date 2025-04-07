<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="rdao" class = "com.hotel.mypage.RefundDAO"></jsp:useBean>
<jsp:useBean id="rdto" class = "com.hotel.mypage.RefundDTO"></jsp:useBean>
<jsp:setProperty property="*" name="rdto"/>
<%
String id = (String)session.getAttribute("sessionid");
String mid = id;
rdto.setMid(mid);
int mmoney = Integer.parseInt(request.getParameter("mmoney")); // 환불 금액
String bbank = request.getParameter("bbank"); //은행 value 0~4 로 넘어옴
String bacount = request.getParameter("bacount");//계좌 번호
String msg = "";
int bankValue = Integer.parseInt(bbank);
switch (bankValue) {
case 1 : bbank = "농협"; break;
case 2 : bbank = "국민"; break;
case 3 : bbank = "신한"; break;
case 4 : bbank = "카카오";
}
rdto.setBbank(bbank);
if(bankValue == 0) {
	%>
	<script>
	window.alert('환불 받을 은행을 선택해주세요.');
	location.href = 'refund.jsp';
	</script>
	<%
}else {

int result2 = rdao.refundDetails(rdto);
if(result2 > 0) {
	int result = rdao.reFund(id, mmoney);
	msg = result > 0 ? "입력하신 "+bbank+"은행 "+bacount+"계좌로 "+mmoney+"원 환불 되셧습니다." : "환불 받을 금액을 다시 확인해주세요.";
	%>
	<script>
	window.alert('<%=msg%>');
	location.href = 'refund.jsp';
	</script>
	<%

}else {
	%>
	<script>
	winodw.alert('고객센터에 문의해주세요.')
	location.href = 'refund.jsp';
	</script>
	<%
}
}
%>
