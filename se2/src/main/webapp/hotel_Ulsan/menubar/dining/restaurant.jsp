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
				<li><a href="/se2/hotel_Ulsan/menubar/dining/restaurant.jsp"><strong>레스토랑</strong></a></li>
				<li><a href="/se2/hotel_Ulsan/menubar/dining/lounge_bar.jsp">라운지 & 바</a></li>
			</ul>
		</section>

		<!-- 소개본문 -->
		<!-- sidebar 다음에 들어가는 중앙 콘텐츠 -->
		<div class="room-content">
			<div class="room-content-inner">
				<h2 class="room-title">레스토랑</h2>

				<div class="room-visual-wrap">
					<div class="room-main-image">
						<img src="/se2/gallery/img/ulsan/dining/U_Restaurant3.png" alt="레스토랑 이미지">
					</div>
					<div class="room-side-info">
					<br>
						<ul>
							<li><strong>위치</strong>&ensp;헬라서울 2층</li>
							<li><strong>운영시간</strong>&ensp;06:30 ~ 21:30</li>
							<li><strong>좌석수</strong>&ensp;144석 (15인석 규모의 별도 공간 있음)</li>
							<li><strong>주차안내</strong>&ensp;레스토랑 이용시 3시간당 5,000원 <br> * 호텔 주차장 만차 시 외부 주차장 이용 가능</li>
						</ul>
					</div>
				</div>

				<p class="room-description">
					<span class="desc-title">Modern & Delightful, <strong>Cafe</strong></span><br> <span
						class="desc-strong">모던 앤 캐주얼 뷔페 레스토랑 카페 (cafe)</span>에서 세련된 분위기 속 엄선된 메뉴와<br>
					<br>신선한 음식을 맛볼 수 있습니다 <br> 다양하고 <span
						class="desc-strong">차별화된 요리</span>로 오감을 만족시키는 All Day Dining을 경험하십시오. <br>풍성한 뷔페에 와인까지 함께 즐긴다면 가족, 연인 및 비즈니스 고객에게 최상의 선택이 될 것입니다.<br>
					<br> <span class="desc-phone">문의전화</span> <span
						class="desc-number">02-2308-9107~8</span><br>
					<br> <span class="desc-note">&#42;호텔 사정에 의해 특정 일자는 사전 고지 없이 운영 시간이 변동 될 수 있습니다.<br>&#42;토요일부터 일요일 석식까지는 동일한 주말 뷔페 요금이 적용 됩니다.<br>&#42;상기 금액은 10%의 부가가치세가 포함된 금액입니다.</span>
				</p>
			</div>
		</div>
	</div>
	<%@ include file="/hotel_Ulsan/ulsan_footer.jsp"%>
</body>
</html>