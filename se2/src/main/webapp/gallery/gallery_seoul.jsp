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
      <li><a href="gallery_seoul.jsp">호텔 서울</a></li>
      <li><a href="gallery_ulsan.jsp">호텔 울산</a></li>
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
    <div class="thumbnail-row"  id="thumbnailRow">
	  	<!-- 이미지 카드에서 class로 카테고리 지정 -->
	  	
	  	<!-- 객실 room -->
	  	<!-- 그랜드 -->
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/seoul/room/S_G.jpg">
	  	<p>그랜드 코너 스위트</p>
	  	</div>
	  	
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/seoul/room/S_G2.jpg">
	  	<p>그랜드 디럭스</p>
	  	</div>
	  	
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/seoul/room/S_G3.jpg">
	  	<p>시티뷰 그랜드</p>
	  	</div>
	  	
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/seoul/room/S_G4.jpg">
	  	<p>프리미엄 그랜드</p>
	  	</div>
	  	
	  	<!-- 디럭스 -->
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/seoul/room/S_D.jpg">
	  	<p>프리미어 디럭스</p>
	  	</div>
	  
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/seoul/room/S_D2.jpg">
	  	<p>모던 디럭스</p>
	  	</div>
	  	
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/seoul/room/S_D3.jpg">
	  	<p>디럭스 트윈</p>
	  	</div>
	  	
	  	<!-- 스위트 -->
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/seoul/room/S_S.jpg">
	  	<p>모노그램 스위트</p>
	  	</div>
	  	
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/seoul/room/S_S2.jpg">
	  	<p>코너 스위트</p>
	  	</div>
	  	
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/seoul/room/S_S3.jpg">
	  	<p>럭셔리 스위트</p>
	  	</div>
	  	
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/seoul/room/S_S4.jpg">
	  	<p>시그니처 스위트</p>
	  	</div>
	  	
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/seoul/room/S_S5.jpg">
	  	<p>그랜드 스위트</p>
	  	</div>
	  	
	  	<!-- 스탠다드 -->
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/seoul/room/S_ST.jpg">
	  	<p>수페리어 스탠다드</p>
	  	</div>
	  	
	  	<div class="image-card room">
	  	<img src="/se2/gallery/img/seoul/room/S_ST2.jpg">
	  	<p>이코노미 스탠다드</p>
	  	</div>
	  	
	  	
	  	<!-- 다이닝 dining-->
	  	<div class="image-card dining">
	  	<img src="/se2/gallery/img/seoul/dining/S_bar1.png">
	  	<p>루프탑 바</p>
	  	</div>
	  	
	  	<div class="image-card dining">
	  	<img src="/se2/gallery/img/seoul/dining/S_bar2.png">
	  	<p>소셜 라운지 바</p>
	  	</div>
	  	
	  	<div class="image-card dining">
	  	<img src="/se2/gallery/img/seoul/dining/S_bar3.png">
	  	<p>프라이빗 바</p>
	  	</div>
	  	
	  	<div class="image-card dining">
	  	<img src="/se2/gallery/img/seoul/dining/S_Dining1.png">
	  	<p>가든 브런치 테이블</p>
	  	</div>
	  	
	  	<!-- 액티비티 activity -->
	  	<div class="image-card activity">
	  	<img src="/se2/gallery/img/seoul/activity/S_SafariPark.jpg">
	  	<p>사파리 파크</p>
	  	</div>
	  	
	  	<!-- 부대시설 facility-->
	  	<div class="image-card facilities">
	  	<img src="/se2/gallery/img/seoul/facilities/S_Lounge.png">
	  	<p>에그제큐티브 라운지</p>
	  	</div>
	  	
	  	<div class="image-card facilities">
	  	<img src="/se2/gallery/img/seoul/facilities/S_Reading_Room.png">
	  	<p>클래식 리딩룸</p>
	  	</div>
	  	
	  	<div class="image-card facilities">
	  	<img src="/se2/gallery/img/seoul/facilities/S_Retiring_Room.png">
	  	<p>릴렉세이션 라운지</p>
	  	</div>
	  	
	  	<div class="image-card facilities">
	  	<img src="/se2/gallery/img/seoul/facilities/S_Fitness1.png">
	  	<p>피트니스 클럽</p>
	  	</div>
	  	
	  	<div class="image-card facilities">
	  	<img src="/se2/gallery/img/seoul/facilities/S_Fitness2.png">
	  	<p>프리미엄 피트니스</p>
	  	</div>
	  	
	  	<div class="image-card facilities">
	  	<img src="/se2/gallery/img/seoul/facilities/S_Business.png">
	  	<p>멀티 이벤트홀</p>
	  	</div>
	  	
	  	<div class="image-card facilities">
	  	<img src="/se2/gallery/img/seoul/facilities/S_Wedding.png">
	  	<p>프라이빗 웨딩홀</p>
	  	</div>
	  	
	  	<div class="image-card facilities">
	  	<img src="/se2/gallery/img/seoul/facilities/S_Boardroom.png">
	  	<p>비즈니스 보드룸</p>
	  	</div>
	  	
	  	<div class="image-card facilities">
	  	<img src="/se2/gallery/img/seoul/facilities/S_Gallery.png">
	  	<p>아트 갤러리</p>
	  	</div>
	  	
	  	<div class="image-card facilities">
	  	<img src="/se2/gallery/img/seoul/facilities/S_Grand_Room.png">
	  	<p>그랜드 볼룸</p>
	  	</div>
	  	
	  	
	  	<!-- 기타 Other-->
	  	<div class="image-card Other">
	  	<img src="/se2/gallery/img/seoul/other/LocalArea.png">
	  	<p>도심을 담은 루프탑 뷰</p>
	  	</div>
	  	
	  	<div class="image-card Other">
	  	<img src="/se2/gallery/img/seoul/other/hotel_1.png">
	  	<p>파노라믹 스카이라운지</p>
	  	</div>
	  	
	  	<div class="image-card Other">
	  	<img src="/se2/gallery/img/seoul/other/hotel_Lobby.png">
	  	<p>웰컴 로비</p>
	  	</div>
	  	
	  	<div class="image-card Other">
	  	<img src="/se2/gallery/img/seoul/other/hotel_Desk.png">
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