<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HELIA 서울 갤러리</title>
<link rel="stylesheet" type="text/css" href="/se2/css/sideBar.css">
<link rel="stylesheet" type="text/css" href="/se2/gallery/css/gallery.css">
</head>
<body>
<%@include file="/header.jsp" %>

<div class="container">
  <!-- 왼쪽 사이드바 -->
  <section class="box1">
    <div class="sidebar">HELIA GALLERY</div>
    <hr>
    <ul>
      <li><a href="/se2/gallery/gallery_seoul.jsp">호텔 서울</a></li>
      <li><a href="/se2/gallery/gallery_ulsan.jsp"><strong>호텔 울산</strong></a></li>
    </ul>
  </section>

  <!-- 오른쪽 갤러리 영역 -->
  <section class="gallery-container">

      	<div class="gallery-title">
		<strong>Photo</strong>
      	</div>
		<hr>
  <!-- 카테고리 탭 -->
  	<div class="category-tabs">
	  <button onclick="filterImages('all')" class="active">ALL</button>
	  <button onclick="filterImages('room')">객실</button>
	  <button onclick="filterImages('dining')">다이닝</button>
	  <button onclick="filterImages('activity')">액티비티</button>
	  <button onclick="filterImages('facilities')">부대시설</button>
	  <button onclick="filterImages('Other')">기타</button>
	</div>
  <!-- //카테고리 탭 -->
  
  <!-- 메인 이미지 슬라이드 -->
    <div class="main-display">
      <button class="nav left" onclick="prevImage()">&#10094;</button>
     <div class="image-box">
	  <img id="mainImage" class="active" src="/se2/gallery/img/seoul/other/LocalArea.png" alt="헬리아 서울 1">
	  <p id="mainCaption">루프탑에서 바라본 서울의 야경</p>
	</div>
      <button class="nav right" onclick="nextImage()">&#10095;</button>
    </div>
	<!-- //메인 이미지 슬라이드 -->
	
	<div class="thumbnail-wrapper">
 	 <button class="thumb-nav left" onclick="scrollThumbnails(-1)">&#10094;</button>
    <!-- 카테고리 필터 이미지 목록 -->
    <div class="thumbnail-row" id="thumbnailRow">
	  	<!-- 이미지 카드에서 class로 카테고리 지정 -->
	  	
	  	<!-- 객실 room -->
	  	<!-- 그랜드 -->
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/ulsan/room/U_G.jpg">
	  	<p>그랜드 코너 스위트</p>
	  	</div>
	  	
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/ulsan/room/U_G2.jpg">
	  	<p>그랜드 디럭스</p>
	  	</div>
	  	
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/ulsan/room/U_G3.jpg">
	  	<p>시티뷰 그랜드</p>
	  	</div>
	  	 	<!-- 디럭스 -->
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/ulsan/room/U_D.jpg">
	  	<p>프리미어 디럭스</p>
	  	</div>
	  	
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/ulsan/room/U_D2.jpg">
	  	<p>디럭스 더블룸</p>
	  	</div>
	  	
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/ulsan/room/U_D3.jpg">
	  	<p>디럭스 트윈룸</p>
	  	</div>
	  	
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/ulsan/room/U_D4.jpg">
	  	<p>디럭스 오션뷰</p>
	  	</div>
	  	<!-- 스위트  -->
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/ulsan/room/U_S.jpg">
	  	<p>모노그램 스위트</p>
	  	</div>
	  	
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/ulsan/room/U_S2.jpg">
	  	<p>럭셔리 스위트</p>
	  	</div>
	  	
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/ulsan/room/U_S3.jpg">
	  	<p>코너 스위트룸</p>
	  	</div>
	  	<!-- 스탠다드 -->
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/ulsan/room/U_ST.jpg">
	  	<p>수페리어 스탠다드</p>
	  	</div>
	  	
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/ulsan/room/U_ST2.jpg">
	  	<p>이코노미 스탠다드</p>
	  	</div>
	  	
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/ulsan/room/U_ST3.jpg">
	  	<p>스탠다드 트윈</p>
	  	</div>
	  	
	  	
	  	
	  	
	  	<!-- 다이닝 dining-->
	  	<div class="image-card dining">
	  	<img src="/se2/gallery/img/ulsan/dining/U_Restaurant.png">
	  	<p>뷔페 레스토랑</p>
	  	</div>
	  	
	  	<div class="image-card dining">
	  	<img src="/se2/gallery/img/ulsan/dining/U_Restaurant2.png">
	  	<p>다이닝 라운지</p>
	  	</div>
	  	
	  	<div class="image-card dining">
	  	<img src="/se2/gallery/img/ulsan/dining/U_Restaurant3.png">
	  	<p>오션 다이닝 테라스</p>
	  	</div>
	  	
	  	<div class="image-card dining">
	  	<img src="/se2/gallery/img/ulsan/dining/U_Cafe.png">
	  	<p>로비 카페</p>
	  	</div>
	  	
	  	
	  	<!-- 액티비티 activity -->
	  	<div class="image-card activity">
	  	<img src="/se2/gallery/img/ulsan/activity/U_Diebing.jpg">
	  	<p>스킨스쿠버</p>
	  	</div>
	  	
	  	<div class="image-card activity">
	  	<img src="/se2/gallery/img/ulsan/activity/U_Show.jpg">
	  	<p>라이브 쇼 가든</p>
	  	</div>
	  	
	  	<!-- 부대시설 facilities-->
	  	<div class="image-card facilities">
	  	<img src="/se2/gallery/img/ulsan/facilities/U_Pool2.png">
	  	<p>인도어 풀</p>
	  	</div>
	  	
	  	<div class="image-card facilities">
	  	<img src="/se2/gallery/img/ulsan/facilities/U_KidPool.png">
	  	<p>키즈 풀</p>
	  	</div>
	  	
	  	<div class="image-card facilities">
	  	<img src="/se2/gallery/img/ulsan/facilities/U_PoolSide.png">
	  	<p>풀사이드 테라스</p>
	  	</div>
	  	
	  	<div class="image-card facilities">
	  	<img src="/se2/gallery/img/ulsan/facilities/U_Wedding.png">
	  	<p>프라이빗 웨딩홀</p>
	  	</div>
	  	
	  	<div class="image-card facilities">
	  	<img src="/se2/gallery/img/ulsan/facilities/U_Spa.png">
	  	<p>힐링 스파</p>
	  	</div>
	  	
	  	<div class="image-card facilities">
	  	<img src="/se2/gallery/img/ulsan/facilities/U_Lounge.png">
	  	<p>라운지 존</p>
	  	</div>
	  	
	  	<div class="image-card facilities">
	  	<img src="/se2/gallery/img/ulsan/facilities/U_SecretPool.jpg">
	  	<p>시크릿 풀</p>
	  	</div>
	  	
	  	<div class="image-card facilities">
	  	<img src="/se2/gallery/img/ulsan/facilities/U_Lounge2.png">
	  	<p>프라이빗 라운지</p>
	  	</div>
	  	
	  	<div class="image-card facilities">
	  	<img src="/se2/gallery/img/ulsan/facilities/U_Zim.png">
	  	<p>피트니스 센터</p>
	  	</div>
	  	
	  	
	  	
	  	
	  	<!-- 기타 Other-->
	  	<div class="image-card Other">
	  	<img src="/se2/gallery/img/ulsan/other/U_showPool.png">
	  	<p>쇼풀 라운지</p>
	  	</div>
	  	
	  	<div class="image-card Other">
	  	<img src="/se2/gallery/img/ulsan/other/U_Other2.png">
	  	<p>아트 플로우</p>
	  	</div>
	  	
	  	<div class="image-card Other">
	  	<img src="/se2/gallery/img/ulsan/other/U_Garden.png">
	  	<p>가든 뷰</p>
	  	</div>
	  	
	  	<div class="image-card Other">
	  	<img src="/se2/gallery/img/ulsan/other/U_Other1.png">
	  	<p>디테일 존</p>
	  	</div>
	  	
	  	<div class="image-card Other">
	  	<img src="/se2/gallery/img/ulsan/other/U_beachgarden.jpg">
	  	<p>비치 가든</p>
	  	</div>
	  	
	  	<div class="image-card Other">
	  	<img src="/se2/gallery/img/ulsan/other/U_Lobby.jpg">
	  	<p>로비 라운지</p>
	  	</div>
	  	
	  	<div class="image-card Other">
	  	<img src="/se2/gallery/img/ulsan/other/U_Lobby2.png">
	  	<p>웰컴 로비</p>
	  	</div>
	  	
	  	<div class="image-card Other">
	  	<img src="/se2/gallery/img/ulsan/other/U_Information.png">
	  	<p>컨시어지 데스크</p>
	  	</div>
	  	
	  	
    <!--// 카테고리 필터 이미지 목록 -->
    	</div>
    	  <button class="thumb-nav right" onclick="scrollThumbnails(1)">&#10095;</button>
    </div>
  </section>
</div>

<%@ include file="/footer.jsp" %>
<script src="/se2/gallery/js/gallery.js"></script>
</body>
</html>