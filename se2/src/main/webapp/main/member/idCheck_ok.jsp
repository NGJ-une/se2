<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="com.hotel.member.MemberDAO"></jsp:useBean>

<%
String userid=request.getParameter("userid");
boolean result=mdao.idCheck(userid); //userid의 값을 dao idcheck메소드로 넘김

if(result){ //userid 입력한 값과 db의 userid와 같을때
	session.setAttribute("errorMsg", "이미 사용하고있는 아이디 입니다.");
    response.sendRedirect("idCheck.jsp");
 }else{ //DBid 입력한 값과 db의 userid와 같을때
%>

<script>
window.alert('<%=userid%>는 사용가능한 아이디입니다.');

opener.document.memberJoin.id.value='<%=userid%>';
window.self.close();
</script>

<%
 }
%>
