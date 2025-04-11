<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box; /* 패딩과 테두리를 크기 계산에 포함 */
}

body {
    text-align: center; /* 화면 중앙 배치 효과 */
    margin:0 auto;
    padding:0;
	/*background: #e8e8e8;*/
}
section{
	width:1500px;
	margin: 0 auto;
	overflow-x:auto;
	padding:0px;
}
/* 섹션1 이미지 */
.slider {
    position: relative;
    width: 1500px; 
    height: 700px; 
    overflow: hidden; /* 넘치는 부분 숨기기 */
    margin: 0 auto; 
}

.slide {
    width: 100%;
    display: none; /* 기본적으로 모든 이미지 숨김 */
}

.table-grade {
    width: 100%; 
    text-align: center; 
}

.table-grade td {
    text-align: center;
}	

button.prev, button.next {
    position: absolute;
    top: 50%; /* 중앙 위치 */
    transform: translateY(-50%);
    background-color: rgba(0, 0, 0, 0.5); /* 반투명 검정 배경 */
    color: white;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    z-index: 10;
    height:100px;
}

button.prev {
    left: 10px; 
}

button.next {
    right: 10px; 
}

button.prev:hover, button.next:hover {
    background-color: rgba(0, 0, 0, 0.8); /* 마우스를 올렸을 때 색 변화 */
}
.section2{
	background-color: #FAFAFA;
}
.section2 label{
	text-align: center;
    font-size: 25px;
    color: #9AA39A;
    text-shadow: -1px -1px 1px rgba(255,255,255,.1), 1px 1px 1px rgba(0,0,0,.5);
	font-weight: bold;
}
.section2 input[type="button"]{
	font-size: 25px;
	text-align: center;
    font-weight: bold; 
	padding: 10px 20px; 
	border:none;
	margin-left:200px;
}

.section4 {
    background-color: #FAFAFA; 
    text-align: center;
}

.section4 label {
    text-align: center;
    font-size: 25px;
    color: #333;
    text-shadow: -1px -1px 1px rgba(255, 255, 255, 0.1), 1px 1px 1px rgba(0, 0, 0, 0.2);
    font-weight: bold;
    margin-bottom: 20px;
    display: block;
}

.section4 img {
    width: 150px;
    height: 150px;
    margin: 10px;
    border-radius: 10px; /* 둥근 모서리 */
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); 
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.section4 img:hover {
    transform: scale(1.1); /* 마우스 가져다 대면 확대 */
    box-shadow: 0px 8px 12px rgba(0, 0, 0, 0.2); /* 음영 강조 */
}

.section4 hr {
    border: none;
    height: 2px;
    background-color: #ddd; 
    margin: 20px auto;
    width: 80%; 
}
</style>

</head>
<body>
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
                <img src="main/img/10.jpg" alt="h10" class="slide">
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
    <section class="section4">

    	<article>
	        <div class="wrapper">
	            <label>GALLETY</label>
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
            slides[i].style.display = "none";  
        }

        // 인덱스에 해당하는 슬라이드 표시
        slideIndex++;
        if (slideIndex > slides.length) {slideIndex = 1}    

        slides[slideIndex-1].style.display = "block";  

        //기존 타이머 취소하고 새로 시작, 내장 함수
        clearTimeout(slideTimer);

        // 3초마다 슬라이드 변경, 내장 함수
        slideTimer=setTimeout(showSlides, 3000);
    }
 	// 슬라이드 자동 변경
    showSlides();

    function changeSlide(n) {
        slideIndex += n - 1; // 현재 슬라이드 인덱스 조정
        if (slideIndex < 0) {
            slideIndex = document.getElementsByClassName("slide").length - 1;
        }
        showSlides();
    }

</script>
</html>
es[i].classList.remove("active");
        }

        slides[slideIndex - 1].classList.add("active");

        clearTimeout(slideTimer);
        slideTimer = setTimeout(showSlides, 3000);
    }

</script>
</html>
