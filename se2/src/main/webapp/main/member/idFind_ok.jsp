<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="mdao" class="com.hotel.member.MemberDAO"></jsp:useBean>

<%
String usertel=request.getParameter("tel");

String question=request.getParameter("question");
int userquestion=Integer.parseInt(question);
//int userquestion= Integer.ParseInt((question.substring(3, 4)));
String useranswer=request.getParameter("answer");

String dbid=(mdao.idFind(usertel, userquestion, useranswer));

if(dbid==null){
%>
<script>
window.alert('잘못 입력하셨습니다. 다시 입력해주세요.');
location.href ='idFind.jsp';
</script>
<%
}else if(dbid!=null){
%>
<script>
window.alert('회원님의 아이디는 <%=dbid%> 입니다. ');
location.href='idFind.jsp';
</script>
<%
}
%>