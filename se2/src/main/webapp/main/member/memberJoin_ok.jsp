<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.hotel.member.MemberDTO" %>
<%@page import="com.hotel.member.MemberDAO" %>

<%request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="mdto" class="com.hotel.member.MemberDTO"></jsp:useBean>
<jsp:useBean id="mdao" class="com.hotel.member.MemberDAO"></jsp:useBean>

<%
String email1=request.getParameter("email1");
String email2=request.getParameter("email2");

String email=email1+"@"+email2;

mdto.setEmail(email); //mdto에 값 넣어줌
String pwdcheck=request.getParameter("pwdcheck");
String pwd=request.getParameter("pwd");



%>
<jsp:setProperty property="*" name="mdto" />
<%



int result=mdao.memberJoin(mdto);
String msg = result > 0 ? "회원가입을 축하합니다" : "회원가입에 오류가 발생하였습니다.";
%>
<script>
	window.alert('<%=msg%>');
   location.href ='login.jsp';
</script>