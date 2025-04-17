<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.hotel.member.MemberDTO" %>
<%@page import="com.hotel.member.MemberDAO" %>
<%@ page import = "java.util.*" %>
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
Calendar now = Calendar.getInstance();
int year = now.get(Calendar.YEAR) -19;
String birth_s = request.getParameter("birth");
int birth = 0;
if(birth_s != null) {
	birth_s = birth_s.substring(0, 4);
	birth = Integer.parseInt(birth_s);
}
if(birth > year) {
%>
<script>
window.alert('만 19세 이하는 회원가입이 불가능합니다.');
location.href = '/se2/index.jsp';
</script>
<%
}else {
int result=mdao.memberJoin(mdto);
String msg = result > 0 ? "회원가입을 축하합니다" : "회원가입에 오류가 발생하였습니다.";
%>
<script>
   window.alert('<%=msg%>');
   location.href ='register.jsp';
</script>
<%
}
%>