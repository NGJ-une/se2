<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/se2/hotel_Ulsan/css/header.css">
<%String sid=(String)session.getAttribute("sessionid"); %>
<script src="/se2/hotel_Ulsan/js/ulsan__header_body_js.js"></script>
<!-- header.jsp -->
<!-- 배경 유지용 -->
<header class="header-seoul">

<!-- 전체 레이아웃 축소 -->
<div class="scaled-content-header">

	<!-- 상단 유틸 -->
	<div class="header-top">
		<div class="header-utils">
			<!-- 왼쪽 호텔찾기 -->
			<div class="left-utils">
			<nav class="soft-nav left">
		        <a  class="hotel-search-btn" id="hotelSearchLink" onclick="showPopup()">호텔찾기<img src="/se2/main/myPage/img/Magnifier.png" alt="돋보기 이미지" 
		        style="width:20px; height:20px; vertical-align: middle; margin-left: 6px;"></a>
		    </nav>    
			</div>
			<!-- 오른쪽 로그인 회원가입 -->
			<div class="right-utils">
			
			<% if(sid==null||"".equals(sid)) { %>
				<a href="/se2/main/member/login.jsp" id="login"><strong>로그인</strong></a>
				<a href="/se2/main/member/memberJoin.jsp">회원가입</a>
			<% } else { %>
				<a href="/se2/main/myPage/myPage_main.jsp?userid=<%=sid%>"><strong>마이페이지</strong></a>
				<a href="/se2/main/member/logout.jsp">로그아웃</a>
			<% } %>
			</div>
			
		</div>
	</div>
		<!-- 로고 -->
		<div class="header-logo">
			<h1><a href="/se2/index.jsp"> HELIA HOTEL ULSAN</a></h1>
		</div>
		
</div> <!-- scaled-content 닫힘 -->

	  <!-- 브라우저 전체 넓이로 -->
	  <div class="menu-total-wrap">
	  <nav class="header-nav">
	    <div class="main-menu-container">
	      <ul class="main-menu">
	        <li class="has-submenu" data-menu="review"><a href="/se2/hotel_Seoul/review/list.jsp">후기</a></li>
	        <li class="has-submenu" data-menu="room"><a href="/se2/hotel_Ulsan/menubar/room/standard.jsp">객실</a></li>
	        <li class="has-submenu" data-menu="dining"><a href="/se2/hotel_Ulsan/menubar/dining/restaurant.jsp">다이닝</a></li>
	        <li class="has-submenu" data-menu="activity"><a href="/se2/hotel_Ulsan/menubar/facilities/meeting.jsp">부대시설</a></li>
	        <li><a href="/se2/hotel_Ulsan/menubar/ViewLocation/view_location.jsp">위치보기</a></li>
	        <li><a href="/se2/main/hotelReser/hotelReser.jsp?name=h_ulsan">예약하기</a></li>
	      </ul>
	    </div>
	  </nav>
	
	  <!-- 💥 서브메뉴도 scaled 밖! -->
	  <div class="sub-menu-wrap">
	    <ul class="sub-menu" data-menu="review"><li><a href="/se2/hotel_Ulsan/review/list.jsp">후기 목록</a></li></ul>
	    <ul class="sub-menu" data-menu="room">
	      <li><a href="/se2/hotel_Ulsan/menubar/room/standard.jsp">스탠다드</a></li>
	      <li><a href="/se2/hotel_Ulsan/menubar/room/deluxe.jsp">디럭스</a></li>
	      <li><a href="/se2/hotel_Ulsan/menubar/room/sweet.jsp">스위트</a></li>
	      <li><a href="/se2/hotel_Ulsan/menubar/room/grand.jsp">그랜드</a></li>
	      <li><a href="/se2/hotel_Ulsan/menubar/room/view_All.jsp">전체 객실 보기</a></li>
	    </ul>
	    <ul class="sub-menu" data-menu="dining">
	      <li><a href="/se2/hotel_Ulsan/menubar/dining/restaurant.jsp">레스토랑</a></li>
	      <li><a href="/se2/hotel_Ulsan/menubar/dining/lounge_bar.jsp">라운지 & 바</a></li>
	    </ul>
	    <ul class="sub-menu" data-menu="activity">
	      <li><a href="/se2/hotel_Ulsan/menubar/facilities/meeting.jsp">수영장</a></li>
	      <li><a href="/se2/hotel_Ulsan/menubar/facilities/business.jsp">비즈니스 룸</a></li>
	      <li><a href="/se2/hotel_Ulsan/menubar/facilities/lounge.jsp">라운지</a></li>
	      <li><a href="/se2/hotel_Ulsan/menubar/facilities/wedding.jsp">웨딩홀</a></li>
	      <li><a href="/se2/hotel_Ulsan/menubar/facilities/fitness.jsp">피트니스 센터</a></li>
	      <li><a href="/se2/hotel_Ulsan/menubar/facilities/view_All.jsp">전체 시설 보기</a></li>
	    </ul>
	  </div>
	</div>
	<%@ include file="/main/hotelSearch/hotelSearch.jsp" %> <!-- 호텔 찾기 -->
</header>