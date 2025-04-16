function fadeOut(event, el) {
  event.preventDefault();
  document.body.style.transition = 'opacity 0.5s';
  document.body.style.opacity = 0;

  setTimeout(() => {
    window.location.href = el.href;
  }, 500);
  
}