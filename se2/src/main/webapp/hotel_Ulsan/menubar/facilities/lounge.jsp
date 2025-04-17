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
				<li><a href="/se2/hotel_Ulsan/menubar/facilities/lounge.jsp"><strong>라운지</strong></a></li>
				<li><a href="/se2/hotel_Ulsan/menubar/facilities/wedding.jsp">웨딩홀</a></li>
				<li><a href="/se2/hotel_Ulsan/menubar/facilities/fitness.jsp">피트니스 센터</a></li>
				<li><a href="/se2/hotel_Ulsan/menubar/facilities/view_All.jsp">전체 부대시설 보기</a></li>
			</ul>
		</section>

		<!-- 소개본문 -->
		<!-- sidebar 다음에 들어가는 중앙 콘텐츠 -->
		<div class="room-content">
			<div class="room-content-inner">
				<h2 class="room-title">모노그램 라운지</h2>

				<div class="room-visual-wrap">
					<div class="room-main-image">
						<img src="/se2/gallery/img/ulsan/facilities/U_Lounge2.png" alt="라운지 이미지">
					</div>
					<div class="room-side-info">
					<br>
						<ul>
							<li><strong>위치</strong>&ensp;헬리아 울산 3층</li>
							<li><strong>운영시간</strong>&ensp;09:00 ~ 22:00 (애프터눈티:14:30 ~ 16:00, 이브닝 서비스: 17:30 ~ 19:00 )</li>
						</ul>
					</div>
				</div>

				<p class="room-description">
					<span class="desc-title">다양한 로컬 문화 경험을 제공하는 라이프스타일 리딩 라운지</span><br> <span
						class="desc-strong">다과</span>와 함께 현지의 문화를 경험할 수 있고,<br>
					<br>체크아웃 이후에도 편안하게 이용 가능한, <span
						class="desc-strong">헬리아</span> 울산의 대표적인 공간입니다.
					<br> <span class="desc-phone">문의전화</span> <span
						class="desc-number">02-2308-9000</span><br>
					<br> <span class="desc-note"><strong>유의사항</strong><br>
					&#42;드레스 코드: 스마트 캐주얼 (배스 로브 또는 수영복 착용 시 이용이 제한됩니다)
					<br>&#42;본 리딩 라운지는 코너 스위트 객실 이상 투숙 시 무료로 이용 가능 합니다.
					<br>&#42;1회 이용권 구매를 원하실 경우, 프런트 데스크에 문의해 주시기 바랍니다.
					<br>&#42;12세 이하 어린이는 보호자 동반 시 입장 가능하며 보호자께서는 안전한 이용을 위해 세심한 보호를 부탁드립니다.
					<br>&#42;본 리딩 라운지는 투숙 중 이용 가능하며, 체크아웃 당일 오후 2시까지 이용하실 수 있습니다.
					<br>&#42;라운지 내 보드게임 및 도서등 이용을 원하실 경우, 프런트 데스크에 문의하여 주시기 바랍니다.
					</span>
				</p>
			</div>
		</div>
	</div>
	<%@ include file="/hotel_Ulsan/ulsan_footer.jsp"%>
</body>
</html>