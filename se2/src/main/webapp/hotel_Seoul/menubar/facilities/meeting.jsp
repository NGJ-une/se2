<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
				<li><a href="/se2/hotel_Seoul/menubar/facilities/meeting.jsp"><strong>미팅룸</strong></a></li>
				<li><a href="/se2/hotel_Seoul/menubar/facilities/business.jsp">비즈니스룸</a></li>
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
				<h2 class="room-title">미팅룸</h2>

				<div class="room-visual-wrap">
					<div class="room-main-image">
						<img src="/se2/gallery/img/seoul/facilities/S_Retiring_Room.png" alt="미팅룸 이미지">
					</div>
					<div class="room-side-info">
					<br>
						<ul>
							<li><strong>위치</strong>&ensp;헬라서울 5층</li>
							<li><strong>운영시간</strong>&ensp;18시 이전 : 4시간, 8시간 단위 이용, All Day: 종일 이용 (09:00~22:00)</li>
							<li><strong>좌석수</strong>&ensp;의자 16개, Wedding, Cocktail Reception, Meeting 서비스 (사전예약 필요) </li>
						</ul>
					</div>
				</div>

				<p class="room-description">
					<span class="desc-title">비즈니스 미팅</span><br>에  <span
						class="desc-strong">최적화된 시설과 서비스</span>로 다양한 회의를 성공적으로
					<br>진행할 수 있어 비즈니스 여행객의 만족을 더합니다.<br> <span
						class="desc-strong"></span>비즈니스 미팅룸에서는 간단한 업무 뿐 아니라, <br>나만의 여유로운 시간을 가질 수 있습니다.<br>
					<br> <span class="desc-phone">문의전화</span> <span
						class="desc-number">02-2308-9000</span><br>
					<br> <span class="desc-note">시설(AV포함)
					<br>&#42;LCD프로젝터 및 스크린
					<br>&#42;유무선 인터넷 접속 환경
					<br>&#42;음향 장비 시설</span>
				</p>
			</div>
		</div>
	</div>
	<%@ include file="/hotel_Seoul/seoul_footer.jsp"%>
</body>
</html>