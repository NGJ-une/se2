<%@page import="org.apache.coyote.http11.upgrade.UpgradeServletInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Date" %>
<%@ page import="com.hotel.reser.RoomDTO" %>
<jsp:useBean id="userInfo" class="com.hotel.member.MemberDTO" scope="session"></jsp:useBean>
<jsp:useBean id="reserDAO" class="com.hotel.reser.ReserDAO"></jsp:useBean>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/se2/css/commonsLayout.css">
    <title>HELIA HOTEL : 예약</title>
    <style>
    .section{
    	min-height: 700px;
    }
	.reser-title {
		font-size: 45px;
		margin-left: 10%;
		color: #6b4c2f;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	
	.reser-fieldset {
		text-align: center;
		border: 0px;
		margin-bottom: 20px;
	}
	
	.reser-fieldset input, .reser-fieldset select {
		margin: 10px 15px 10px 15px;
		border-radius: 5px;
		padding: 5px;
	}
	
	.reser-fieldset input[type=date]{
		width: 100px;
	}
	
	.reser-fieldset label {
		font-weight: 100%;
		font-size: 15px;
		margin: 10px 15px 10px 15px
	}
	
	.reser-fieldset input, .reser-fieldset select, reser-search-result input {
		border: 1px solid #E4D9C7;
	}
	
	.reser-search-result {
		margin: 0px auto;
		text-align: center;
		width: 90%;
		border-collapse: collapse;
		border: 1px solid #E4D9C7;
		font-size: 15px;
	}
	
	.reser-search-result th {
		background-color: #E4D9C7;
		padding: 10px;
	}
	
	.reser-search-result td {
		border-top: 1px solid #E4D9C7;
		padding: 10px;
	}
	
	.reser-search-result img {
		width: 160px;
		height: 90px;
	}
	
	.reser-search-result input[type=submit]{
		padding: 5px;
		border: 1px solid #6b4c2f;
		border-radius: 5px;
	}
	
	.img-cell {
		width: 160px;
	}
</style>
    <script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function(){
		
		const today = new Date().toISOString().split('T')[0];
		
		const checkInInput = document.getElementById('checkIn');
		const checkOutInput = document.getElementById('checkOut');

		checkInInput.setAttribute('min', today);
		if (checkOutInput.value)
			checkInInput.setAttribute('max', checkOutInput.value);
		
		checkOutInput.setAttribute('min', checkInInput.value ? checkInInput.value : today);

		
		checkOutInput.addEventListener('change', function(){
			if (checkOutInput.value)
				checkInInput.setAttribute('max', checkOutInput.value);
			else
				checkInInput.removeAttribute('max');
		});

		checkInInput.addEventListener('change', function(){
			checkOutInput.setAttribute('min', checkInInput.value ? checkInInput.value : today);
		});
		
		
		document.querySelectorAll('input[type="date"], input[type="number"]').forEach(element => {
			element.addEventListener('keydown', (event) => {
				event.preventDefault();
			});
		});
		
		
		const numberInputs = document.querySelectorAll('input[type="number"]');

		function limitHeadCount(event){
			const headCount = Array.from(numberInputs).reduce((acc, input) => acc + Number(input.value), 0);

			if (headCount > 6){
				alert('총 인원은 6명까지 가능합니다');
				event.target.value = event.target.getAttribute('prev-value') || 0;
			}
			else{
				event.target.setAttribute('prev-value', event.target.value);
			}
		}

		numberInputs.forEach(numberInput => {
			numberInput.setAttribute('prev-value', numberInput.value);
			numberInput.addEventListener('change', limitHeadCount);
		});
	});
    </script>
