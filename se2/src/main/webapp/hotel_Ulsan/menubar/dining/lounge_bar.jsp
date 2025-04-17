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
				<li><a href="/se2/hotel_Ulsan/menubar/dining/restaurant.jsp">레스토랑</a></li>
				<li><a href="/se2/hotel_Ulsan/menubar/dining/lounge_bar.jsp"><strong>라운지 & 바</strong></a></li>
			</ul>
		</section>

		<!-- 소개본문 -->
		<!-- sidebar 다음에 들어가는 중앙 콘텐츠 -->
		<div class="room-content">
			<div class="room-content-inner">
				<h2 class="room-title">라운지 & 바</h2>

				<div class="room-visual-wrap">
					<div class="room-main-image">
						<img src="/se2/gallery/img/ulsan/dining/U_Restaurant2.png" alt="라운지 & 바 이미지">
					</div>
					<div class="room-side-info">
					<br>
						<ul>
							<li><strong>위치</strong>&ensp;헬라서울 5층</li>
							<li><strong>운영시간</strong>&ensp;19:00 ~ 02:00</li>
							<li><strong>좌석수</strong>&ensp;75석 (10인석 규모의 별도 공간 있음)</li>
							<li><strong>주차안내</strong>&ensp;바 이용시 3시간당 5,000원 <br> * 호텔 주차장 만차 시 외부 주차장 이용 가능</li>
							<li>무료시음,음료</li>
						</ul>
					</div>
				</div>

				<p class="room-description">
					<span class="desc-title">Relaxed & Enjoyable, Bar</span><br> <span
						class="desc-strong">모던하고 고급스러운</span>디자인과 어우러진 벽난로,<br>
					<br>편안한 소파는 세련되면서 아늑한 분위기를 연출 합니다 <br> 바쁜 <span
						class="desc-strong">일상 속 당신이</span>원하던 편안하고 여유로운 공간입니다.<br>
					<br> <span class="desc-phone">문의전화</span> <span
						class="desc-number">02-2308-2203~5</span><br>
					<br> <span class="desc-note">숙박으로 1박 이상 머무르시는 고객님들께 방문 시 
					객실 카드를 가져 오시면 웰컴 드링크를 드립니다.</span>
				</p>
			</div>
		</div>
	</div>
	<%@ include file="/hotel_Ulsan/ulsan_footer.jsp"%>
</body>
</html>