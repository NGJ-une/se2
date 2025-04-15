

function show2(){
	location.href='/se2/gallery/gallery_seoul.jsp';
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
	checkInInput.setAttribute('min', today);
	checkOutInput.value = tomorrow.toISOString().split('T')[0];
	checkOutInput.setAttribute('min', checkInInput.value ? checkInInput.value : today);
	checkInInput.setAttribute('max', checkOutInput.value);

	const nights = document.getElementById('nights');

	function computeNights() {
		let stay = Math.abs(new Date(checkOutInput.value) - new Date(checkInInput.value)) / (1000 * 60 * 60 * 24);
		return stay + '박';
	}

	checkOutInput.addEventListener('change', function() {
		if (!checkInInput.value) {
			alert('체크인 날짜를 먼저 입력하세요');
			checkOutInput.value = '';
			checkInInput.focus();
		}

		nights.innerHTML = computeNights();
	});

	checkInInput.addEventListener('change', function() {
		checkOutInput.setAttribute('min', checkInInput.value);

		nights.innerHTML = computeNights();
	});

	checkOutInput.addEventListener('change', function() {
		checkInInput.setAttribute('max', checkOutInput.value);
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