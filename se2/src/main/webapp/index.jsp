<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/se2/css/body.main-page.css">

</head>
<body class="main-page">
<%@include file="/header2.jsp" %>
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
    <section class="section2">
        <article>          
            <label>
            새로워진 온라인 예약으로 빠르고 간편하게 예약 및 조회 해보세요.
            </label>
            <input type="button" value="호텔예약 바로가기 →">          
        </article>
    </section>
    <section class="section3">
        <article>
            <fieldset>
            <h2>등급</h2>
            <table class="table-grade">
                <tr>
                    <td>bronze</td>
                    <td>silver</td>
                    <td>gold</td>
                    <td>diamond</td>
                </tr>
                <tr>
                    <td>~%</td>
                    <td>~%</td>
                    <td>~%</td>
                    <td>~%</td>
                </tr>
                <tr>
                    <td colspan="4">조건 : ~~~~~~~~~~</td>
                </tr>
            </table> 
            </fieldset>
            
        </article>
    </section>
    <section class="section4">
        <div>
            <label>갤러리</label>
            <hr>
            <img src="main/img/3.jpg" alt="g3">
            <img src="main/img/4.jpg" alt="g4">
            <img src="main/img/5.jpg" alt="g5">
            <img src="main/img/6.jpg" alt="g6">
            <img src="main/img/7.jpg" alt="g7">
            <img src="main/img/8.jpg" alt="g8">
            <img src="main/img/9.jpg" alt="g9">
            <img src="main/img/10.jpg" alt="g10">
        </div>
    </section>
<%@include file="/footer2.jsp" %>
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