</head>
<%
String name = request.getParameter("name");
String checkInStr = request.getParameter("checkIn");
String checkOutStr = request.getParameter("checkOut");
String adultStr = request.getParameter("adult");
String kidStr = request.getParameter("kid");
String babyStr = request.getParameter("baby");
%>
<body>
<%@ include file="/header.jsp" %>
    <section class="section">
	   	<article>
	   		<div class="wrapper">
			   	<h1 class="reser-title">예약하기</h1>
			    <hr>
			    <form action="/se2/main/hotelReser/hotelReser.jsp" name="hotelReserSearch" method="get">
			        <fieldset class="reser-fieldset">
			            <div>
			                <label>지역</label>
			                <select name="name">
			                    <option value="h_seoul" <%= "h_seoul".equals(name) ? "selected" : "" %>>서울</option>
			                    <option value="h_ulsan" <%= "h_ulsan".equals(name) ? "selected" : "" %>>울산</option>
			                </select>
			                <label>체크인</label>
			                <input type="date" name="checkIn" id="checkIn" value="<%= checkInStr != null ? checkInStr : "" %>" required>
			                <label>체크아웃</label>
			                <input type="date" name="checkOut" id="checkOut" value="<%= checkOutStr != null ? checkOutStr : "" %>" required>
			                <label>성인</label>
			                <input type="number" name="adult" min="1" max="6" 
			                	value="<%= adultStr != null ? adultStr : "2" %>" required>
			                <label>어린이</label>
			                <input type="number" name="kid" min="0" max="5" 
			                	value="<%= kidStr != null ? kidStr : "0" %>" required>
			                <label>유아</label>
			                <input type="number" name="baby" min="0" max="5" 
			                	value="<%= babyStr != null ? babyStr : "0" %>" required>
			                <input type="submit" value="검색">
			                <hr>
			            </div>
			        </fieldset>
			   	</form>
		   	</div>
	   	</article>
		
		<article>
			<div class="wrapper">
				<form action="/se2/main/hotelReser/payment.jsp" name="hotelReser" method="post">
					<table class="reser-search-result">
					<%
			    	if (name != null && adultStr != null
			    		&& kidStr != null && babyStr != null){
			    		
			    		int adult = Integer.parseInt(adultStr);
			    		int kid = Integer.parseInt(kidStr);
			    		int baby = Integer.parseInt(babyStr);
			    		
			    		ArrayList<RoomDTO> arr = reserDAO.searchRooms(name, adult + kid + baby, Date.valueOf(checkInStr));
			    	%>
			    		<tr>
							<th>방 종류</th>
							<th>이미지</th>
							<th>가격</th>
							<th>인원수</th>
							<th>선택</th>
						</tr>
			    	<%	
			    		if (arr == null || arr.size() == 0){
			    	%>
						<tr>
							<td colspan="5">검색 결과가 없습니다</td>
						</tr>
						<%
			    		} else {
			    			for (int i = 0; i < arr.size(); i++){
			    	%>
						<tr>
							<td class="img-cell">
								<img alt="<%= arr.get(i).getImgName() %>" src="/se2/room_img/<%= arr.get(i).getImgName() %>">
								<input type="hidden" name="img" value="<%= arr.get(i).getImgName() %>">
							</td>
							<td>
								<%= arr.get(i).getType() %><input type="hidden" name="type_row<%= i %>" value="<%= arr.get(i).getType() %>">
							</td>
							<td>
								<%= arr.get(i).getPrice() %><input type="hidden" name="money_row<%= i %>" value="<%= arr.get(i).getPrice() %>">
							</td>
							<td>
								<%= arr.get(i).getCapacity() %>
							</td>
							<td>
								<input type="radio" name="selectedRow" value="row<%= i %>" required>
							</td>
						</tr>
						<%			
			    			}
			    	%>
						<tr>
							<td colspan="5">
								<input type="hidden" name="name" value="<%= name %>">
			    				<input type="hidden" name="checkInStr" value="<%= checkInStr %>">
			    				<input type="hidden" name="checkOutStr" value="<%= checkOutStr %>">
			    				<input type="hidden" name="adult" value="<%= adultStr %>">
			    				<input type="hidden" name="kid" value="<%= kidStr %>">
			    				<input type="hidden" name="baby" value="<%= babyStr %>">
								<input type="submit" value="예약하기">
							</td>
						</tr>
						<%
			    		}
			    	}
			    	%>
					</table>
				</form>
			</div>
		</article>
	</section> 
<%@ include file="/footer.jsp" %>
</body>
</html>