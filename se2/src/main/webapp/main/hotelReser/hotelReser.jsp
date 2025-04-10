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
    <title>Reservation</title>
    <style>
    	#reser-title{
    		font-size: 45px;
    		margin-left: 10%;
    		color: #6b4c2f;
    	}
    	#reser-fieldset{
    		text-align: center;
    		border: 0px;
    	}
    	.input-components{
    		margin-left: 20px;
    		margin-right: 20px;
    		margin-top: 10px;
    		margin-bottom: 10px;
    		border-radius: 5px;
    	}
    	#reser-fieldset label{
    		font-weight: 100%;
    		font-size: 15px;
    	}
    	#reser-fieldset input, #reser-fieldset select{
    		border: 1px solid #E4D9C7;
    	}
    	#reser-search-result{
    		margin: 0px auto;
    		text-align: center;
    		width: 90%;
    		border-collapse: collapse;
    		border: 1px solid #E4D9C7;
    		font-size: 15px;
    	}
    	#reser-search-result th{
    		background-color: #E4D9C7;
    		padding: 10px;
    	}
    	#reser-search-result td{
    		border-top: 1px solid #E4D9C7;
    		padding: 10px;
    	}
    	#reser-search-result img{
    		width: 160px;
    		height: 90px;
    	}
    	#reser-search-result input{
    		border: 1px solid #E4D9C7;
    	}
    	.img-cell{
    		width: 160px;
    	}
    </style>
    <script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function(){
		// 날짜 선택 예외 처리
		const today = new Date().toISOString().split('T')[0];
		
		const checkInInput = document.getElementById('checkIn');
		const checkOutInput = document.getElementById('checkOut');

		checkInInput.setAttribute('min', today);
		checkOutInput.setAttribute('min', checkInInput.value ? checkInInput.value : today);

		checkOutInput.addEventListener('change', function(){
			if (!checkInInput.value){
			alert('체크인 날짜를 먼저 입력하세요');
			checkOutInput.value = '';
			checkInInput.focus();
		}
		});

		checkInInput.addEventListener('change', function(){
			checkOutInput.setAttribute('min', checkInInput.value);
		});
		
		// 날짜, 숫자 키보드 입력 방지
		document.querySelectorAll('input[type="date"], input[type="number"]').forEach(element => {
			element.addEventListener('keydown', (event) => {
				event.preventDefault();
			});
		});
		
		// 총 인원수 제한
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
    <section>
	   	<article>
		   	<h1 id="reser-title">예약하기</h1>
		    <hr>
		    <form action="/se2/main/hotelReser/hotelReser.jsp" name="hotelReserSearch" method="get">
		        <fieldset id="reser-fieldset">
		            <div>
		                <label>지역</label>
		                <select name="name" class="input-components">
		                    <option value="h_seoul" <%= "h_seoul".equals(name) ? "selected" : "" %>>서울</option>
		                    <option value="h_ulsan" <%= "h_ulsan".equals(name) ? "selected" : "" %>>울산</option>
		                </select>
		                <label class="input-components">체크인</label>
		                <input type="date" name="checkIn" class="input-components" id="checkIn" value="<%= checkInStr != null ? checkInStr : "" %>" required>
		                <label class="input-components">체크아웃</label>
		                <input type="date" name="checkOut" class="input-components" id="checkOut" value="<%= checkOutStr != null ? checkOutStr : "" %>" required>
		                <label class="input-components">성인</label>
		                <input type="number" name="adult" class="input-components" min="1" max="6" 
		                	value="<%= adultStr != null ? adultStr : "2" %>" required>
		                <label class="input-components">어린이</label>
		                <input type="number" name="kid" class="input-components" min="0" max="5" 
		                	value="<%= kidStr != null ? kidStr : "0" %>" required>
		                <label class="input-components">유아</label>
		                <input type="number" name="baby" class="input-components" min="0" max="5" 
		                	value="<%= babyStr != null ? babyStr : "0" %>" required>
		                <input type="submit" class="input-components" value="검색">
		            </div>
		        </fieldset>
		   	</form>
	   	</article>
		<hr>
		<article>
			<form action="/se2/main/hotelReser/payment.jsp" name="hotelReser" id="hotelReser" method="post">
				<table id="reser-search-result">
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
							<input type="submit" class="input-components" value="예약하기">
						</td>
					</tr>
					<%
		    		}
		    	}
		    	%>
				</table>
			</form>
		</article>
	</section> 
<%@ include file="/footer.jsp" %>
</body>
</html>