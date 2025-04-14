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
<style>
	.region-select{
		width: 190px;
	}
</style>
<script>
function show2(){
	location.href='/se2/gallery/gallery_seoul.jsp';
}
</script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(){
	
	const today = new Date().toISOString().split('T')[0];
	
	const checkInInput = document.getElementById('checkIn');
	const checkOutInput = document.getElementById('checkOut');

	checkInInput.setAttribute('min', today);
	checkOutInput.setAttribute('min', checkInInput.value ? checkInInput.value : today);

	checkOutInput.addEventListener('change', function(){
		if (!checkInInput.value){
		alert('체크인 날짜를 먼저 입력하세요');
		checkOutInput.value = '';
		checkInInput.focus();
	}
	});

	checkInInput.addEventListener('change', function(){
		checkOutInput.setAttribute('min', checkInInput.value);
	});
	
	
	document.querySelectorAll('reservation-form input[type="date"], input[type="number"]').forEach(element => {
		element.addEventListener('keydown', function(event){
			event.preventDefault();
		});
	});
	
	
	const numberInputs = document.querySelectorAll('.reservation-form input[type="number"]');

	function limitHeadCount(event){
		const headCount = Array.from(numberInputs).reduce((acc, input) => acc + Number(input.value), 0);

		if (headCount > 6){
			alert('총 인원은 6명까지 가능합니다');
			event.target.value = event.target.getAttribute('prev-value') || 0;
		}
		else{
			event.target.setAttribute('prev-value', event.target.value);
		}
	}

	numberInputs.forEach(numberInput => {
		numberInput.setAttribute('prev-value', numberInput.value);
		numberInput.addEventListener('change', limitHeadCount);
	});
});
</script>
</head>
<body class="main-page">
<%@include file="/header.jsp" %>
    <section class="section1">
        <article>
            <div class="slider">
             <div class="slide active">
			    <img src="main/img/1.jpg" alt="h1">
			    <div class="slide-caption fixed-bottom-left">
			      <h2>Timeless Elegance in the Heart of Seoul</h2>
				<p>서울의 중심에서 만나는 클래식한 휴식</p>
				<p>프리미엄 디너 코스 & 와인 페어링 제공</p>
			    </div>
			  </div>
			  <div class="slide">
			    <img src="main/img/2.jpg" alt="h2">
			    <div class="slide-caption fixed-bottom-left">
			      <h2>Moments Made to Remember</h2>
<p>잊지 못할 특별한 하루를 선물하세요</p>
<p>풀 오션뷰 프라이빗 디너 예약 가능</p>
			    </div>
			  </div>
			  <div class="slide">
			    <img src="main/img/3.jpg" alt="h3">
			    <div class="slide-caption fixed-bottom-left">
			      <h2>Gracefully Calm, Infinitely Yours</h2>
<p>고요함 속에서 나만의 시간을 누리다</p>
<p>헬라 명상 힐링 프로그램 진행 중</p>
			    </div>
			  </div>
			  <div class="slide">
			    <img src="main/img/4.jpg" alt="h4">
			    <div class="slide-caption fixed-bottom-left">
			      <h2>Wake Up With a View</h2>
<p>눈을 뜨면 펼쳐지는 감각적인 서울</p>
<p>시티뷰 조식 서비스 포함 패키지</p>
			    </div>
			  </div>
			  <div class="slide">
			    <img src="main/img/5.jpg" alt="h5">
			    <div class="slide-caption fixed-bottom-left">
			      <h2>Evenings Bathed in Gold</h2>
<p>석양과 함께하는 로맨틱 나이트</p>
<p>루프탑 바 라이브 재즈 매일 운영</p>
			    </div>
			  </div>
			  <div class="slide">
			    <img src="main/img/6.jpg" alt="h6">
			    <div class="slide-caption fixed-bottom-left">
			      <h2>Designed for the Inspired</h2>
<p>감각적인 이들을 위한 모던 디자인</p>
<p>아트 라운지 & 프라이빗 전시공간 제공</p>
			    </div>
			  </div>
			  <div class="slide">
			    <img src="main/img/7.jpg" alt="h7">
			    <div class="slide-caption fixed-bottom-left">
			      <h2>Your Journey Begins Here</h2>
