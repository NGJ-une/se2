<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="mdao" class="com.hotel.member.MemberDAO"></jsp:useBean>

<%
String userid = request.getParameter("userid");
String userpwd = request.getParameter("userpwd");
String saveid = request.getParameter("saveid"); //아이디 체크

String dbpwd= mdao.login(userid); //내가 입력한 id의 비밀번호를 불러와서 그 결과가 result라는 변수에 들어감


if (dbpwd.equals(userpwd)) {
%>
<script>
	alert("로그인 성공!");
	location.href = "login.jsp";
</script>
<%
} else{
%>
<script>
	window.alert("로그인 실패!");
	location.href = "login.jsp";
</script>
<%
}
%>


