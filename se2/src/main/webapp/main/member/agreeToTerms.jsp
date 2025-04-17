<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약관 동의</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        text-align: left;
        margin: 0 auto;
        padding: 0;
    }

    .container {
        width: 100%; /* 기본 크기 유지 */
        max-width: 1200px; /* 최대 크기를 설정해도 좋습니다. 필요에 따라 조정 */
        margin: 0 auto; /* 가운데 정렬 */
    }

    textarea {
        resize: none;
        width: 70%; /* 원래 크기 그대로 유지 */
        height: 5rem;
        padding: 0.5rem;
    }

    .agree-container {
        margin-bottom: 1rem;
    }

    label {
        margin-right: 1rem;
    }
    
    
        .step-wrapper {
        display: flex;
        justify-content: center; /* wrapper 안에서 가운데 정렬 */
    }

    .step-container {
        display: flex;
        gap: 2rem;
    }

    .step {
        text-align: center;
        padding: 1rem;
        border-bottom: 3px solid #ccc;
        color: #888;
        font-weight: bold;
        min-width: 120px;
    }

    .step.active {
        border-bottom: 4px solid #825517;
        color: #000;
       
       }

    .button-container {
        display: flex;
        justify-content: center;
        margin-top: 2rem;
    }

    .button-container a {
        display: inline-block;
        padding: 10px 20px;
        margin: 0 1rem;
        background-color: #825517; /* 버튼 배경 색상 */
        color: white; /* 텍스트 색상 */
        font-size: 16px;
        text-decoration: none; /* 링크 밑줄 없애기 */
        border-radius: 5px; /* 둥근 모서리 */
        text-align: center;
        transition: background-color 0.3s ease;
    }

    .button-container a:hover {
        background-color: #6d4615; /* hover 시 배경 색상 */
    }

    .button-container a:active {
        background-color: #56340c; /* 클릭 시 배경 색상 */
    }

    .button-next {
        font-weight: bold;
    }

    .button-cancel {
        background-color: #ccc; /* 취소 버튼 색상 */
    }

    .button-cancel:hover {
        background-color: #aaa; /* 취소 버튼 hover 색상 */
    }
    
    /** 약관동의 */
    .styled-hr {
    border: 0;
    height: 4px; /* 두께 */
    background-color: #825517; /* 색상 */
    margin: 10px 0; /* 위아래 여백 */
    border-radius: 5px; /* 모서리 둥글게 */
}
    
    /** textarea 꾸며줌*/
	textarea {
    resize: none;
    width: 70%;
    height: 5rem;
    padding: 0.5rem;
    background-color: #FBFBFB; /* 배경색 변경 */
}
    
</style>



<script>
window.addEventListener("DOMContentLoaded", function () {
    // 전체 동의 시 모든 개별 체크박스 체크
    document.getElementById("agreeAll").addEventListener("change", function () {
        const isChecked = this.checked;
        document.querySelectorAll(".agreeItem").forEach(function (box) {
            box.checked = isChecked;
        });
    });

    // '동의함'과 '동의하지 않음'이 서로 배타적으로 작동하도록 설정
    const agreePairs = [
        ["agree1", "disagree1"],
        ["agree2", "disagree2"],
        ["agree3", "disagree3"],
        ["agree4", "disagree4"],
        ["agree5", "disagree5"]
    ];

    agreePairs.forEach(pair => {
        const [agreeId, disagreeId] = pair;
        const agree = document.getElementById(agreeId);
        const disagree = document.getElementById(disagreeId);

        agree.addEventListener("change", () => {
            if (agree.checked) {
                disagree.checked = false;
            }
        });

        disagree.addEventListener("change", () => {
            if (disagree.checked) {
                agree.checked = false;
            }
        });
    });
});


window.addEventListener("DOMContentLoaded", function () {
    // 기존 코드 유지...

    // 마케팅 활용 동의 체크박스 ID
    const agreeMarketing = document.getElementById("agree4");
    const disagreeMarketing = document.getElementById("disagree4");

    // 광고성 정보 수신 체크박스들
    const adCheckboxes = document.querySelectorAll("#selectCheck input[type='checkbox']");

    function toggleAdCheckboxes(disable) {
        adCheckboxes.forEach(cb => {
            cb.disabled = disable;
        });
    }

    // 동의 체크 시 활성화
    agreeMarketing.addEventListener("change", () => {
        if (agreeMarketing.checked) {
            toggleAdCheckboxes(false); // 활성화
        }
    });

    // 동의하지 않음 체크 시 비활성화
    disagreeMarketing.addEventListener("change", () => {
        if (disagreeMarketing.checked) {
            toggleAdCheckboxes(true); // 비활성화
        }
    });

    // 페이지 처음 로드될 때 상태 체크해서 반영
    if (disagreeMarketing.checked) {
        toggleAdCheckboxes(true);
    }
});

</script>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
<div class="container">
	<div class="box" style="padding-top: 1rem;">
	

	<h1 style="color:#56340c;">신라리워즈 가입</h1>  
	<div class="step-wrapper">
    <div class="step-container">
        <div class="step active">약관동의</div>
        <div class="step">회원정보 입력</div>
        <div class="step">가입완료</div>
    </div>
