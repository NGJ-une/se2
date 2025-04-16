<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HELIA 서울</title>
<link
	href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/se2/hotel_Ulsan/css/main.body_page.css">
<script src="/se2/indexJS_head.js"></script>
</head>
<body class="main-page">
	<%@include file="/hotel_Ulsan/ulsan_header.jsp"%>

	<section class="section1">
		<article>
			<div class="slider">
				<div class="slide active">
					<img src="/se2/gallery/img/ulsan/other/U_Other1.png" alt="h1">
					<div class="slide-caption fixed-bottom-left">
						<h2>Timeless Serenity by the Sea</h2>
						<p>바다와 정원이 어우러진 고요한 안식</p>
						<p>로맨틱 디너 & 가든 산책 코스 제공</p>
					</div>
				</div>
				<div class="slide">
					<img src="/se2/gallery/img/ulsan/other/U_showPool.png" alt="h2">
					<div class="slide-caption fixed-bottom-left">
						<h2>Where Memories Bloom</h2>
						<p>기억에 남을 소중한 하루를 선물하세요</p>
						<p>도보 거리 명소 투어 & 오션뷰 레스토랑</p>
					</div>
				</div>
				<div class="slide">
					<img src="/se2/gallery/img/ulsan/other/U_Lobby2.png" alt="h3">
					<div class="slide-caption fixed-bottom-left">
						<h2>Tranquility Beyond the Horizon</h2>
						<p>하늘과 맞닿은 수영장에서의 깊은 휴식</p>
						<p>야경 속 쇼풀 & 풀사이드 바 운영 중</p>
					</div>
				</div>
				<div class="slide">
					<img src="/se2/gallery/img/ulsan/other/U_Information.png" alt="h4">
					<div class="slide-caption fixed-bottom-left">
						<h2>Awaken in Sophistication</h2>
						<p>서울의 아침을 감각적으로 맞이하다</p>
						<p>시티뷰 조식 & 이브닝 칵테일 포함</p>
					</div>
				</div>
				<div class="slide">
					<img src="/se2/gallery/img/ulsan/other/U_Other2.png" alt="h5">
					<div class="slide-caption fixed-bottom-left">
						<h2>Romance Painted in Sunset</h2>
						<p>노을 아래 펼쳐지는 황홀한 한밤의 무드</p>
						<p>루프탑 재즈 & 프라이빗 테이블 예약</p>
					</div>
				</div>
				<div class="slide">
					<img src="/se2/gallery/img/ulsan/other/U_beachgarden.jpg"
						alt="h6">
					<div class="slide-caption fixed-bottom-left">
						<h2>Art Meets Architecture</h2>
						<p>예술과 공간이 조화를 이루는 특별한 경험</p>
						<p>프라이빗 아트룸 & 감성 수영장 운영</p>
					</div>
				</div>
				<div class="slide">
					<img src="/se2/gallery/img/ulsan/other/U_Garden.png"
						alt="h7">
					<div class="slide-caption fixed-bottom-left">
						<h2>Inspiration in Every Corner</h2>
						<p>영감을 자극하는 감성 공간</p>
						<p>북 라운지 & 24시간 컨시어지 서비스</p>
					</div>
				</div>
				<div class="slide">
					<img src="/se2/gallery/img/ulsan/facilities/U_Wedding.png" alt="h8">
					<div class="slide-caption fixed-bottom-left">
						<h2>Luxury, Thoughtfully Defined</h2>
						<p>세심한 디테일이 만들어낸 진정한 럭셔리</p>
						<p>스위트 전용 프라이빗 키트 제공</p>
					</div>
				</div>
				<div class="slide">
					<img src="/se2/gallery/img/ulsan/facilities/U_Lounge2.png" alt="h9">
					<div class="slide-caption fixed-bottom-left">
						<h2>Escape Within the City</h2>
						<p>도심 속 완벽한 쉼, 헬리아 호텔</p>
						<p>럭셔리 다이닝 & 루프탑 스파 프로그램</p>
					</div>
				</div>
				<button class="prev" onclick="changeSlide(-1)">&#10094;</button>
				<button class="next" onclick="changeSlide(1)">&#10095;</button>
			</div>
		</article>
	</section>

	<div class="scaled-content">
	<div class="inner-scaled">
		<section class="section5">
			<article>
				<div class="reservation-box">
					<form class="reservation-form"
						action="/se2/main/hotelReser/hotelReser.jsp">
						<!-- 호텔/도시 -->
						<div class="reservation-item hotel-city">
							<label>호텔 또는 도시</label>
							<div class="input-wrapper">
								<select name="name" class="region-select">
									<option value="h_seoul">서울</option>
									<option value="h_ulsan">울산</option>
								</select> <span class="icon-search">🔍</span>
							</div>
						</div>

						<!-- 체크인 -->
						<div class="reservation-item date-item">
							<label>체크인</label> <input class="value" type="date"
								name="checkIn" id="checkIn" required>
						</div>

						<!-- 체크아웃 -->
						<div class="reservation-item date-item">
							<label>체크아웃</label> <input class="value" type="date"
								name="checkOut" id="checkOut" required>
						</div>

						<!-- 숙박일수 -->
						<div class="reservation-item">
							<label><img src="/se2/css/img/icon_MOON.png"></label>
							<div class="value">1박</div>
						</div>

						<!-- 객실 -->
						<div class="reservation-item">
							<label>객실</label>
							<div class="value">1</div>
						</div>

						<!-- 성인 -->
						<div class="reservation-item">
							<label>성인</label> <input class="value" type="number" name="adult"
								value="2" min="1" max="6" required>
						</div>

						<!-- 어린이 -->
						<div class="reservation-item">
							<label> 어린이 <span class="tooltip">ⓘ <span
									class="tooltip-text">37개월 이상 ~ 만 12세 이하<br>(베트남: 만
										6세 이상 ~ 만 11세까지)
								</span>
							</span>
							</label> <input class="value" type="number" name="kid" value="0" min="0"
								max="5" required>
						</div>

						<!-- 유아 -->
						<div class="reservation-item">
							<label> 유아 <span class="tooltip">ⓘ <span
									class="tooltip-text">36개월 이하<br>(베트남: 만 5세 이하)
								</span>
							</span>
							</label> <input class="value" type="number" name="baby" value="0" min="0"
								max="5" required>
						</div>

						<!-- 검색 버튼 -->
						<div class="btn-search-wrapper">
							<input class="btn-search" type="submit" value="검색">
						</div>
					</form>
				</div>
			</article>
		</section>
		
		<!-- 예약 유도 CTA -->
		<section class="section-cta">
		  <h2>HELIA SEOUL에서 특별한 하루를</h2>
		  <a class="btn-cta" href="/se2/main/hotelReser/hotelReser.jsp">지금 예약하기</a>
		</section>
		
		<!-- 서울 지점 전용 혜택 -->
		<section class="section-offers">
		  <h2>스페셜 오퍼</h2>
		  <p class="subtitle">SPECIAL OFFERS</p>
		  <div class="offers-grid">
		    <div class="offer large">
		      <img src="/se2/gallery/img/seoul/room/S_S3.jpg" alt="Spring Hocance" />
		      <div class="offer-info">
		        <p>제주신라호텔</p>
		        <h3>Spring Hocance</h3>
		        <span>2025.04.08 ~ 2025.04.30</span>
		      </div>
		    </div>
		    <div class="offer">
		      <img src="/se2/gallery/img/seoul/other/city.png" alt="Charming Vietnam" />
		      <div class="offer-info">
		        <p>다낭</p>
		        <h3>Charming Vietnam</h3>
		        <span>2025.04.01 ~ 2026.02.28</span>
		      </div>
		    </div>
		    <div class="offer">
		      <img src="/se2/gallery/img/seoul/room/S_ST2.jpg" alt="Mixology Escape" />
		      <div class="offer-info">
		        <p>서울신라호텔</p>
		        <h3>Mixology Escape</h3>
		        <span>2025.04.15 ~ 2025.06.30</span>
		      </div>
		    </div>
		    <div class="offer">
		      <img src="/se2/gallery/img/seoul/room/S_S4.jpg" alt="Spring Flora Bear" />
		      <div class="offer-info">
		        <p>신라스테이</p>
		        <h3>Spring Flora Bear</h3>
		        <span>2025.03.10 ~ 2025.06.01</span>
		      </div>
		    </div>
		    <div class="offer">
		      <img src="/se2/gallery/img/seoul/room/S_G2.jpg" alt="신규 가입 이벤트" />
		      <div class="offer-info">
		        <p>신라리워즈</p>
		        <h3>신규 가입 이벤트</h3>
		        <span>2025.04.01 ~ 2025.06.30</span>
		      </div>
		    </div>
		  </div>
		</section>
		
		<!-- 주변 관광지 -->
		<section class="section-nearby">
		  <h2>주변 관광지</h2>
		  <div class="nearby-cards">
		    <div class="card">
		      <img src="/se2/gallery/img/seoul/other/spot1.jpg" alt="남산타워">
		      <p>남산타워 도보 15분</p>
		    </div>
		    <div class="card">
		      <img src="/se2/gallery/img/seoul/other/spot2.jpg" alt="명동">
		      <p>명동 쇼핑거리 3분 거리</p>
		    </div>
		    <div class="card">
		      <img src="/se2/gallery/img/seoul/other/spot3.jpg" alt="경복궁">
		      <p>경복궁 차량 15분 거리</p>
		    </div>
		  </div>
		</section>
		
				<!-- 오시는 길 -->
		<section class="section-directions">
		  <h2>오시는 길</h2>
		  <p>서울특별시 중구 명동로 123</p>
		  <p>지하철 명동역 6번 출구 도보 3분 거리</p>
		  <div class="map-wrap">
		    <iframe src="https://www.google.com/maps/embed?pb=..."
		            width="100%" height="350" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
		  </div>
		</section>
	</div>	<!--  inner-scaled 닫는 div -->
	</div> <!-- scaled-content 닫는 div -->
	
<%@include file="/hotel_Ulsan/ulsan_footer.jsp"%>
<script src="/se2/indexJS_body.js"></script>
</body>
</html>