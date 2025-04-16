<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/se2/css/sideBar.css">
<link rel="stylesheet" type="text/css"
	href="/se2/hotel_Seoul/menubar/css/commons.css">
</head>
<body>
	<%@include file="/hotel_Seoul/seoul_header.jsp"%>

	<div class="container">
		<!-- 왼쪽 사이드바 -->
		<section class="box1">
			<div class="sidebar">HELIA SEOUL GALLERY</div>
			<hr>
			<ul>
				<li><a href="/se2/hotel_Seoul/menubar/facilities/meeting.jsp">미팅룸</a></li>
				<li><a href="/se2/hotel_Seoul/menubar/facilities/business.jsp">비즈니스룸</a></li>
				<li><a href="/se2/hotel_Seoul/menubar/facilities/lounge.jsp">연회장</a></li>
				<li><a href="/se2/hotel_Seoul/menubar/facilities/wedding.jsp">리딩룸</a></li>
				<li><a href="/se2/hotel_Seoul/menubar/facilities/fitness.jsp"><strong>피트니스 센터</strong></a></li>
				<li><a href="/se2/hotel_Seoul/menubar/facilities/view_All.jsp">전체 부대시설 보기</a></li>
			</ul>
		</section>

		<!-- 소개본문 -->
		<!-- sidebar 다음에 들어가는 중앙 콘텐츠 -->
		<div class="room-content">
			<div class="room-content-inner">
				<h2 class="room-title">피트니스 센터</h2>

				<div class="room-visual-wrap">
					<div class="room-main-image">
						<img src="/se2/gallery/img/seoul/facilities/S_Fitness1.png" alt="피트니스 센터 이미지">
					</div>
					<div class="room-side-info">
					<br>
						<ul>
							<li><strong>위치</strong>&ensp;헬라서울 2층</li>
							<li><strong>운영시간</strong>&ensp;06:00 ~ 23:00</li>
							<li><strong>시설안내</strong>&ensp;트레드밀 5대, 사이클 5대, 근력운동머신 9종,복근 전용기구 1대, 덤벨세트, 일립티컬 1대</li>
						</ul>
					</div>
				</div>

				<p class="room-description">
					<span class="desc-title">전문 운동 기구</span>
					 <span
						class="desc-strong">를 갖춘 헬리아 피트니스 센터에서 몸과 마음을 재충전 하십시오.</span><br>
					 <span class="desc-strong"></span>
					<br> <span class="desc-phone">문의전화</span> <span
						class="desc-number">02-2308-9090</span><br>
					<br> <span class="desc-note">투숙객 무료 이용 (안전상의 이유로 16세 이상 입장 가능합니다)
					<br>&#42;운영시간 및 방침은 호텔 사정에 의해 사전 고지없이 변경될 수 있습니다.
					<br>&#42;운동복 및 운동화는 개인 지참 후 이용 부탁드립니다.</span>
				</p>
			</div>
		</div>
	</div>
	<%@ include file="/hotel_Seoul/seoul_footer.jsp"%>
</body>
</html>