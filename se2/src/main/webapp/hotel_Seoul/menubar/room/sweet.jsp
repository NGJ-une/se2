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
				<li><a href="/se2/hotel_Seoul/menubar/room/standard.jsp">스탠다드</a></li>
				<li><a href="/se2/hotel_Seoul/menubar/room/deluxe.jsp">디럭스</a></li>
				<li><a href="/se2/hotel_Seoul/menubar/room/sweet.jsp"><strong>스위트</strong></a></li>
				<li><a href="/se2/hotel_Seoul/menubar/room/grand.jsp">그랜드</a></li>
				<li><a href="/se2/hotel_Seoul/menubar/room/view_All.jsp">전체객실보기</a></li>
			</ul>
		</section>

		<!-- 소개본문 -->
		<!-- sidebar 다음에 들어가는 중앙 콘텐츠 -->
		<div class="room-content">
			<div class="room-content-inner">
				<h2 class="room-title">디럭스</h2>

				<div class="room-visual-wrap">
					<div class="room-main-image">
						<img src="/se2/gallery/img/seoul/room/S_S.jpg" alt="스탠다드 룸 이미지">
					</div>
					<div class="room-side-info">
						<h4>객실이용</h4>
						<ul>
							<li>40"LED TV(36채널)</li>
							<li>책상</li>
							<li>냉장고</li>
							<li>무료커피,티백</li>
							<li>2개의목욕가운</li>
							<li>무료 생수 2변(1박 기준)</li>
							<li>무료 유무선 인터넷</li>
							<li>유니버셜 어댑터(220V 전용)</li>
							<li>욕실 내 고급 어메니티 비치</li>
							<li>개별 냉난방 시스템</li>
							<li>객실 내 금고 / 미니바</li>
						</ul>
					</div>
				</div>

				<p class="room-description">
					<span class="desc-title">고층에 위치한 프리미어 스위트룸은</span><br> <span
						class="desc-strong">미니바가 포함되어 있어 보다 편안하게 이용</span>하실 수 있는 객실 입니다.<br>
					<br> 모던한 아름다움과 헬라호텔 수준의 고급 침구 및 침대,<br> 그리고 <span
						class="desc-strong">고급 어메니티로 한 단계 업그레이드된 휴식</span>을 경험하실 수 있습니다.<br>
					<br> <span class="desc-phone">문의전화</span> <span
						class="desc-number">02-2230-0700</span><br>
					<br> <span class="desc-note">모든 객실과 레스토랑에서 유무선 인터넷 연결이
						가능합니다.</span>
				</p>

				<div class="room-info-table">
					<p>
						<strong>위치</strong>: 19 ~ 26층<br> <strong>전망</strong>: 시티 뷰<br>
						<strong>침대</strong>: 더블, 트윈, 패밀리 트윈<br> <strong>크기</strong>:
						21.7㎡<br> <strong>구성</strong>: 침실 1, 욕실 1
					</p>
				</div>

				<div class="room-buttons">
					<a href="#" class="btn">객실 어메니티 보기</a> <a href="#" class="btn">도면보기</a>
					<a href="#" class="btn">문의하기</a> <a href="#" class="btn">예약하기</a>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/hotel_Seoul/seoul_footer.jsp"%>
</body>
</html>