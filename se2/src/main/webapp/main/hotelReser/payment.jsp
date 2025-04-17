<%@page import="java.time.temporal.ChronoUnit"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HELIA HOTEL : 결제</title>
<jsp:useBean id="reserDTO" class="com.hotel.reser.ReserDTO"></jsp:useBean>
<jsp:setProperty property="*" name="reserDTO"/>
<style>
.payment-title {
	font-size: 45px;
	margin-left: 10%;
	color: #6b4c2f;
	margin-top: 20px;
}
.payment-container {
	margin: 0px auto;
	height: auto;
	display:flex;
}
.roomInfo {
	padding: 10px;
}

.roomInfo fieldset {
	margin: 10px;
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
	padding: 10px;
	background-color: #fffdfb;
}

.roomInfo input[type=number]{
	width: 80px;
}

.roomInfo label {
	font-size: 15px;
	color: #6b4c2f;
	margin: 10px;
	font-weight: bold;
}

.roomInfo fieldset img {
	width: 220px;
	height: 170px;
	float: left;
	margin-left: 10px;
	margin-right: 10px;
}

.payment-notice {
	width: 900px;
	height: auto;
	margin-left: 30px;
}
.payment-notice p {
	margin: 10px;
}
.payment-info {
	width: 300px;
	text-align: left;
	padding: 10px;
	background-color: white;
	height : 700px;;
	position: sticky;
	top: 220px;
	border: 2px dashed #c34a36;
}

