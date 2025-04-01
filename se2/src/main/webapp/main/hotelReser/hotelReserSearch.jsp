<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String regionInitial = request.getParameter("region");
int sum = Integer.parseInt(request.getParameter("adult")) + Integer.parseInt(request.getParameter("kid"))
	+ Integer.parseInt(request.getParameter("baby"));

int capacity = sum % 2 == 0 ? (sum / 2) * 2 : (sum / 2) * 2 + 2;



%>