<p>당신의 여정은 여기서 시작됩니다</p>
<p>24시간 컨시어지 & 웰컴 드링크 서비스</p>
			    </div>
			  </div>
			  <div class="slide">
			    <img src="main/img/8.jpg" alt="h8">
			    <div class="slide-caption fixed-bottom-left">
			      <h2>Every Detail, Thoughtfully Curated</h2>
<p>디테일이 완성하는 품격 있는 하루</p>
<p>스위트룸 고객 전용 프리미엄 키트 제공</p>
			    </div>
			  </div>
			  <div class="slide">
			    <img src="main/img/9.jpg" alt="h9">
			    <div class="slide-caption fixed-bottom-left">
			      <h2>Seoul’s Finest Urban Escape</h2>
<p>서울 헬라 호텔, 도심 속 최상의 품격</p>
<p>럭셔리 스파 & 루프탑 라운지 프로그램 운영 중</p>
			    </div>
			  </div>
<!--                 <img src="main/img/1.jpg" alt="h1" class="slide"> -->
<!--                 <img src="main/img/2.jpg" alt="h2" class="slide"> -->
<!--                 <img src="main/img/3.jpg" alt="h3" class="slide"> -->
<!--                 <img src="main/img/4.jpg" alt="h4" class="slide"> -->
<!--                 <img src="main/img/5.jpg" alt="h5" class="slide"> -->
<!--                 <img src="main/img/6.jpg" alt="h6" class="slide"> -->
<!--                 <img src="main/img/7.jpg" alt="h7" class="slide"> -->
<!--                 <img src="main/img/8.jpg" alt="h8" class="slide"> -->
<!--                 <img src="main/img/9.jpg" alt="h9" class="slide"> -->
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
	                    <td><%=(int)session.getAttribute("point") %>원</td>
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
	    <div class="room-card">
	      <img src="/se2/main/img/1.jpg" alt="디럭스룸">
	      <div class="room-info">
	        <h4>디럭스룸</h4>
	        <p>아늑한 분위기와 세련된 인테리어의 조화</p>
	      </div>
	    </div>
	     <div class="room-card">
	      <img src="/se2/main/img/2.jpg" alt="디럭스룸">
	      <div class="room-info">
	        <h4>디럭스룸</h4>
	        <p>아늑한 분위기와 세련된 인테리어의 조화</p>
	      </div>
	    </div>
	     <div class="room-card">
	      <img src="/se2/main/img/3.jpg" alt="디럭스룸">
	      <div class="room-info">
	        <h4>디럭스룸</h4>
	        <p>아늑한 분위기와 세련된 인테리어의 조화</p>
	      </div>
	    </div>
	     <div class="room-card">
	      <img src="/se2/main/img/4.jpg" alt="디럭스룸">
	      <div class="room-info">
	        <h4>디럭스룸</h4>
	        <p>아늑한 분위기와 세련된 인테리어의 조화</p>
	      </div>
	    </div>
	    <div class="room-card">
	      <img src="/se2/main/img/5.jpg" alt="디럭스룸">
	      <div class="room-info">
	        <h4>디럭스룸</h4>
	        <p>아늑한 분위기와 세련된 인테리어의 조화</p>
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
	  <!-- 다른 홈체이지 불러오기  -->
	  <iframe 
	    src="https://www.google.com/maps/embed?pb=..."
	    width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
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
</body>
<script>
    var slideIndex = 0;
    var slideTimer;

    function showSlides() {
        var slides = document.getElementsByClassName("slide");
        
        // 모든 슬라이드 숨기기
        for (var i = 0; i < slides.length; i++) {
        slides[i].classList.remove("active");
        
     // slide-caption 내 p 태그 초기화
        var captions = slides[i].querySelectorAll(".slide-caption p");
        captions.forEach(function(p) {
            p.style.opacity = "0";
            p.style.transform = "translateY(20px)";
            p.style.animation = "none";
            // 강제 재실행 트릭 (reflow)
            void p.offsetWidth;
            p.style.animation = "fadeInText 1s ease forwards";
            p.style.animationDelay = "0.5s";
        });
    }
	
        // 인덱스에 해당하는 슬라이드 표시
        slideIndex++;
        if (slideIndex > slides.length) {
            slideIndex = 1;
        }

        slides[slideIndex - 1].classList.add("active");

        clearTimeout(slideTimer);
        slideTimer = setTimeout(showSlides, 5000);
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
        slideTimer = setTimeout(showSlides, 5000);
    }

</script>
</html>