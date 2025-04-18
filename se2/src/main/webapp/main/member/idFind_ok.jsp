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
    session.setAttribute("errorMsg", "등록한 정보와 입력하신 정보가 일치하지 않습니다. <br>다시 확인해주세요.");
    response.sendRedirect("idFind.jsp");
}else if(dbid!=null){
    session.setAttribute("errorMsg", "회원님의 아이디는"+ dbid+ "입니다.");
    response.sendRedirect("idFind.jsp");

}
%>