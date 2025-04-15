<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/se2/css/commonsLayout.css">
<link rel="stylesheet" type="text/css" href="/se2/css/header.css">
<style>
.soft-header {
  height: 150px;
  background-color: white;
}
header.soft-header,
.footer {
  width: 100%;
  background-color: white;
}

.soft-logo-region {
  position: absolute;
  top: 130%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 30px;
  color: red;
  text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
}

.soft-nav a {
  color: blue;
}

.soft-nav a:hover {
  color: green;
}
</style>
<%
String sid = (String)session.getAttribute("sessionid");
%>
</head>
<body>
<header class="soft-header">
	<div class="wrapper">
		<div class="scaled-header-content">
		    <div>
			    <div class="soft-top-links" style="margin-right: 1000px; margin-left: 10px; display: inline-block; font-size: 15px;">
			    	<a  id="hotelSearchLink" onclick="showPopup()">호텔찾기</a>
			    </div>
			    <div class="soft-top-links" style="margin-left: auto; display: inline-block;">
			    <% if(sid==null) { %>
			      <a href="/se2/main/member/login.jsp" id="login" onclick="fadeOut(event, this)"><strong>로그인</strong></a>
			      <a href="/se2/main/member/memberJoin.jsp">회원가입</a>
			    <% } else { %>
			      <a href = "/se2/main/myPage/myPage_main.jsp"><strong>마이페이지</strong></a>
			      <a href="/se2/main/member/logout.jsp">로그아웃</a>  
			    <% } %>
			    </div>
		    </div>
		    <div class="soft-main-header">
			    <div class="soft-logo">
			    	<a href="/se2/index.jsp">HELIA HOTEL</a>
			    </div>
				<div class="soft-logo-region">
			    	Seoul
			    </div>
		    </div>
		    
	    	<div>
		    	<div style="position: relative; top: 50px; height: auto; border: 2px solid black;">
			    	<nav class="soft-nav left">
				        <a  id="hotelSearchLink" onclick="showPopup()">호텔찾기</a>
				        <a  href="/se2/main/hotelInfo/hotelInfo.jsp">호텔소개</a>
				    </nav>
				    <nav class="soft-nav right">
				      	<a href="/se2/main/hotelReser/hotelReser.jsp">예약하기</a>
				        <% if(sid==null||"".equals(sid)) { %>
				        <a href="/se2/main/hotelConfirm/hotelConfirmNLC.jsp">예약확인</a>
				        <% } else { %>
				        <a href="/se2/main/hotelConfirm/hotelConfirmL.jsp">예약확인</a>
				        <% } %>
				    </nav>
		    	</div>
	    	</div>
	    </div>
    </div>
    <%@ include file="/main/hotelSearch/hotelSearch.jsp" %> <!-- 호텔 찾기 -->
  </header>
</body>
</html>