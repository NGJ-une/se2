<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hotel.index.*" %>
<jsp:useBean id="idao" class="com.hotel.index.indexDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- SEO 핵심: 제목 -->
<title>HELIA 호텔 - 서울, 울산 전 지점 예약 | 공식 예약 사이트</title>
<!-- SEO 핵심: 검색 설명 -->
<meta name="description" content="HELIA 호텔 공식 예약 사이트. 서울, 울산 등 전국 지점 럭셔리 숙박 제공. 회원 등급에 따른 리워즈 혜택까지 누리세요.">
  
<link rel="stylesheet" type="text/css" href="/se2/css/body.main-page.css">
<link rel="stylesheet" type="text/css" href="/se2/css/commonsLayout.css">
<script src="/se2/indexJS_head.js"></script>
</head>
<body class="main-page">
<%@include file="/header.jsp" %>
    <section class="section1">
        <article>
            <div class="slider">
             <div class="slide active">
			    <img src="/se2/gallery/img/ulsan/other/U_beachgarden.jpg" alt="h1">
			    <div class="slide-caption fixed-bottom-left">
					<h2>Timeless Serenity by the Sea</h2>
					<p>바다와 정원이 어우러진 고요한 안식</p>
					<p>로맨틱 디너 & 가든 산책 코스 제공</p>
			    </div>
			  </div>
			  <div class="slide">
			    <img src="/se2/gallery/img/seoul/other/LocalArea.png" alt="h2">
			    <div class="slide-caption fixed-bottom-left">
					<h2>Where Memories Bloom</h2>
					<p>기억에 남을 소중한 하루를 선물하세요</p>
					<p>도보 거리 명소 투어 & 오션뷰 레스토랑</p>
			    </div>
			  </div>
			  <div class="slide">
			    <img src="/se2/gallery/img/ulsan/other/U_showPool.png" alt="h3">
			    <div class="slide-caption fixed-bottom-left">
					<h2>Tranquility Beyond the Horizon</h2>
					<p>하늘과 맞닿은 수영장에서의 깊은 휴식</p>
					<p>야경 속 쇼풀 & 풀사이드 바 운영 중</p>
			    </div>
			  </div>
			  <div class="slide">
			    <img src="/se2/gallery/img/seoul/dining/S_bar2.png" alt="h4">
			    <div class="slide-caption fixed-bottom-left">
					<h2>Awaken in Sophistication</h2>
					<p>서울의 아침을 감각적으로 맞이하다</p>
					<p>시티뷰 조식 & 이브닝 칵테일 포함</p>
			    </div>
			  </div>
			  <div class="slide">
			    <img src="/se2/gallery/img/ulsan/room/U_ST.jpg" alt="h5">
			    <div class="slide-caption fixed-bottom-left">
					<h2>Romance Painted in Sunset</h2>
					<p>노을 아래 펼쳐지는 황홀한 한밤의 무드</p>
					<p>루프탑 재즈 & 프라이빗 테이블 예약</p>
			    </div>
			  </div>
			  <div class="slide">
			    <img src="/se2/gallery/img/ulsan/facilities/U_SecretPool.jpg" alt="h6">
			    <div class="slide-caption fixed-bottom-left">
					<h2>Art Meets Architecture</h2>
					<p>예술과 공간이 조화를 이루는 특별한 경험</p>
					<p>프라이빗 아트룸 & 감성 수영장 운영</p>
			    </div>
			  </div>
			  <div class="slide">
			    <img src="/se2/gallery/img/seoul/facilities/S_Reading_Room.png" alt="h7">
			    <div class="slide-caption fixed-bottom-left">
					<h2>Inspiration in Every Corner</h2>
					<p>영감을 자극하는 감성 공간</p>
					<p>북 라운지 & 24시간 컨시어지 서비스</p>	
			    </div>
			  </div>
			  <div class="slide">
			    <img src="/se2/gallery/img/seoul/room/S_G4.jpg" alt="h8">
			    <div class="slide-caption fixed-bottom-left">
					<h2>Luxury, Thoughtfully Defined</h2>
					<p>세심한 디테일이 만들어낸 진정한 럭셔리</p>
					<p>스위트 전용 프라이빗 키트 제공</p>
			    </div>
			  </div>
			  <div class="slide">
			    <img src="/se2/gallery/img/ulsan/dining/U_Restaurant2.png" alt="h9">
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
    <section class="section5">
  <article>
    <div class="reservation-box">
      <form class="reservation-form" action="/se2/main/hotelReser/hotelReser.jsp">
        <!-- 호텔/도시 -->
        <div class="reservation-item hotel-city">
          <label>호텔 또는 도시</label>
          <div class="input-wrapper">
            <select name="name" class="region-select">
				<option value="h_seoul">서울</option>
				<option value="h_ulsan">울산</option>
            </select>
            <span class="icon-search">🔍</span>
          </div>
        </div>

        <!-- 체크인 -->
        <div class="reservation-item date-item">
          <label>체크인</label>
          <input class="value" type="date" name="checkIn" id="checkIn" required>
        </div>

        <!-- 체크아웃 -->
        <div class="reservation-item date-item">
          <label>체크아웃</label>
          <input class="value" type="date" name="checkOut" id="checkOut" required>
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
          <label>성인</label>
          <input class="value" type="number" name="adult" value="2" min="1" max="6" required>
        </div>

        <!-- 어린이 -->
        <div class="reservation-item">
          <label>
            어린이
            <span class="tooltip">ⓘ
              <span class="tooltip-text">37개월 이상 ~ 만 12세 이하<br>(베트남: 만 6세 이상 ~ 만 11세까지)</span>
            </span>
          </label>
          <input class="value" type="number" name="kid" value="0" min="0" max="5" required>
        </div>

        <!-- 유아 -->
        <div class="reservation-item">
          <label>
            유아
            <span class="tooltip">ⓘ
              <span class="tooltip-text">36개월 이하<br>(베트남: 만 5세 이하)</span>
            </span>
          </label>
          <input class="value" type="number" name="baby" value="0" min="0" max="5" required>
        </div>

        <!-- 검색 버튼 -->
		<div class="btn-search-wrapper">
		  <input class="btn-search" type="submit" value="검색">
		</div>
      </form>
    </div>
  </article>
