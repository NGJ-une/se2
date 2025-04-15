<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/se2/main/hotelSearch/css/hotelSearchcss.css">
<!-- Overlay 배경 -->
<div class="overlay" id="overlay"></div>

<!-- 팝업 모달 -->
<div class="popup-page hotel-popup" id="popupPage">
  <h2 class="popup-title">호텔 찾기</h2>
  <div class="hotel-grid">


    <!-- 서울 카드 -->
    <div class="hotel-card" onclick="location.href='/se2/index.jsp'">
      <img src="/se2/gallery/img/seoul/other/LocalArea.png" alt="HELIA 서울">
      <div class="hotel-info">
        <h3>HELIA 서울</h3>
        <p>세련된 도심 속 프라이빗한 럭셔리</p>
      </div>
    </div>


    <!-- 울산 카드 -->
    <div class="hotel-card" onclick="location.href='/se2/hotel_1/hotelUlsan.jsp'">
      <img src="/se2/gallery/img/ulsan/other/U_showPool.png" alt="HELIA 울산">
      <div class="hotel-info">
        <h3>HELIA 울산</h3>
        <p>푸른 바다와 마주한 절경의 오션 뷰</p>
      </div>
    </div>

  </div>
  <div class="footer-line">
    <span class="footer-text">지점 선택 후 편안한 여행을 시작하세요</span>
    <button class="close-bt" onclick="hidePopup()">닫기</button>
  </div>
</div>
<script src="/se2/main/hotelSearch/js/hotelSearchJS_body.js"></script>