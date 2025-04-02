<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="com.hotel.member.MemberDAO"></jsp:useBean>

<%
String userid=request.getParameter("userid");
boolean result=mdao.idCheck(userid);

if(result){
 %>
 
 
<script>
window.alert('이미 가입되어있는 아이디입니다.');
location.href='idCheck.jsp';
</script>
    
    
<%
 }else{
%>

<script>
window.alert('<%=userid%>는 사용가능한 아이디입니다.');

opener.document.memberJoin.id.value='<%=userid%>';
window.self.close();
</script>

<%
 }
%>