.payment-info-list ul {
	list-style-type: none;
	font-size: 18px;
}
.payment-info-list-bold{
	font-weight: bold;
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

.user-id {
	color: #f85df8;
	font-weight: bolder;
}

.balance {
	color: white;
	background: linear-gradient(90deg, #ffd700, #ffa500, #ff4500);
	border-radius: 5px;
	font-weight: bold;
	animation: golden-glow 2s infinite;
	padding: 5px;
}

.dcRate {
	color: red;
	font-style: italic;
}

.total-price {
	font-weight: bold;
}

.payment-confirm{
	display: inline-block;
	margin-top: 20px;
	padding: 10px;
	font-size: 18px;
	border-top: 1px solid black;
	width: 240px;
}

.payment-confirm input {
	margin: 5px;
	padding: 5px;
	font-size: 15px;
}

.icons {
	font-size: 28px;
}
</style>
<%
if (session.getAttribute("sessionid") == null){
%>
<script>
	alert('로그인 후 사용 가능');
	window.location.href = '/se2/main/member/login.jsp';	
</script>
<% 
	return;
}
request.setCharacterEncoding("utf-8");

String grade = (String)session.getAttribute("grade");
int balance = (int)session.getAttribute("balance");
int dcRate = (int)session.getAttribute("dcRate");

String selectedRow = request.getParameter("selectedRow");
String selectedType = request.getParameter("type_" + selectedRow);

int selectedMoney = Integer.parseInt(request.getParameter("money_" + selectedRow));
int dcPrice = (int)Math.floor(selectedMoney * (1 - dcRate / 100.0)) ;

String checkInStr = request.getParameter("checkInStr");
String checkOutStr = request.getParameter("checkOutStr");
int nights = (int)ChronoUnit.DAYS.between(LocalDate.parse(checkInStr), LocalDate.parse(checkOutStr));
String imgSrc = request.getParameter("img");
%>
</head>
<body>
<%@ include file="/header.jsp" %>
	<section class="section">
		<article>
			<div class="wrapper">
				<form action="/se2/main/hotelReser/hotelReser_ok.jsp" name="payment" method="post">
					<h1 class="payment-title">예약하기</h1>
					<div class="payment-container">
						<div class="">
							<div class="roomInfo">
								<fieldset>
									<legend>예약 정보 확인</legend>
									<img alt="<%= imgSrc %>" src="/se2/room_img/<%= imgSrc %>">
									<label>방 종류</label><input type="text" value="<%= selectedType.substring(2) %>" disabled><br>
									<label>체크인</label><input type="date" name="checkInStr" value="<%= checkInStr %>" readonly>
								    <label>체크아웃</label><input type="date" name="checkOutStr" value="<%= checkOutStr %>" readonly><br>
								    <label>성인</label><input type="number" name="adult" value="<%= reserDTO.getAdult() %>" readonly>
								    <label>어린이</label><input type="number" name="kid" value="<%= reserDTO.getKid() %>" readonly>
								    <label>유아</label><input type="number" name="baby" value="<%= reserDTO.getBaby() %>" readonly>
								</fieldset>
							</div>
							<div class="payment-notice">
								<p>
									결제 시 유의사항<br><br>
								 	1. 결제 정보 정확성 확인<br><br>
								 	 결제에 사용되는 카드 정보, 주소 및 연락처 정보를 정확하게 입력해 주세요.<br>
								 	 잘못된 정보 입력으로 인한 문제는 호텔에서 책임지지 않습니다.<br><br> 
									2. 결제 수단<br><br>
									현재 호텔은 신용카드, 체크카드, 온라인 결제 시스템 등 다양한 결제 수단을 지원합니다.<br>
									결제 수단에 따라 추가 수수료가부과될 수 있습니다.<br><br> 
									3. 예약 확정<br><br> 
									결제가 완료되면 예약이 확정됩니다. 결제 전 예약 내용을 다시 한 번 확인해 주세요.<br>
									결제 완료 후에는 예약 변경이나 취소가 제한될 수 있습니다.<br><br> 
									4. 환불 정책<br><br> 
									환불이 필요한 경우, 호텔의 환불 정책을 확인해주세요.<br>
									환불은 결제 수단에 따라 다르게 처리될 수 있으며, 일부 예약은 환불이 불가할 수 있습니다.<br><br> 
									5. 보안<br><br>
									모든 결제 정보는 SSL 암호화로 안전하게 처리됩니다.<br>
									결제 정보를 입력하는 페이지는 보안이 강화된 환경에서만 사용되므로 안심하고 결제하셔도 됩니다.<br><br>
									6. 예약 변경 및 취소<br><br>
									예약 변경 또는 취소가 필요한 경우, 호텔의 정책에 따라 제한이 있을 수 있습니다.<br>
									예약 전 취소 및 변경 조건을 꼭 확인해 주세요.<br><br>
									7. 기타<br><br> 
									결제 후 발생한 오류나 문제에 대해서는 고객센터를 통해 문의해 주시기 바랍니다.<br>
									결제 관련 문의는 [고객센터 연락처]로 해주시면 빠르게 처리해 드리겠습니다.<br>
								</p>
							</div>
						</div>
						<div class="payment-info">
							<div class="payment-info-list">
								<ul>
									<li class="user-id"><span class="icons">🤩</span> <%= (String)session.getAttribute("sessionid") %> 회원님
									<li><br>
									<li><span class="icons">🤑</span><span class="balance">보유 자금: <%= balance %> 원</span>
									<li><br>
									<li class="payment-info-list-bold">&#8251; 숙소 금액
									<li><br>
									<li><%= selectedType.substring(2) %>: <%= selectedMoney %> 원
									<li><br>
									<li class="payment-info-list-bold">&#8251; 등급 및 할인
									<li><br>
									<li>등급: <span class="grade-<%= grade.toLowerCase() %>"><%= grade %></span>
									<li>할인 : <span class="dcRate"><%= dcRate %>%</span>
									<li><br>
									<li class="payment-info-list-bold">&#8251; 최종 결제 금액
									<li><br>
									<li><%= selectedMoney * nights %>원 (<%= nights %>박)
									<li>- <%= (int)(selectedMoney * nights * dcRate / 100.0) %>원 (<%= dcRate %>% 할인)
									<li>--------------------------------------
									<li class="total-price">= <%= dcPrice * nights %>원 <span class="icons">👍</span>
								</ul>
							</div>
							<div class="payment-confirm">
			    <%
			    if (dcPrice * nights <= balance){
			    %>
					    		<span class="icons">😘</span>결제 후 잔액: <%= balance - dcPrice * nights %>원<br> 
					    		<div style="text-align: right; margin-top: 5px;">
					    			<input type="submit" value="결제하기">
			    <%
			    } else{
			    %>
					    			<span class="icons">🤬</span>잔액이 부족합니다<br>
					    			<input type="button" value="충전하기" onclick="window.location.href = '/se2/main/myPage/deposit.jsp'">
			    <%
			    }
			    %>
			    					<input type="button" value="취소" onclick="window.location.href = '/se2/main/hotelReser/hotelReser.jsp'">
								</div>
							</div>
						</div>
					</div>
			    	<input type="hidden" name="id" value="<%= (String)session.getAttribute("sessionid") %>">
					<input type="hidden" name="type" value="<%= selectedType %>">
					<input type="hidden" name="name" value="<%= reserDTO.getName() %>">
			    	<input type="hidden" name="money" value="<%= dcPrice * nights %>">
			    	<input type="hidden" name="orgPrice" value="<%= selectedMoney * nights %>">
				</form>
			</div>
		</article>
	</section>
<%@ include file="/footer.jsp" %>
</body>
</html>