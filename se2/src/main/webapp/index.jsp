<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/se2/css/body.main-page.css">
<link rel="stylesheet" type="text/css" href="/se2/css/commonsLayout.css">
</head>
<body class="main-page">
<%@include file="/header.jsp" %>
    <section class="section1">
        <article>
            <div class="slider">
                <img src="main/img/1.jpg" alt="h1" class="slide">
                <img src="main/img/2.jpg" alt="h2" class="slide">
                <img src="main/img/3.jpg" alt="h3" class="slide">
                <img src="main/img/4.jpg" alt="h4" class="slide">
                <img src="main/img/5.jpg" alt="h5" class="slide">
                <img src="main/img/6.jpg" alt="h6" class="slide">
                <img src="main/img/7.jpg" alt="h7" class="slide">
                <img src="main/img/8.jpg" alt="h8" class="slide">
                <img src="main/img/9.jpg" alt="h9" class="slide">
                <button class="prev" onclick="changeSlide(-1)">&#10094;</button>
    			<button class="next" onclick="changeSlide(1)">&#10095;</button>
            </div>
        </article>
    </section>
    <section class="section5">
  <article>
    <div class="reservation-box">
      <div class="reservation-form">
        <!-- 호텔/도시 -->
        <div class="reservation-item hotel-city">
          <label>호텔 또는 도시</label>
          <div class="input-wrapper">
            <input type="text" placeholder="호텔을 선택해주세요.">
            <span class="icon-search">🔍</span>
          </div>
        </div>

        <!-- 체크인 -->
        <div class="reservation-item date-item">
          <label>체크인</label>
          <div class="value">2025.04.11 <strong>(금)</strong></div>
        </div>

        <!-- 체크아웃 -->
        <div class="reservation-item date-item">
          <label>체크아웃</label>
          <div class="value">2025.04.12 <strong>(토)</strong></div>
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
          <div class="value">2</div>
        </div>

        <!-- 어린이 -->
        <div class="reservation-item">
          <label>
            어린이
            <span class="tooltip">ⓘ
              <span class="tooltip-text">37개월 이상 ~ 만 12세 이하<br>(베트남: 만 6세 이상 ~ 만 11세까지)</span>
            </span>
          </label>
          <div class="value">0</div>
        </div>

        <!-- 유아 -->
        <div class="reservation-item">
          <label>
            유아
            <span class="tooltip">ⓘ
              <span class="tooltip-text">36개월 이하<br>(베트남: 만 5세 이하)</span>
            </span>
          </label>
          <div class="value">0</div>
        </div>

        <!-- 검색 버튼 -->
		<div class="btn-search-wrapper">
		  <button class="btn-search">검색</button>
		</div>
      </div>
    </div>
  </article>
</section>
    <% if(sid==null){%>
    
    <% } else { %>
    <section class="section3">
        <article>
	        <div class="wrapper">
	            <h2>GOLD<img src="/se2/css/img/icon_BRONZE.png">&nbsp;<%=sid %> 님 환영합니다</h2>
	            <table class="table-grade">
	                <tr>
	                    <td>미사용포인트</td>
	                    <td>할인율</td>
	                    <td>총 예약건수</td>
	                    <td>총 사용금액</td>
	                </tr>
	                <tr>
	                    <td>~%</td>
	                    <td>~%</td>
	                    <td>~%</td>
	                    <td>~%</td>
	                </tr>
	                <tr>
	                    <td colspan="4">DIAMOND까찌 ~~마 남았습니다</td>
	                </tr>
	            </table> 
	         </div> 
        </article>
    </section>
    <% } %>
    <section class="section4">
    	<article>
	        <div class="wrapper">
	            <label>GALLERY</label>
	            <hr>
		            <img src="main/img/3.jpg" alt="g3">
		            <img src="main/img/4.jpg" alt="g4">
		            <img src="main/img/5.jpg" alt="g5">
		            <img src="main/img/6.jpg" alt="g6">
		            <img src="main/img/7.jpg" alt="g7">
		            <img src="main/img/8.jpg" alt="g8">
		            <img src="main/img/9.jpg" alt="g9">
	        </div>
    	</article>
    </section>
    <section class="section2">
        <article>          
    		<div class="wrapper">
	            <label>HELIA HOTEL의 다채롭고 아름다운 다양한 시설을 감상해 보세요.</label>
	            <input type="button" value="호텔갤러리 바로가기 →">          
    		</div>
        </article>
    </section>
<%@include file="/footer.jsp" %>
</body>
<script>
    var slideIndex = 0;
    var slideTimer;

    function showSlides() {
        var slides = document.getElementsByClassName("slide");
        
        // 모든 슬라이드 숨기기
        for (var i = 0; i < slides.length; i++) {
        slides[i].classList.remove("active");
    }

        // 인덱스에 해당하는 슬라이드 표시
        slideIndex++;
        if (slideIndex > slides.length) {
            slideIndex = 1;
        }

        slides[slideIndex - 1].classList.add("active");

        clearTimeout(slideTimer);
        slideTimer = setTimeout(showSlides, 3000);
    }
    showSlides();

    function changeSlide(n) {
    	var slides = document.getElementsByClassName("slide");

        slideIndex += n;
        if (slideIndex < 1) {
            slideIndex = slides.length;
        } else if (slideIndex > slides.length) {
            slideIndex = 1;
        }

        for (var i = 0; i < slides.length; i++) {
            slides[i].classList.remove("active");
        }

        slides[slideIndex - 1].classList.add("active");

        clearTimeout(slideTimer);
        slideTimer = setTimeout(showSlides, 3000);
    }

</script>
</html>
