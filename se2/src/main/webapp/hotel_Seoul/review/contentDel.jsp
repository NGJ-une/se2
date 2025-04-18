<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rdao" class = "com.hotel.seoul.HotelReviewDAO"></jsp:useBean>
<%
int idx = Integer.parseInt(request.getParameter("vidx"));



int result = rdao.contentDel(idx);
String msg = result>0? "게시물이 삭제 되었습니다." : "게시물 삭제 실패.";
%>
<script>
window.alert('<%=msg%>');
location.href = 'list.jsp';
</script>