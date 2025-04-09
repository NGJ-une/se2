<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    
<link rel="stylesheet" type="text/css" href="/se2/css/header2.css">
<% String sid=(String)session.getAttribute("sessionid");%>
<!-- header.jsp -->
<header class="soft-header">
	<div class="header-inner">
	    <div class="soft-top-links">
	    <%
	    if(sid==null){
	    	%>
	      <a href="/se2/main/member/login.jsp" id="login"><strong>로그인</strong></a>
	      <a href="/se2/main/member/memberJoin.jsp">회원가입</a>
	    	<%
	    }else{
	    	%>
	      <a href = "/se2/main/myPage/myPage_main.jsp"><strong>마이페이지</strong></a>
	      <a href="/se2/main/member/logout.jsp">로그아웃</a>  
	    	<%
	    }
	    %>
	    </div>
	  
	    <div class="soft-main-header">
	      <nav class="soft-nav left">
	        <a class="top-menu-text" id="hotelSearchLink" onclick="showPopup()">호텔찾기</a>
	        <a class="top-menu-text" href="#">호텔소개</a>
	      </nav>
	  
	    <div class="soft-logo"><a href="/se2/index.jsp">HELIA HOTEL</a></div>
	  
	      <nav class="soft-nav right">
	      <a href="se2/main/hotelReser/hotelReser.jsp">예약하기</a>
	        <%
	        if(sid==null){
	        	%>
	        <a href="#">예약확인</a>
	        	<%
	        }else{
	        	%>
	        <a href="#">예약확인</a>
	        	<%
	        }
	        %>
	      </nav>
	    </div>
    </div>
    <%@ include file="/main/hotelSearch/hotelSearch.jsp" %> <!-- 호텔 찾기 -->
  </header>