</section>
    <% if(sid==null||"".equals(sid)){%>
    
    <% } else { %>
    <section class="section3">
        <article>
	        <div class="wrapper">
	        	<% 
	        	indexDTO dto = idao.indexshow(sid);
	        	if(dto.getNow_grade().equals("BRONZE")){
	            %><h2>BRONZE<img src="/se2/css/img/icon_BRONZE.png">&nbsp;<%=sid %> 님 환영합니다</h2><%
	        	}else if(dto.getNow_grade().equals("SILVER")){
	            %><h2>SILVER<img src="/se2/css/img/icon_SILVER.png">&nbsp;<%=sid %> 님 환영합니다</h2><%
	        	}else if(dto.getNow_grade().equals("GOLD")){
	            %><h2>GOLD<img src="/se2/css/img/icon_GOLD.png">&nbsp;<%=sid %> 님 환영합니다</h2><%
	        	}else if(dto.getNow_grade().equals("DIAMOND")){
	            %><h2>DIAMOND<img src="/se2/css/img/icon_DIAMOND.png">&nbsp;<%=sid %> 님 환영합니다</h2><%
	        	}
	       		%>
	            <table class="table-grade">
	                <tr>
	                    <td>미사용포인트</td>
	                    <td>할인율</td>
	                    <td>총 예약건수</td>
	                    <td>총 사용금액</td>
	                </tr>
	                <tr>
	                    <td><%=dto.getUnu_point() %>원</td>
	                    <td><%=dto.getNow_discount() %> %</td>
	                    <td><%=dto.getTotal_reser() %>건</td>
	                    <td><%=dto.getTotal_point() %>원</td>
	                </tr>
	                <tr>
	                <%
	                if(dto.getNow_grade().equals("BRONZE")){
                    %><td colspan="4"><img src="/se2/css/img/icon_SILVER.png">SILVER 등급까지 <%=dto.getRemain_grade() %> 포인트 남았습니다</td><%
	                }else if(dto.getNow_grade().equals("SILVER")){
                    %><td colspan="4"><img src="/se2/css/img/icon_GOLD.png">GOLD 등급까지 <%=dto.getRemain_grade() %> 포인트 남았습니다</td><%
	                }else if(dto.getNow_grade().equals("GOLD")){
                    %><td colspan="4"><img src="/se2/css/img/icon_DIAMOND.png">DIAMOND까찌 <%=dto.getRemain_grade() %> 포인트 남았습니다</td><%
	                }else if(dto.getNow_grade().equals("DIAMOND")){
                    %><td colspan="4"><img src="/se2/css/img/icon_DIAMOND.png">축하드립니다 최고등급 입니다</td><%
	                }
	                %>
	                </tr>
	            </table> 
	         </div> 
        </article>
    </section>
    <% } %>
    
    <!-- -------------------------------------------------------------- -->
    
    <!-- 고객 후기 슬라이드 -->
   <section class="section7">
    
	<section class="review-carousel">
	  <h3>고객 후기</h3>
	  <div class="reviews">
	    <div class="review">
	      <p>"최고의 서비스, 다음에도 꼭 방문할 거예요!"</p>
	      <span>- 김지은 님</span>
	    </div>
	    <div class="review">
	      <p>"청결하고 조용한 분위기가 좋았어요."</p>
	      <span>- 박현수 님</span>
	    </div>
	  </div>
	</section>
	
	<!-- 추천 객실 미리보기 -->
	<section class="room-preview">
	  <h3>추천 객실</h3>
	  <div class="room-grid">
	    <!-- 1. 스위트룸 -->
		<div class="room-card">
		  <img src="/se2/gallery/img/seoul/room/S_G2.jpg" alt="서울 스위트룸">
		  <div class="room-info">
		    <h4>스위트룸</h4>
		    <p>넓은 공간과 섬세한 디테일이 어우러진 프라이빗 럭셔리</p>
		  </div>
		</div>
		
		<!-- 2. 프리미엄룸 -->
		<div class="room-card">
		  <img src="/se2/gallery/img/ulsan/room/U_ST.jpg" alt="울산 프리미엄룸">
		  <div class="room-info">
		    <h4>프리미엄룸</h4>
		    <p>창밖 노을과 함께 즐기는 고요하고 깊은 휴식</p>
		  </div>
		</div>
		
		<!-- 3. 스위트룸 -->
		<div class="room-card">
		  <img src="/se2/gallery/img/seoul/room/S_S.jpg" alt="서울 스위트룸">
		  <div class="room-info">
		    <h4>스위트룸</h4>
		    <p>세련되고 아늑한 분위기의 합리적인 프리미엄 객실</p>
		  </div>
		</div>
		
		<!-- 4. 디럭스 더블 -->
		<div class="room-card">
		  <img src="/se2/gallery/img/ulsan/room/U_G.jpg" alt="울산 그랜드 더블룸">
		  <div class="room-info">
		    <h4>그랜드 더블</h4>
		    <p>감각적인 인테리어와 탁 트인 공간의 조화</p>
		  </div>
		</div>
		
		<!-- 5. 디럭스 트윈 -->
		<div class="room-card">
		  <img src="/se2/gallery/img/seoul/room/S_D.jpg" alt="서울 디럭스 트윈룸">
		  <div class="room-info">
		    <h4>디럭스 트윈</h4>
		    <p>비즈니스와 휴식을 동시에 만족시키는 시티뷰 객실</p>
		  </div>
		</div>
	  </div>
	</section>
	
	<!-- 프로모션 영상 삽입 -->
	<section class="promo-video-section">
	<!-- 영상 자동 루프 -->
	  <video autoplay muted loop>
	    <source src="/se2/video/hotel_intro.mp4" type="video/mp4">
	    브라우저가 video 태그를 지원하지 않습니다.
	  </video>
	</section>
	
	<!-- 지도 정보 -->
	<section class="map-info">
	  <h3>HELIA 호텔 오시는 길</h3>
	  
	  <!-- 버튼 트리거 -->
	  <div class="map-buttons">
	    <button class="map-btn active" onclick="setMap('seoul')">서울점 보기</button>
	    <button class="map-btn" onclick="setMap('ulsan')">울산점 보기</button>
	  </div>
	  <!-- 다른 홈체이지 불러오기  -->
	  <iframe id="hotelMap"
	    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3022.2901454184985!2d-73.97612382332608!3d40.755642771387116!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c2595b7381bd11%3A0x354857268d76d20f!2zMTExIEUgNDh0aCBTdCwgTmV3IFlvcmssIE5ZIDEwMDE3IOuvuOq1rQ!5e0!3m2!1sko!2skr!4v1744639617409!5m2!1sko!2skr"
	    width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy">
	  </iframe>
	</section>
	
	<!-- 예약 유도 CTA -->
	<section class="cta-box">
	  <h3>HELIA 호텔에서 편안한 여행을 시작하세요</h3>
	  <a href="/se2/main/hotelReser/hotelReser.jsp" class="btn-cta" >지금 바로 예약하기</a>
	</section>
