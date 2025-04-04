<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class = "com.hotel.mypage.PwchangeDAO"></jsp:useBean>
<%
String pwd = request.getParameter("pwd");
String id = "asd1234"; //session 값으로 변경해야함
String dbpwd = mdao.nowPwdBring(id); //db에 저장된 비밀번호 값 가져오기 pw확인할때 썻던 메소드 재활용했음
String msg = pwd.equals(dbpwd) ? "회원탈퇴 되셧습니다." : "비밀번호를 확인해주세요.";
if("비밀번호를 확인해주세요.".equals(msg)) {
	%>
	<script>
	window.alert('<%=msg%>');
	location.href='cancleCheck.jsp';
	</script>
	<%
}else {
	id = "";
	%>
	<script>
	window.alert('<%=msg%>');
	location.href='/index.jsp';
	</script>
	<%
}
%>
