<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class = "com.hotel.mypage.PwchangeDAO"></jsp:useBean>
<%
String pwd = request.getParameter("pwd");
String sid = (String)session.getAttribute("sessionid");
String dbpwd = mdao.nowPwdBring(sid); //db에 저장된 비밀번호 값 가져오기 pw확인할때 썻던 메소드 재활용했음
String msg = pwd.equals(dbpwd) ? "프로필 수정으로 이동합니다." : "비밀번호를 확인해주세요.";
if("비밀번호를 확인해주세요.".equals(msg)) {
	%>
	<script>
	window.alert('<%=msg%>');
	location.href='profileEditCheck.jsp';
	</script>
	<%
}else {
	%>
	<script>
	window.alert('<%=msg%>');
	location.href='profileEdit.jsp';
	</script>
	<%
}
%>
