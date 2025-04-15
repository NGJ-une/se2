let visibleCards = [];
let currentSlideIndex = 0;

const mainImage = document.getElementById("mainImage");
const mainCaption = document.getElementById("mainCaption");
const thumbnailRow = document.getElementById('thumbnailRow');

// 이미지와 썸네일 상태 업데이트
function showSlide(index) {
  if (!visibleCards.length) return;

  const card = visibleCards[index];
  const imgTag = card.querySelector('img');
  const caption = card.querySelector('p').innerText;

  // 메인 이미지와 캡션 변경
  mainImage.src = imgTag.src;
  mainCaption.innerText = caption;
  currentSlideIndex = index;

  // 썸네일 highlight 처리
  visibleCards.forEach(card => card.classList.remove('selected'));
  card.classList.add('selected');

  // 썸네일이 보이게 자동 스크롤
  card.scrollIntoView({ behavior: "smooth", inline: "center", block: "nearest" });
}

function bindThumbnailClick() {
  visibleCards = Array.from(document.querySelectorAll('.image-card')).filter(card => card.style.display !== 'none');

  visibleCards.forEach((card, index) => {
    card.onclick = () => showSlide(index);
  });

  if (visibleCards.length > 0) {
    showSlide(0); // 초기 표시
  }
}

function nextImage() {
  if (!visibleCards.length) return;
  currentSlideIndex = (currentSlideIndex + 1) % visibleCards.length;
  showSlide(currentSlideIndex);
}

function prevImage() {
  if (!visibleCards.length) return;
  currentSlideIndex = (currentSlideIndex - 1 + visibleCards.length) % visibleCards.length;
  showSlide(currentSlideIndex);
}

function scrollThumbnails(direction) {
  const scrollAmount = 200;
  thumbnailRow.scrollBy({ left: direction * scrollAmount, behavior: 'smooth' });
}

function filterImages(category) {
  const cards = document.querySelectorAll('.image-card');
  const buttons = document.querySelectorAll('.category-tabs button');

  buttons.forEach(btn => btn.classList.remove('active'));
  event.target.classList.add('active');

  cards.forEach(card => {
    if (category === 'all' || card.classList.contains(category)) {
      card.style.display = 'block';
    } else {
      card.style.display = 'none';
    }
  });

  bindThumbnailClick(); // 필터 후 재바인딩
}

window.addEventListener('DOMContentLoaded', () => {
  bindThumbnailClick();
});