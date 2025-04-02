<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- number type인 input태그 스크롤 없애는 CSS ( 비표준 임) -->
<style>
input::-webkit-inner-spin-button{-webkit-appearance: none; }
</style>
</head>
<body>
<section>
	<article>
    <h2>예약확인</h2>
    <hr>
    <ul>
        <li>ㅇㅇ호텔에 오신것을 환영합니다.</li>
        <li>예약번호를 입력해 주시기 바랍니다.</li>
        <li>※ㅇㅇ호텔에 회원이 되시면 회원만을 위한 특별한 혜택을 받아보실 수 있습니다.</li>
    </ul>
    <form name="ConfirmNumberCheck" action="hotelConfirmNM_ok.jsp" method="post">
	    <fieldset>
	        <div>비회원</div>
	        <div>
		        <label>예약번호&nbsp;</label>
		        <!-- 숫자 이외에 입력 되지 않도록 설정 -->
		        <input type="number" name="confirmNumber" required>&nbsp;
		        <input type="submit" value = "예약확인">
	        </div>
	    </fieldset>
    </form>
	</article>
</section>
</body>
</html>