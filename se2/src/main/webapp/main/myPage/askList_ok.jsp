<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.*"%>

<jsp:useBean id="adao" class="com.hotel.mypage.AsklistDAO"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");


String askdate_s = request.getParameter("askdate");
String faskdate = askdate_s;

if(askdate_s==null||askdate_s.length()==0){
	faskdate = askdate_s;
} else {
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일");
	java.util.Date askdate_u = sdf.parse(askdate_s);
	//date 형식
	SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
	askdate_s = sdf2.format(askdate_u);
	//util.date를 sql.date로 변환
	faskdate = askdate_s;
}

request.setAttribute("fad", faskdate);

%>

<script>
    location.href = 'askList.jsp?fad=<%=faskdate%>';
</script>
