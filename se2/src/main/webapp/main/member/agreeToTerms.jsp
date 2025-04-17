<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HELIA HOTEL : 약관 동의</title>
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
    
    /** 상단 3개  */
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

/* 공통 버튼 스타일: a 태그, button 태그 모두에 적용 */
.button-container a,
.button-container button {
    display: inline-block;
    padding: 10px 20px;
    margin: 0 1rem;
    font-size: 16px;
    text-decoration: none;
    color: white;
    border: none;
    border-radius: 5px;
    text-align: center;
    transition: background-color 0.3s ease;
    cursor: pointer;
}

/* 다음 버튼 스타일 */
.button-next {
    font-weight: bold;
    background-color: #825517;
}

.button-next:hover {
    background-color: #6d4615;
}

.button-next:active {
    background-color: #56340c;
}

/* 취소 버튼 스타일 */
.button-cancel {
    background-color: #ccc;
    color: black;
}

.button-cancel:hover {
    background-color: #aaa;
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

/** DOM 어쩌구는 모든 웹페이지 로드되고 실행한다는 의미임 /!*/
window.addEventListener("DOMContentLoaded", function () {
   
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


/** 필수 동의 모두 체크해야 넘어감*/
document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("nextBtn").addEventListener("click", function () {
        const agree1 = document.getElementById("agree1").checked;
        const agree2 = document.getElementById("agree2").checked;
        const agree3 = document.getElementById("agree3").checked;

        if (agree1 && agree2 && agree3) {
            // 필수 항목 모두 동의했을 때 페이지 이동
            window.location.href = "memberJoin.jsp";
        } else {
            alert("필수 항목에 모두 동의하셔야 합니다.");
          
        }
    });
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
제1조 멤버십 규정 일반


1. 본 약관은 주식회사 호텔헬리아(이하 “회사”)의 호텔 멤버십 프로그램인 Helia Rewards(이하 “멤버십 프로그램”)의 이용에 관한 기본적인 사항을 정함을 목적으로 합니다.


2. 멤버십 프로그램의 이용약관 및 멤버십 운영에 관련한 각종 혜택 및 서비스의 적용 범위는 다음과 같습니다. (이하 (1)~(3)을 총칭하여 "가맹호텔")


	(1) 헬리아 : 서울헬리아호텔, 울산헬리아호텔

	(2) 그 외 향후 제휴 호텔 및 리조트


3. 회사는 본 약관에서 멤버십 프로그램의 회원 자격과 혜택, 멤버십 포인트 획득과 사용에 관한 내용을 규정합니다.


4. 멤버십 프로그램은 만 19세 이상의 개인 회원을 대상으로 하며, 법인 또는 단체 등은 멤버십에 가입할 수 없습니다.


5. 멤버십 프로그램의 약관, 규칙 중에 신청자 및 회원의 소속 국가 및 거주지의 강행법규에 위배되는 부분이 있을 경우, 해당 부분은 해당 회원에 한하여 무효화 합니다.


6. 회사는 멤버십 운영 주체의 상황에 따라 본 이용약관을 포함한 프로그램 구성, 특전 및 그 내용을 변경하고, 본 멤버십 프로그램을 종료할 수 있습니다.


7. 회사는 본 약관을 변경하는 경우 변경되는 약관의 적용일자 및 변경내용, 사유 등을 명시하여 현행약관과 함께 변경약관 적용일로부터 10일(회원에게 불리하게 변경되는 경우 1개월) 이전에 서면, 전자우편, 홈페이지 공지 등의 방법을 통해 회원에게 통지합니다. 회원은 신라리워즈 멤버십 센터 대표 이메일(shilla.rewards@samsung.com) 또는 대표 번호(02-2230-5528)를 통하여 변경약관에 동의하지 않을 수 있으며, 변경약관에 동의하지 않을 경우 회원 탈퇴를 할 수 있습니다. 단, 회사가 위 약관 변경 통지를 하면서 변경약관 적용일까지 의사표시를 하지 않으면 변경약관에 동의한 것으로 간주한다는 내용을 고지하였음에도 불구하고, 회원이 명시적으로 거부의사를 표시하지 않은 경우 회원이 변경약관에 동의한 것으로 간주합니다. 단, 회원에게 불리하게 변경되는 경우 통지 후 2개월 이내 회원 탈퇴를 할 수 있습니다.


8. 회사는 멤버십 프로그램 종료 최소 6개월 이전에 호텔 공식 웹사이트(https://www.shillahotels.com)및 모바일 앱(신라호텔 어플리케이션)(이하 “멤버십 홈페이지”)을 통해 공지해야 하며, 전 회원을 대상으로 1회 이상 전자우편을 통한 안내문을 발송합니다.


9. 멤버십 프로그램 종료 통보 이후 6개월 경과 시점 기준으로 보유한 포인트는 자동 소멸되며, 모든 혜택 및 서비스 제공이 중단됩니다.


10. 주소 및 기타 개인정보 사항 변경 시 회원은 회사에 해당 내용을 통보해야 하며, 미 통보로 인한 회원의 불이익은 회사가 책임지지 않습니다.


11. 회사는 호텔정보 및 회원의 계정명세 등을 회원에게 통지할 수 있고, 우편에 의한 통지의 경우 그 분실 또는 전달의 지연에 대한 책임을 지지 않습니다.


12. 본 약관은 대한민국 법률이 적용되며, 본 약관과 관련된 제반 분쟁 및 소송은 회원의 주소지, 회사의 소재지를 관할하는 법원을 합의 관할법원으로 합니다.

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

	성명(국문·영문), 생년월일, 성별, 이메일주소, 휴대폰번호, 아이디, 비밀번호, 신라리워즈 번호, IPIN(DI)

2. 수집 이용 목적

	본인 식별, 신라리워즈 서비스 제공 및 민원처리

3. 보유 이용 기간

	회원 탈퇴 시 까지

※ 관련 법령에서 정한 별도 보유 기한이 있는 경우는 그에 따름.
※ 위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 헬리아리워즈 회원 가입 및 서비스 이용이 불가합니다.
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

2. 제공받는 자의 이용 목적

	헬리아리워즈 서비스 제공

3. 제공하는 항목

	성명(국문·영문), 생년월일, 성별, 이메일주소, 휴대폰번호, 아이디, 헬리아리워즈 번호

4. 제공받은 자의 보유·이용 기간

	회원 탈퇴 시까지

※위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 헬리아리워즈 회원 가입 및 서비스 이용이 불가합니다.
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
1. 수집, 이용 항목

	성명(국문·영문), 생년월일, 성별, 이메일주소, 휴대폰번호, 자택전화, 자택주소, 아이디, 헬리아리워즈 번호
	
2. 수집·이용 목적

	㈜호텔헬리아 상품 및 서비스 소개, 헬리아에이치엠㈜ 기타 제휴 호텔의 상품 및 서비스 소개, 사은·판촉행사 안내, 만족도 조사, 시장 조사

3. 보유·이용 기간

	회원 탈퇴 시점 또는 마케팅 활용 동의 철회 시 중 빠른 시점

※ 위 사항에 대한 동의를 거부할 수 있으나, 동의가 없을 경우 개인형 맞춤 상품 안내 등 유용한 정보 안내를 받아보실 수 없습니다.
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
1. 이전되는 개인정보 항목

	성명(국문·영문), 생년월일, 성별, 이메일주소, 휴대폰번호, 아이디 헬리아리워즈 번호

2. 개인정보가 이전되는 국가, 이전일시 및 이전방법

	① 이전되는 국가: 베트남
	② 이전 일시 및 방법: 안전한 네트워크를 통하여 개인정보를 업무 필요 시에 제공

3. 개인정보를 이전 받는 자

	법인명

	주소

	정보보호관리책임자

	QUEVIET - QUANGNAM CO., LTD[제휴호텔 : HELIA
	MONOGRAM QUANG NAM-DANANG(베트남 다낭)]

	Lac Long Quan, Dien Ngoc, Dien Ban District, Quang Nam Province, Vietnam

	privacy@danang.HELIAmonogram.com


4. 개인정보를 이전 받는 자의 개인정보 이용목적 및 보유·이용기간

	① 이용목적: 헬리아리워즈 서비스 제공
	② 보유·이용기간: 회원 탈퇴 또는 국외이전 동의 철회 시까지 중 빠른 시점

5. 개인정보 이전을 거부하는 방법, 절차 및 거부 효과

	국외 이전에 관한 동의 거부를 통하여 개인정보의 국외 이전을 거부할 수 있습니다.
	다만, 국외 이전에 관한 동의를 거부하는 경우, HELIA MONOGRAM QUANG NAM-DANANG(베트남 다낭) 이용 시 헬리아리워즈 포인트 적립 및 혜택 등 헬리아리워즈 서비스를 제공받을 수 없습니다.

※ 해외 제휴점 관련 상세내용은 헬리아리워즈 홈페이지에서 확인할 수 있습니다.

		</textarea><br>


	<div class="agree5">
    <input type="checkbox" name="termsAgree5" class="agreeItem" id="agree5" />
    <label for="agree5">동의함</label>
    <input type="checkbox" id="disagree5" />
    <label for="disagree5">동의하지 않음</label>
    <br><br>
	</div><br>
	
	<div class="button-container">
	
	<button class="button-next" id="nextBtn">다음</button>
    <a href="/se2/index.jsp" class="button-cancel"> 취소 </a>
</div><br><br>
	
	</div>
</div>
</section>
  <%@ include file="/footer.jsp" %>
</body>
</html>