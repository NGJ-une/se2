<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
window.alert('로그아웃되었습니다.');
</script>

<%
session.invalidate();
response.sendRedirect("/se2/header.jsp");
%>