<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/se2/css/sideBar.css">
<link rel="stylesheet" type="text/css"
	href="/se2/hotel_Ulsan/menubar/css/commons.css">
</head>
<body>
	<%@include file="/hotel_Ulsan/ulsan_header.jsp"%>

	<div class="container">
		<!-- 왼쪽 사이드바 -->
		<section class="box1">
			<div class="sidebar">HELIA SEOUL GALLERY</div>
			<hr>
			<ul>
				<li><a href="/se2/hotel_Ulsan/menubar/facilities/meeting.jsp">수영장</a></li>
				<li><a href="/se2/hotel_Ulsan/menubar/facilities/business.jsp">비즈니스룸</a></li>
				<li><a href="/se2/hotel_Ulsan/menubar/facilities/lounge.jsp">라운지</a></li>
				<li><a href="/se2/hotel_Ulsan/menubar/facilities/wedding.jsp"><strong>웨딩홀</strong></a></li>
				<li><a href="/se2/hotel_Ulsan/menubar/facilities/fitness.jsp">피트니스 센터</a></li>
				<li><a href="/se2/hotel_Ulsan/menubar/facilities/view_All.jsp">전체 부대시설 보기</a></li>
			</ul>
		</section>

		<!-- 소개본문 -->
		<!-- sidebar 다음에 들어가는 중앙 콘텐츠 -->
		<div class="room-content">
			<div class="room-content-inner">
				<h2 class="room-title">웨딩홀</h2>

				<div class="room-visual-wrap">
					<div class="room-main-image">
						<img src="/se2/gallery/img/ulsan/facilities/U_Wedding.png" alt="울산 웨딩홀 이미지">
					</div>
					<div class="room-side-info">
					<br>
						<ul>
							<li><strong>위치</strong>&ensp;헬리아 울산 2층</li>
							<li><strong>다이너스티</strong></li>
							<li><strong>Area</strong>&ensp; 1.168.4m</li>
							<li><strong>Size</strong>&ensp; 50.8m x 23.0m / Height 6.2m</li>
							<li><strong>수용인원</strong>&ensp; 정찬 (코스) 기준 600석</li>
						</ul>
					</div>
				</div>

				<p class="room-description">
					<span class="desc-title">변하지 않는 숭고한 가치</span><br> <span
						class="desc-strong">다이너스티</span> 홀은 300명 규모의 중형 웨딩부터 600명 규모의 대형 웨딩까지 다양하게 연출이 가능한 최적의 공간입니다.<br>
					<span
						class="desc-strong"></span>
					<br> <span class="desc-phone">문의전화</span> <span
						class="desc-number">02-2308-9000</span><br>
					<br> <span class="desc-note"><br>
					</span>
				</p>
			</div>
		</div>
	</div>
	<%@ include file="/hotel_Ulsan/ulsan_footer.jsp"%>
</body>
</html>