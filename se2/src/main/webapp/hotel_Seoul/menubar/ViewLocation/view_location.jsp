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
				<li><a href="/se2/hotel_Seoul/menubar/ViewLocation/view_location.jsp"><strong>헬리아 호텔 서울</strong></a></li>
				<li><a href="/se2/hotel_Ulsan/menubar/ViewLocation/view_location.jsp">헬리아 호텔 울산</a></li>
			</ul>
		</section>

		<!-- 소개본문 -->
		<!-- sidebar 다음에 들어가는 중앙 콘텐츠 -->
		<div class="room-content">
			<div class="room-content-inner">
				<h2 class="room-title">헬리아 호텔 서울</h2>

				<div class="room-visual-wrap">
					<div class="room-main-image">
						<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3022.2901454184985!2d-73.97612382332608!3d40.755642771387116!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c2595b7381bd11%3A0x354857268d76d20f!2zMTExIEUgNDh0aCBTdCwgTmV3IFlvcmssIE5ZIDEwMDE3IOuvuOq1rQ!5e0!3m2!1sko!2skr!4v1744639617409!5m2!1sko!2skr" width="100%" height="600"></iframe>
					</div>
					<div class="room-side-info">
					<br>
						<ul>
							<li><strong>개관일</strong>&ensp;2020년 7월 7일</li>
							<li><strong>대표전화</strong>&ensp;+84-123-5511-4844</li>
							<li><strong>부지면적</strong>&ensp;전체 53,908m, 호텔 19,000m</li>
							<li><strong>객실수</strong>&ensp;309실</li>
							<li><strong>레스토랑</strong>&ensp;다이닝 M, 비스트로 M, 바 M, 풀바</li>
							<li><strong>부대시설</strong>&ensp;대형 연회장 1개, 미팅룸 3개, 야외 수영장, 테라피 가든, 카바나, 실내체육관, 사우나, 모노그램 라운지, 비즈니스 코너, 리틀 모노그램, 액티비티 스튜디오</li>
							<li><strong>교통안내</strong>&ensp;서울국제공항으로부터 택시 이용 시 약 40분 소요(17km)</li>
							<li><strong>주변명소</strong>&ensp;오행산, 미선유적지, 선짜산, 용교, 호이안</li>
						</ul>
					</div>
				</div>

				<p class="room-description">
					<span class="desc-title">HELIA HOTEL SEOUL </span><br> <span
						class="desc-strong">주소 </span>111 East 48th Street, New York, NY 10017-1297<br>
					<span
						class="desc-strong"></span>
					<br> <span class="desc-phone">문의전화</span> <span
						class="desc-number">02-2308-9107~8</span><br>
					<br> <span class="desc-note">&#42;교통편 
					<br>공항에서 택시 이용시 약 40분 소요 (17km)
					<br>&#42;공항 픽업 & 센딩 서비스
					<br>픽업 & 센딩 서비스는 컨시어지로 문의해주시길 바랍니다.(concierge@seoul.heliahotel.ccm)
					</span>
				</p>
			</div>
		</div>
	</div>
	<%@ include file="/hotel_Seoul/seoul_footer.jsp"%>
</body>
</html>