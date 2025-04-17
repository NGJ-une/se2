<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Insert title here</title>
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
				<li><a href="/se2/hotel_Seoul/menubar/facilities/business.jsp"><strong>비즈니스룸</strong></a></li>
				<li><a href="/se2/hotel_Seoul/menubar/facilities/lounge.jsp">연회장</a></li>
				<li><a href="/se2/hotel_Seoul/menubar/facilities/wedding.jsp">리딩룸</a></li>
				<li><a href="/se2/hotel_Seoul/menubar/facilities/fitness.jsp">피트니스 센터</a></li>
				<li><a href="/se2/hotel_Seoul/menubar/facilities/view_All.jsp">전체 부대시설 보기</a></li>
			</ul>
		</section>

		<!-- 소개본문 -->
		<!-- sidebar 다음에 들어가는 중앙 콘텐츠 -->
		<div class="room-content">
			<div class="room-content-inner">
				<h2 class="room-title">비즈니스 룸</h2>

				<div class="room-visual-wrap">
					<div class="room-main-image">
						<img src="/se2/gallery/img/seoul/facilities/S_Boardroom.png" alt="비즈니스룸 이미지">
					</div>
					<div class="room-side-info">
					<br>
						<ul>
							<li><strong>위치</strong>&ensp;헬라서울 1층</li>
							<li><strong>운영시간</strong>&ensp;24시간 가능</li>
							<li><strong>좌석수</strong>&ensp;컴퓨터 10대 / 프린터 2대 / 좌석 100개</li>
						</ul>
					</div>
				</div>

				<p class="room-description">
					<span class="desc-title">헬리아 서울에서 편리한 비즈니스 코너를 이용하실 수 있습니다.</span><br> <span
						class="desc-strong">인터넷</span> 등 컴퓨터 이용이 필요하시다면, <br>
					<br>비즈니스 코너의 컴퓨터를 무료료 이용 하십니시오.<br> <span
						class="desc-strong">감각적인 디자인</span>의  Communal Table에서는 간단한 업무 뿐 아니라, <br>나만의 여유로운 시간을 가질 수 있습니다.<br>
					<br> <span class="desc-phone">문의전화</span> <span
						class="desc-number">02-2308-9000</span><br>
					<br> <span class="desc-note"></span>
				</p>
			</div>
		</div>
	</div>
	<%@ include file="/hotel_Seoul/seoul_footer.jsp"%>
</body>
</html>