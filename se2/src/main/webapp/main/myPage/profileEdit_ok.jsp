<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdto" class = "com.hotel.mypage.PwchangeDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class = "com.hotel.mypage.PwchangeDAO"></jsp:useBean>
<%
String id = "asd123";
String fmail = request.getParameter("fmail");
String lmail = request.getParameter("lmail");
String email = fmail+"@"+lmail;
mdto.setMemail(email);
int result = mdao.memberEdit(id, mdto);
String msg = result > 0 ? "수정성공!" : "수정실패!";
if(result > 0 ) {
	%>
	<script>
window.alert('<%=msg%>');
location.href='myPage_main.jsp';
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

