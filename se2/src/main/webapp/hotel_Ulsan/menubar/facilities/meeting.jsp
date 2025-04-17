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
				<li><a href="/se2/hotel_Ulsan/menubar/facilities/meeting.jsp"><strong>수영장</strong></a></li>
				<li><a href="/se2/hotel_Ulsan/menubar/facilities/business.jsp">비즈니스룸</a></li>
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
				<h2 class="room-title">수영장</h2>

				<div class="room-visual-wrap">
					<div class="room-main-image">
						<img src="/se2/gallery/img/ulsan/facilities/U_SecretPool.jpg" alt="수영장 이미지">
					</div>
					<div class="room-side-info">
					<br>
						<ul>
							<li><strong>위치</strong>&ensp;헬리아 울산 별관 1층</li>
							<li><strong>운영시간</strong>&ensp;샌드 & 유아 풀, 키즈 풀 (07:00~19:00) <br> 어덜트풀, 패밀리풀 (07:00~22:00) <br>수심 각 0.3m, 0.8m, 1.2m </li>
							<li><strong>유의사항</strong>&ensp;&#176;&ensp;어린이 동반 고객께서는 안전한 시설 이용을 위해 세심한 주의를 부탁드립니다
							<br>&#176;&ensp;고객 여러분의 안전을 위하여 야회 수영장 이용 규정을 준수해 주시기 바라며, 주변 고객에게 불편을 주는 행위는 삼가 주시길 바랍니다.</li>
						</ul>
					</div>
				</div>

				<p class="room-description">
					<span class="desc-title">따사로운 햇살 아래 여유로운 휴식</span><br>끝없이 <span
						class="desc-strong">펼쳐지는 수평선</span>을 바라보며 프라이빗하고,
					<br>여유로운 휴식을 즐기실 수 있습니다. <span
						class="desc-strong"></span><br>
					<br> <span class="desc-phone">문의전화</span> <span
						class="desc-number">02-2308-0088</span><br>
					<br> <span class="desc-note">운영방침 
					<br>&#42;야외 수영장은 투숙객 전용 시설이며 어덜트 풀은 만 19세 이상 고객만 입장 및 이용이 가능합니다.
					<br>&#42;쾌적하고 안전한 운영을 위해 적정 인원 초과 시 이용을 위해 대기하실 수 있습니다
					<br>&#42;야외 수영장의 모든 지역은 금연구역입니다
					<br><br>안전
					<br>&#42;다이빙은 금지되어 있습니다.
					<br>&#42;물에 들어가기전 반드시 준비운동을 해주시기 바랍니다.
					<br>&#42;금속, 플라스틱, 유리제품등 날카롭거나 깨질 수 있는 물건의 반입을 금합니다.
					<br>&#42;강우 및 강품과 같은 기상 상황에 따라 이용이 제한될 수 있습니다.
					<br>&#42;눈병, 피부병 및 기타 감영성 질환 등 공중 위생에 영향을 미치는 환자는 이용할 수 없습니다.
					<br><br>촬영
					<br>&#42;상업적 목적의 촬영 시 이용이 제한될 수 있습니다.
					<br>&#42;휴대전화를 포함한 촬영 장비로 풀장 내 수중 촬영은 불가합니다.
					<br>&#42;다른 고객에게 불편을 주는 지나친 촬영은 제재할 수 있으니 아에 협초 바랍니다.
					</span>
				</p>
			</div>
		</div>
	</div>
	<%@ include file="/hotel_Ulsan/ulsan_footer.jsp"%>
</body>
</html>