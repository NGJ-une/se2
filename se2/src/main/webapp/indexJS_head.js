/**추천객실 및 최하단 갤러리 바로가기 하이퍼링크 */
const pageMape={
	gallery_seoul :'/se2/gallery/gallery_seoul.jsp',
	seoul_grand :'/se2/hotel_Seoul/menubar/room/grand.jsp',
	ulsan_standard :'/se2/hotel_Ulsan/menubar/room/standard.jsp',
	seoul_suite :'/se2/hotel_Seoul/menubar/room/sweet.jsp',
	ulsan_grand :'/se2/hotel_Ulsan/menubar/room/grand.jsp',
	seoul_deluxe :'/se2/hotel_Seoul/menubar/room/deluxe.jsp',
};
function movePage(key) {
	const url=pageMape[key];
	if(url) location.href=url;
}
/****************************************************************/

document.addEventListener("DOMContentLoaded", function() {

	const now = new Date();
	const today = new Date().toISOString().split('T')[0];
	const tomorrow = new Date(now);
	tomorrow.setDate(now.getDate() + 1);

  	const checkInInput = document.getElementById('checkIn');
	const checkOutInput = document.getElementById('checkOut');

	checkInInput.value = today;
	checkOutInput.value = tomorrow.toISOString().split('T')[0];
	checkInInput.setAttribute('min', today);
	checkOutInput.setAttribute('min', checkInInput.value ? checkInInput.value : today);
	checkInInput.setAttribute('max', checkOutInput.value);

	const nights = document.getElementById('nights');

	function computeNights() {
		let stay = (checkInInput.value && checkOutInput.value) ? 
			Math.abs(new Date(checkOutInput.value) - new Date(checkInInput.value)) / (1000 * 60 * 60 * 24) + '박' : '숙박기간';

		return stay;
	}

	checkOutInput.addEventListener('change', function() {
		if (checkOutInput.value)
			checkInInput.setAttribute('max', checkOutInput.value);
		else
			checkInInput.removeAttribute('max');

		nights.innerHTML = computeNights();
	});

	checkInInput.addEventListener('change', function() {
		checkOutInput.setAttribute('min', checkInInput.value ? checkInInput.value : today);

		nights.innerHTML = computeNights();
	});


	document.querySelectorAll('input[type="date"], input[type="number"]').forEach(element => {
		element.addEventListener('keydown', (event) => {
			event.preventDefault();
		});
	});

	const numberInputs = document.querySelectorAll('input[type="number"]');

	function limitHeadCount(event) {
		const headCount = Array.from(numberInputs).reduce((acc, input) => acc + Number(input.value), 0);

		if (headCount > 6) {
			alert('총 인원은 6명까지 가능합니다');
			event.target.value = event.target.getAttribute('prev-value') || 0;
		} else {
			event.target.setAttribute('prev-value', event.target.value);
		}
	}

	numberInputs.forEach(numberInput => {
		numberInput.setAttribute('prev-value', numberInput.value);
		numberInput.addEventListener('change', limitHeadCount);
	});

});