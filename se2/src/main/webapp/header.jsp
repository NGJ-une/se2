<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/se2/headerJS.js"></script> 
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/se2/css/commonsLayout.css">
<link rel="stylesheet" type="text/css" href="/se2/css/header.css">

<% String sid=(String)session.getAttribute("sessionid");%>

<!-- header.jsp -->
<header class="soft-header">
	<div class="wrapper">
		<div class="scaled-header-content">
		    <div class="soft-top-links">
		    <% if(sid==null) { %>
		      <a href="/se2/main/member/login.jsp" id="login"><strong>로그인</strong></a>
		      <a href="/se2/main/member/memberJoin.jsp">회원가입</a>
		    <% } else { %>
		      <a href = "/se2/main/myPage/myPage_main.jsp"><strong>마이페이지</strong></a>
		      <a href="/se2/main/member/logout.jsp">로그아웃</a>  
		    <% } %>
		    </div>
		
		    <div class="soft-main-header">
		      <nav class="soft-nav left">
		        <a  id="hotelSearchLink" onclick="showPopup()">호텔찾기<img src="/se2/main/myPage/img/Magnifier.png" alt="돋보기 이미지" 
		        style="width:20px; height:20px; vertical-align: middle; margin-left: 6px;"> </a>
		        <a  href="/se2/main/hotelInfo/hotelInfo.jsp">호텔소개<img src="/se2/main/myPage/img/Calendar.png" alt="달력 이미지" 
		        style="width:20px; height:20px; vertical-align: middle; margin-left: 6px;"> </a>
		      </nav>
		  
		    <div class="soft-logo">
		    	<a href="/se2/index.jsp" onclick="fadeOut(event, this)">HELIA HOTEL</a>
		    </div>
		  
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
    <%@ include file="/main/hotelSearch/hotelSearch.jsp" %> <!-- 호텔 찾기 -->
  </header>
