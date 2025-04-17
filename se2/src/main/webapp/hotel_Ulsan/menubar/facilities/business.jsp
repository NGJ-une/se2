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
				<li><a href="/se2/hotel_Ulsan/menubar/facilities/business.jsp"><strong>비즈니스룸</strong></a></li>
				<li><a href="/se2/hotel_Ulsan/menubar/facilities/lounge.jsp">라운지</a></li>
				<li><a href="/se2/hotel_Ulsan/menubar/facilities/wedding.jsp">웨딩홀</a></li>
				<li><a href="/se2/hotel_Ulsan/menubar/facilities/fitness.jsp">피트니스 센터</a></li>
				<li><a href="/se2/hotel_Ulsan/menubar/facilities/view_All.jsp">전체 부대시설 보기</a></li>
			</ul>
		</section>

		<!-- 소개본문 -->
		<!-- sidebar 다음에 들어가는 중앙 콘텐츠 -->
		<div class="room-content">
			<div class="room-content-inner">
				<h2 class="room-title">비즈니스 룸</h2>

				<div class="room-visual-wrap">
					<div class="room-main-image">
						<img src="/se2/gallery/img/ulsan/facilities/U_Lounge.png" alt="비즈니스룸 이미지">
					</div>
					<div class="room-side-info">
					<br>
						<ul>
							<li><strong>위치</strong>&ensp;헬리아 울산 본관 1층</li>
							<li><strong>운영시간</strong>&ensp;24시간</li>
							<li><strong>요금</strong>&ensp;무료</li>
							<li><strong>시설</strong>&ensp; PC, 프린터, 복사, 무선인터넷 접속</li>
						</ul>
					</div>
				</div>

				<p class="room-description">
					<span class="desc-title">신속한 업무가 가능한 비즈니스 전용 공간</span><br> <span
						class="desc-strong">24시간</span>운영되는 비즈니스 코너에는 컴푸터를 비롯하여 프린터, 팩스 복사기 등 편의 시설이 갖춰져 있습니다.<br>
					<span
						class="desc-strong"></span>
					<br> <span class="desc-phone">문의전화</span> <span
						class="desc-number">02-2308-9000</span><br>
					<br> <span class="desc-note"></span>
				</p>
			</div>
		</div>
	</div>
	<%@ include file="/hotel_Ulsan/ulsan_footer.jsp"%>
</body>
</html>