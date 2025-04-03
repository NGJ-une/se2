<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdto" class = "com.hotel.mypage.PwchangeDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class = "com.hotel.mypage.PwchangeDAO"></jsp:useBean>
<%
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String fmail = request.getParameter("fmail");
String lmail = request.getParameter("lmail");
String tel = request.getParameter("tel");
String addr = request.getParameter("addr");
String email = fmail+"@"+lmail;
System.out.println(email);
%>