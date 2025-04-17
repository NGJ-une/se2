<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
				<li><a href="/se2/hotel_Ulsan/menubar/facilities/wedding.jsp">웨딩홀</a></li>
				<li><a href="/se2/hotel_Ulsan/menubar/facilities/fitness.jsp"><strong>피트니스 센터</strong></a></li>
				<li><a href="/se2/hotel_Ulsan/menubar/facilities/view_All.jsp">전체 부대시설 보기</a></li>
			</ul>
		</section>

		<!-- 소개본문 -->
		<!-- sidebar 다음에 들어가는 중앙 콘텐츠 -->
		<div class="room-content">
			<div class="room-content-inner">
				<h2 class="room-title">피트니스 센터</h2>

				<div class="room-visual-wrap">
					<div class="room-main-image">
						<img src="/se2/gallery/img/ulsan/facilities/U_Zim.png" alt="피트니스 센터 이미지">
					</div>
					<div class="room-side-info">
					<br>
						<ul>
							<li><strong>위치</strong>&ensp;헬리아 울산 3층 피트니스</li>
							<li><strong>운영시간</strong>&ensp;05:30 ~ 22:30</li>
							<li><strong>정기휴일</strong>&ensp;매월 세 번째 수요일</li>
							<li><strong>대여 품목</strong>&ensp;트레드밀 5대, 사이클 5대, 근력운동머신 9종,복근 전용기구 1대, 덤벨세트, 일립티컬 1대, 트레이닝 복(무료), 양말(무료)</li>
						</ul>
					</div>
				</div>

				<p class="room-description">
					<span class="desc-title">체계적인 체력 관리를 위한 기능별 공간과 최상의 휴식을 위한<br></span>
					 <span
						class="desc-strong">공간으로 조성되어 운동과 휴식을 조화롭게 즐기실 수 있는 실내 체육관 입니다.</span><br>
					 <span class="desc-strong"></span>
					<br> <span class="desc-phone">문의전화</span> <span
						class="desc-number">02-2308-9090</span><br>
					<br> <span class="desc-note">&#42;체육관은 만 16세 이상 고객에 한해 입장 가능합니다.
					<br>&#42;고객 여러분의 안전을 위하여 음주 후 체육관, 사우나, 실내 수영장 등의 피트니스 시설 이용은 제한될 수 있습니다.
					<br>&#42;실내 체육관 입장 시 반스디 운동복과 실내용 운동화를 착용해 주시기 바랍니다.</span>
				</p>
			</div>
		</div>
	</div>
	<%@ include file="/hotel_Ulsan/ulsan_footer.jsp"%>
</body>
</html>