</div>
<br><br>
	    
	    <div style="text-align: center;">
    	<h1 style="color:#825517;">헬리아리워즈에 오신 것을 환영합니다.</h1><br>
    	<label>※ 약관 및 개인정보 수집, 이용사항을 확인하시고 동의여부에 체크해주시기 바랍니다.</label><br><br><br>
		</div>

				<h3 style="color:#514538;"> 약관동의 </h3>
				<hr class="styled-hr"><br>
				<input type="checkbox" id="agreeAll" class="round" />
				<label for="agreeAll">헬리아리워즈 가입 약관 전체 동의</label>
				<br><br>
				

				<label> ※ 전체 동의는 선택사항(동의 내용을 확인한후 개별동의 가능)이며 전체동의 버튼을 체크하면 선택적 수집동의도 동시 진행됩니다</label>
				<br><br><br>
				<b> 헬리아 리워즈 이용약관에 대한 동의 (필수) </b><br><br>
				
		<textarea id="croll1" style="resize: none; width: 100%; height: 5rem; padding: 0.5rem;"
					readonly>

1. 본 약관은 주식회사 호텔신라(이하 “회사”)의 호텔 멤버십 프로그램인 Shilla Rewards(이하 “멤버십 프로그램”)의 이용에 관한 기본적인 사항을 정함을 목적으로 합니다.


</textarea><br>

<!-- --------------------------------------------------------- -->
	<div class="agree1">
    <input type="checkbox" name="termsAgree1" class="agreeItem" id="agree1" />
    <label for="agree1">동의함</label>
    <input type="checkbox" id="disagree1" />
    <label for="disagree1">동의하지 않음</label>
    <br><br>
	</div><hr><br>
	


	
	<b> 개인정보 수집, 이용에 대한 동의 (필수) </b><br><br>
		<textarea id="croll2" style="resize: none; width: 100%; height: 5rem; padding: 0.5rem;"
					readonly>
		1. 수집 이용 항목

		
	
		</textarea><br>

	<div class="agree2">
    <input type="checkbox" name="termsAgree2" class="agreeItem" id="agree2" />
    <label for="agree2">동의함</label>
    <input type="checkbox" id="disagree2" />
    <label for="disagree2">동의하지 않음</label>
    <br><br>
	</div><hr><br>
	
<!-- ------------------------------------------------- -->
	<b> 개인정보 제3자 제공에 대한 동의(필수) </b><br><br>
		<textarea id="croll3" style="resize: none; width: 100%; height: 5rem; padding: 0.5rem;"
					readonly>
		1. 제공받는 자

		헬리아에이치엠㈜

	

		회원 탈퇴 시까지

		※위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 신라리워즈 회원 가입 및 서비스 이용이 불가합니다.
		</textarea><br>

	<div class="agree3">
    <input type="checkbox" name="termsAgree3" class="agreeItem" id="agree3" />
    <label for="agree3">동의함</label>
    <input type="checkbox" id="disagree3" />
    <label for="disagree3">동의하지 않음</label>
    <br><br>
	</div><hr><br>
	<!-- ------------------------------------------------------- -->
	
	
		<b> 개인정보 마케팅 활용 동의 (선택) </b><br><br>
		<textarea id="croll4" style="resize: none; width: 100%; height: 5rem; padding: 0.5rem;"
					readonly>
		1. 제공받는 자

		헬리아에이치엠㈜

		2. 제공받는 자의 이용 목적

		※위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 신라리워즈 회원 가입 및 서비스 이용이 불가합니다.
		</textarea><br>

	<div class="agree4">
    <input type="checkbox" name="termsAgree4" class="agreeItem" id="agree4" />
    <label for="agree4">동의함</label>
    <input type="checkbox" id="disagree4" />
    <label for="disagree4">동의하지 않음</label>
    <br><br>
	</div>
	<!-- -------------------------------------------------- -->
	
	<div style="background: #eee">
		<b> 매체별 광고성 정보 수신 동의 (선택) </b><br><br>
		<div id="selectCheck" >
		   <input type="checkbox" >전체
		   <input type="checkbox" >lMS
		   <input type="checkbox" >뉴스레터
		</div>
	
			<label>※ 통지할 정보가 없거나, 정확하지 않은 정보인 경우 처리결과를 수신하지 못할 수 있음을 알려드립니다.</label><br>
	</div>
	<br><hr><br>
	
	<!-- ----------------------------------------------------- -->
	
			<b> 개인정보 제3자 제공 및 국외이전 동의 (선택) </b><br><br>
		<textarea id="croll5" style="resize: none; width: 100%; height: 5rem; padding: 0.5rem;"
					readonly>
		1. 제공받는 자

		헬리아에이치엠㈜

		2. 제공받는 자의 이용 목적

		신라리워즈 서비스 제공

		</textarea><br>

	<div class="agree5">
    <input type="checkbox" name="termsAgree5" class="agreeItem" id="agree" />
    <label for="agree5">동의함</label>
    <input type="checkbox" id="disagree5" />
    <label for="disagree5">동의하지 않음</label>
    <br><br>
	</div>
	
	<div class="button-container">
    <a href="memberJoin.jsp" class="button-next"> 다음 </a>
    <a href="/se2/index.jsp" class="button-cancel"> 취소 </a>
</div><br><br>
	
	</div>
</div>
</section>
  <%@ include file="/footer.jsp" %>
</body>
</html>