<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Payment</title>
<style>
.payment h1 {
	font-size: 45px;
	margin-left: 10%;
	color: #6b4c2f;
}

.roomInfo {
	width: 1080px;
	margin: 20px auto;
	border-radius: 12px;
	border-color: #c34a36;
}

.roomInfo legend {
	color: #c34a36;
}

.roomInfo input {
	border: 0px;
	font-size: 18px;
	margin: 10px;
}

.roomInfo label {
	font-size: 15px;
	color: #6b4c2f;
	margin: 10px;
	font-weight: bold;
}

.roomInfo img {
	width: 160px;
	height: 110px;
	float: left;
	margin-right: 10px;
}

.payment-container {
	width: 700px;
	margin: 20px auto;
	text-align: right;
	padding: 10px;
}

.payment-notice{
	float: left;
	width: 300px;
	height: 200px;
}

.payment-notice textarea{
	width: 400px;
	height: 150px;
	border: 1px double #E4D9C7;
	font-size: 15px;
}

.payment-container ul {
	list-style-type: none;
}
.grade-diamond { color: #8e44ad; font-weight: bold; }
.grade-gold { color: #f39c12; font-weight: bold; }
.grade-silver { color: #3498db; font-weight: bold; }
.grade-bronze { color: #795548; font-weight: bold; }
@keyframes golden-glow{
	0% {
		text-shadow: 0 0 10px #ffd700,
					 0 0 20px #ffd700,
					 0 0 30px #ffc400,
					 0 0 40px #ffa500,
					 0 0 50px #ff8c00,
					 0 0 75px #ff4500;
	}
	25%{
		text-shadow: 0 0 20px #ffd700,
					 0 0 30px #ffc400,
					 0 0 40px #ffa500,
					 0 0 50px #ff8c00,
					 0 0 75px #ff4500,
					 0 0 100px #ff0000;
	}
	50% {
		text-shadow: 0 0 30px #ffd700,
					 0 0 50px #ffc400,
					 0 0 70px #ffa500,
					 0 0 100px #ff8c00,
					 0 0 120px #ff4500,
					 0 0 150px #ff0000;
	}
	75%{
		text-shadow: 0 0 20px #ffd700,
					 0 0 30px #ffc400,
					 0 0 40px #ffa500,
					 0 0 50px #ff8c00,
					 0 0 75px #ff4500,
					 0 0 100px #ff0000;
	}
	100% {
		text-shadow: 0 0 10px #ffd700,
					 0 0 20px #ffd700,
					 0 0 30px #ffc400,
					 0 0 40px #ffa500,
					 0 0 50px #ff8c00,
					 0 0 75px #ff4500;
	}
}
.balance {
	color: white;
	background: linear-gradient(90deg, #ffd700, #ffa500, #ff4500);
	border-radius: 5px;
	font-weight: bold;
	animation: golden-glow 2s infinite;
}

.dcRate {
	color: red;
	font-style: italic;
}

.orgPrice {
	opacity: 0.3;
	text-decoration: line-through;
}

.dcPrice {
	color: maroon;
	text-shadow: 0 1px 1px olive;
}
</style>
</head>
<jsp:useBean id="reserDTO" class="com.hotel.reser.ReserDTO"></jsp:useBean>
<jsp:setProperty property="*" name="reserDTO"/>
<%
request.setCharacterEncoding("utf-8");

String grade = (String)session.getAttribute("grade");
int balance = (int)session.getAttribute("balance");
int dcRate = (int)session.getAttribute("dcRate");

String selectedRow = request.getParameter("selectedRow");
String selectedType = request.getParameter("type_" + selectedRow);

int selectedMoney = Integer.parseInt(request.getParameter("money_" + selectedRow));
int dcPrice = selectedMoney * (1 - (int)session.getAttribute("dcRate"));

String checkInStr = request.getParameter("checkInStr");
String checkOutStr = request.getParameter("checkOutStr");
String imgSrc = request.getParameter("img");
%>
<body>
<%@ include file="/header.jsp" %>
	<section>
		<article>
			<form action="/se2/main/hotelReser/hotelReser_ok.jsp" name="payment" class="payment" method="post">
					<h1>예약하기</h1>
					<fieldset class="roomInfo">
						<legend>예약 정보 확인</legend>
						<img alt="<%= imgSrc %>" src="/se2/room_img/<%= imgSrc %>">
						<label>방 종류</label><input type="text" name="type" value="<%= selectedType %>" readonly><br>
						<label>체크인</label><input type="date" name="checkInStr" value="<%= checkInStr %>" readonly>
				    	<label>체크아웃</label><input type="date" name="checkOutStr" value="<%= checkOutStr %>" readonly><br>
				    	<label>성인</label><input type="number" name="adult" value="<%= reserDTO.getAdult() %>" readonly>
				    	<label>어린이</label><input type="number" name="kid" value="<%= reserDTO.getKid() %>" readonly>
				    	<label>유아</label><input type="number" name="baby" value="<%= reserDTO.getBaby() %>" readonly>
					</fieldset>
				<div class="payment-container">
					<span class="payment-notice">
						<textarea readonly>
							결제 시 유의사항
						 	1. 결제 정보 정확성 
						 	확인 결제에 사용되는 카드 정보, 주소 및 연락처 정보를 정확하게 입력해 주세요.
						 	 잘못된 정보 입력으로 인한 문제는 호텔에서 책임지지 않습니다. 
							2. 결제 수단 현재
							호텔은 신용카드, 체크카드, 온라인 결제 시스템 등 다양한 결제 수단을 지원합니다.
							결제 수단에 따라 추가 수수료가부과될 수 있습니다. 
							3. 예약 확정 
							결제가 완료되면 예약이 확정됩니다. 결제 전 예약 내용을 다시 한 번 확인해 주세요.
							결제 완료 후에는 예약 변경이나 취소가 제한될 수 있습니다. 
							4. 환불 정책 
							환불이 필요한 경우, 호텔의 환불 정책을 확인해주세요.
							환불은 결제 수단에 따라 다르게 처리될 수 있으며, 일부 예약은 환불이 불가할 수 있습니다. 
							5. 보안 모든 결제
							정보는 SSL 암호화로 안전하게 처리됩니다.
							결제 정보를 입력하는 페이지는 보안이 강화된 환경에서만 사용되므로 안심하고 결제하셔도 됩니다.
							6. 예약 변경 및 취소
							예약 변경 또는 취소가 필요한 경우, 호텔의 정책에 따라 제한이 있을 수 있습니다.
							예약 전 취소 및 변경 조건을 꼭 확인해 주세요.
							7. 기타 
							결제 후 발생한 오류나 문제에 대해서는 고객센터를 통해 문의해 주시기 바랍니다.
							결제 관련 문의는 [고객센터 연락처]로 해주시면 빠르게 처리해 드리겠습니다.
						</textarea>
					</span>
					<ul>
						<li class="grade-<%= grade.toLowerCase() %>">회원 등급: <%= grade %> 
						<li><span class="balance">보유 자금: <%= balance %> 원</span>
						<li><br>
						<li class="dcRate">-<%= dcRate %>% 할인
						<li class="orgPrice"><%= selectedMoney %> 원
						<li class="dcPrice"><%= dcPrice %> 원
					</ul>
				</div>
				<div class="payment-container">
		    <%
		    if (dcPrice <= balance){
		    %>
				    	<span>결제 후 잔액: <%= balance - dcPrice %></span><br> 
				    	<input type="submit" value="결제하기">
		    <%
		    } else{
		    %>
				    	<span>잔액이 부족합니다</span><br>
				    	<input type="button" value="충전하기" onclick="window.location.href = '/se2/main/myPage/deposit.jsp'">
		    <%
		    }
		    %>
		    			<input type="button" value="취소" onclick="window.location.href = '/se2/main/hotelReser/hotelReser.jsp'">
		    	</div>
		    	<input type="hidden" name="id" value="<%= (String)session.getAttribute("sessionid") %>">
				<input type="hidden" name="name" value="<%= reserDTO.getName() %>">
		    	<input type="hidden" name="money" value="<%= dcPrice %>">
			</form>
		</article>
	</section>
<%@ include file="/footer.jsp" %>
</body>
</html>