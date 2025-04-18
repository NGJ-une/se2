

/*오시는길 버튼 트리거  */
function setMap(location) {
	const map = document.getElementById('hotelMap');
	const buttons = document.querySelectorAll('.map-btn');
  
  const mapSrc = {
    seoul: "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3022.2901454184985!2d-73.97612382332608!3d40.755642771387116!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c2595b7381bd11%3A0x354857268d76d20f!2zMTExIEUgNDh0aCBTdCwgTmV3IFlvcmssIE5ZIDEwMDE3IOuvuOq1rQ!5e0!3m2!1sko!2skr!4v1744639617409!5m2!1sko!2skr",
    ulsan: "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3879.2277595270143!2d144.80334147591537!3d13.52160958684674!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x671f826093894699%3A0x9dbedb49b2d74286!2s241%20Gun%20Beach%20Road%2C%20Tumon%2C%2096913%20%EA%B4%8C!5e0!3m2!1sko!2skr!4v1744639993099!5m2!1sko!2skr"
  };
  
  map.src = mapSrc[location];
  // active 클래스 토글
  buttons.forEach(btn => btn.classList.remove('active'));
  const clicked = Array.from(buttons).find(btn => btn.textContent.includes(location === 'seoul' ? '서울' : '울산'));
  if (clicked) clicked.classList.add('active');
}
/*************************************************************** */
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

/************************************** */

