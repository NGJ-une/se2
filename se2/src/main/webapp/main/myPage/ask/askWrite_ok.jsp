<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="adao" class="com.hotel.mypage.AsklistDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");

String iid = (String)session.getAttribute("sessionid");
String itype = request.getParameter("itype");
String ititle = request.getParameter("ititle");
String icontent = request.getParameter("icontent");

int result = adao.askWrite(iid, itype,ititle, icontent);

String msg = result > 0 ? "고객님의 문의가 접수되었습니다." : "접수 실패!";
%>
<script>
	window.alert('<%= msg %>');
	window.location.href = '/se2/main/myPage/askList.jsp';
</script>