</section>
</div>
	<!-- -------------------------------------------------------------- -->
	
    <section class="section4">
    	<article>
	        <div class="wrapper">
	            <label>GALLERY</label>
	            <hr>
	            <div class="gallery-slider">
       		    <div class="gallery-track">
		            <img src="/se2/gallery/img/seoul/room/S_G.jpg" alt="g3">
		            <img src="/se2/gallery/img/ulsan/dining/U_Restaurant2.png" alt="g4">
		            <img src="/se2/gallery/img/seoul/dining/S_Dining1.png" alt="g5">
		            <img src="/se2/gallery/img/ulsan/activity/U_Diebing.jpg" alt="g6">
		            <img src="/se2/gallery/img/seoul/activity/S_SafariPark.jpg" alt="g7">
		            <img src="/se2/gallery/img/ulsan/facilities/U_Wedding.png" alt="g8">
		            <img src="/se2/gallery/img/seoul/other/hotel_1.png" alt="g9">
		            <img src="/se2/gallery/img/seoul/room/S_G.jpg" alt="g3">
		            <img src="/se2/gallery/img/ulsan/dining/U_Restaurant2.png" alt="g4">
		            <img src="/se2/gallery/img/seoul/dining/S_Dining1.png" alt="g5">
		            <img src="/se2/gallery/img/ulsan/activity/U_Diebing.jpg" alt="g6">
		            <img src="/se2/gallery/img/seoul/activity/S_SafariPark.jpg" alt="g7">
		            <img src="/se2/gallery/img/ulsan/facilities/U_Wedding.png" alt="g8">
		            <img src="/se2/gallery/img/seoul/other/hotel_1.png" alt="g9">
		        </div>
		      </div>		            
	        </div>
    	</article>
    </section>
    <section class="section2">
      <div class="section2-scaled">
        <article>          
    		<div class="wrapper">
	            <label>아름다움이 머무는 공간, HELIA HOTEL 갤러리로 초대합니다.</label>
	            <input onclick="show2();" type="button" value="호텔갤러리 바로가기 →">          
    		</div>
        </article>
       </div> 
    </section>
<%@include file="/footer.jsp" %>
<script src="/se2/indexJS_body.js"></script>
</body>
</html>