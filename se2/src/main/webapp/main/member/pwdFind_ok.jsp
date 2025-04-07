<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="mdao" class="com.hotel.member.MemberDAO"></jsp:useBean>

<%
String userid=request.getParameter("id");
String usertel=request.getParameter("tel");


String dbpwd=(mdao.pwdFind(userid, usertel));

if(dbpwd==null){
%>
<script>
window.alert('잘못 입력하셨습니다. 다시 입력해주세요.');
location.href ='pwdFind.jsp';
</script>
<%
}else if(dbpwd!=null){
%>
<script>
window.alert('회원님의 비밀번호는 <%=dbpwd%> 입니다. ');
location.href='pwdFind.jsp';
</script>
<%
}
%>