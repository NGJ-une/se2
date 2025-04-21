<%@page import="java.time.temporal.ChronoUnit"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>HELIA HOTEL : 결제</title>
<jsp:useBean id="reserDTO" class="com.hotel.reser.ReserDTO"></jsp:useBean>
<jsp:setProperty property="*" name="reserDTO"/>
<link rel="stylesheet" type="text/css" href="/se2/main/hotelReser/paymentLayout.css">

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
					<div class="step-indicator">
					  <div class="step-circle">1</div>
					  <div class="step-line"></div>
					  <div class="step-circle active">2</div>
					</div>
					<h1 class="payment-title">결제하기</h1>
					
					<div class="payment-container">
						
							<table class="payment-table">
						  		
								<tr>
								<th colspan="4" style="width:600px;">예약 정보 확인</th>
								<th colspan="4" style="width:400px; border-left: 6px double #ddd;">결제 정보 확인</th>
								</tr>
								<tr>
									<td rowspan="2" colspan="2"><img alt="<%= imgSrc %>" src="/se2/room_img/<%= imgSrc %>"></td>
									<td><label>방 종류</label></td>
									<td><input type="text" value="<%= selectedType.substring(2) %>" readonly></td>
									<td colspan="2" style="border-left: 6px double #ddd;"><label>아이디</label></td>
									<td colspan="2"><%= (String)session.getAttribute("sessionid") %> 님</td>
								</tr>			
								<tr>			
									<td><label>금액</label></td>
									<td><%= selectedType.substring(2) %>: <%= selectedMoney %> 원</td>		
									<td colspan="2" style="border-left: 6px double #ddd;"><label>보유 자금</label></td>
									<td colspan="2"><%=balance %> 원</td>		
								</tr>		
								<tr>		
									<td><label>체크인</label></td>
									<td colspan="3"><input type="date" name="checkInStr" value="<%= checkInStr %>" readonly></td>
									<td colspan="2" style="border-left: 6px double #ddd;"><label>등급</label></td>
									<td colspan="2">
									<span class="grade-<%= grade.toLowerCase() %>">
													<%
					                if(grade.equals("BRONZE")){
				                    %><img src="/se2/css/img/icon_BRONZE.png" style="width:20px; height:20px;"><%
					                }else if(grade.equals("SILVER")){
				                    %><img src="/se2/css/img/icon_SILVER.png" style="width:20px; height:20px;"><%
					                }else if(grade.equals("GOLD")){
				                    %><img src="/se2/css/img/icon_GOLD.png" style="width:20px; height:20px;"><%
					                }else if(grade.equals("DIAMOND")){
				                    %><img src="/se2/css/img/icon_DIAMOND.png" style="width:20px; height:20px;"><%
					                }%>
									<%= grade %></span>
									</td>
								</tr>	
								<tr>
									<td><label>체크아웃</label></td>
									<td colspan="3"><input type="date" name="checkOutStr" value="<%= checkOutStr %>" readonly></td>
									<td colspan="2" style="border-left: 6px double #ddd;"><label>할인</label></td>
									<td colspan="2"><span class="dcRate"><%= dcRate %>%</span></td>
								</tr>			
								<tr>		
									<td><label>성인</label></td>
									<td><input type="number" name="adult" value="<%= reserDTO.getAdult() %>" readonly></td>
									<td rowspan="3"><label>총원</label></td>
									<td rowspan="3"><input type="text" value="<%= reserDTO.getAdult() + reserDTO.getKid() + reserDTO.getBaby() %> 명" readonly></td>
									<td colspan="2" style="border-left: 6px double #ddd;"><label>숙소금액</label></td>
									<td colspan="2"><%=selectedMoney * nights %>원 (<%= nights %>박)</td>
								</tr>	
								<tr>
									<td><label>어린이</label></td>
									<td><input type="number" name="kid" value="<%= reserDTO.getKid() %>" readonly></td>
									<td colspan="2" style="border-left: 6px double #ddd;"><label>최종결제금액</label></td>
									<td colspan="2"><%= dcPrice * nights %></td>
								</tr>
								<tr>
									<td><label>유아</label></td>
									<td><input type="number" name="baby" value="<%= reserDTO.getBaby() %>" readonly></td>
									<td colspan="2" style="border-left: 6px double #ddd;"><label>결제 후 잔액</label></td>
									<td colspan="2"><%= balance - dcPrice * nights %>원</td>
								</tr>
								<tr>
									<td colspan="4"></td>
									<td colspan="4" class="payment-bt" style="border-left: 6px double #ddd;">

									<%
									    if (dcPrice * nights <= balance){
									    %>
											    		<div style="text-align: right; margin-top: 5px;">
											    			<input type="submit" value="결제하기">
									    <%
									    } else{
									    %>
											    			<span class="icons"></span>잔액이 부족합니다<br>
											    			<input type="button" value="충전하기" onclick="window.location.href = '/se2/main/myPage/deposit.jsp'">
									    <%
									    }	
									    %>
									    					<input type="button" value="취소" onclick="window.location.href = '/se2/main/hotelReser/hotelReser.jsp'">
														</div>
								</td>
								</tr>
							</table>
						
					</div>
					<div class="notice-accordion">
					  <div class="notice-header" onclick="toggleNotice()">
					    유의 사항 <span id="notice-icon">▲</span>
					  </div>
					  <div class="notice-body" id="notice-body">
					    <p>
					      <strong>호텔 이용안내</strong><br><br>
					      - 부가가치세 10%가 포함된 금액입니다.<br>
					      - 2인 1실 기준<br>
					      - 체크인 시 등록자 본인 및 투숙객 본인 확인을 위해 본인 사진이 포함된 신분증을 반드시 제시해 주시기 바랍니다.<br>
					      - 만 12세 이하 어린이는 객실 인원 추가 요금을 받지 않습니다.<br>
					      - 37개월 미만 유아는 조식이 무료입니다.<br>
					      - 안전관리를 위해 반려동물 동반 투숙은 불가합니다.<br>
					      - 부모 등 법적대리인을 동반하지 않은 만 19세 미만 미성년자는 투숙할 수 없습니다.<br>
					      - 쓰레기 분리수거에 협조 부탁드립니다.<br>
					      - 자세한 문의는 ☎ 02-2230-0700으로 부탁드립니다.<br>
					      - 차량 이용 시 1대당 10,000원의 주차요금이 부과됩니다 (건물 내/외 구분 있음).<br>
					      - 투숙 당일 오후 1시까지 주차 가능하며, 초과 시 시간당 5,000원이 추가됩니다.<br>
					    </p>
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
<script>
function toggleNotice() {
  const body = document.getElementById('notice-body');
  const icon = document.getElementById('notice-icon');
  if (body.style.display === 'none') {
    body.style.display = 'block';
    icon.innerText = '▲';
  } else {
    body.style.display = 'none';
    icon.innerText = '▼';
  }
}
</script>
</html>
