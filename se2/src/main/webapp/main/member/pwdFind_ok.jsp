<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="mdao" class="com.hotel.member.MemberDAO"></jsp:useBean>

<%
String userid=request.getParameter("id");
String usertel=request.getParameter("tel");


String dbpwd=(mdao.pwdFind(userid, usertel));

if(dbpwd==null){

session.setAttribute("errorMsg", "ID 또는 전화번호가 잘못 입력되었습니다. <br>다시 확인해주세요.");
response.sendRedirect("pwdFind.jsp");

}else if(dbpwd!=null){
	session.setAttribute("errorMsg", "회원님의 비밀번호는 "+dbpwd+" 입니다.");
	response.sendRedirect("pwdFind.jsp");
}
%>