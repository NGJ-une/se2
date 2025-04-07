<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Date" %>
<%@ page import="com.hotel.reser.RoomDTO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
    	table{
    		margin: 0px auto;
    		text-align: center;
    		width: 100%;
    		border-collapse: collapse;
    	}
    	th{
    		border: 1px solid black;
    		background-color: skyblue;
    	}
    	td{
    		border: 1px solid black;
    	}
    </style>
    <script type="text/javascript">
	document.addEventListener("DOMContentLoaded", () => {
		const today = new Date().toISOString().split('T')[0];
		
		const checkInInput = document.getElementById('checkIn');
		const checkOutInput = document.getElementById('checkOut');

		checkInInput.setAttribute('min', today);
		checkOutInput.setAttribute('min', checkInInput.value ? checkInInput.value : today);

		checkOutInput.addEventListener('change', () => {
			if (!checkInInput.value){
			alert('체크인 날짜를 먼저 입력하세요');
			checkOutInput.value = '';
			checkInInput.focus();
		}
		});

		checkInInput.addEventListener('change', () => {
			checkOutInput.setAttribute('min', checkInInput.value);
		});
		
		document.querySelectorAll('input[type="date"], input[type="number"]').forEach(element => {
			element.addEventListener('keydown', (event) => {
				event.preventDefault();
			});
		});
	});
    </script>
</head>
<jsp:useBean id="reserDAO" class="com.hotel.reser.ReserDAO"></jsp:useBean>
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
		   	<h1>예약하기</h1>
		    <hr>
		    <form action="/se2/main/hotelReser/hotelReser.jsp" name="hotelReserSearch" method="get">
		        <fieldset>
		            <legend>예약하기</legend>
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
		                	value="<%= adultStr != null ? adultStr : "2" %>" onkeydown="return false;" required>
		                <label>어린이</label>
		                <input type="number" name="kid" min="0" max="5" 
		                	value="<%= kidStr != null ? kidStr : "0" %>" onkeydown="return false;" required>
		                <label>유아</label>
		                <input type="number" name="baby" min="0" max="5" 
		                	value="<%= babyStr != null ? babyStr : "0" %>" onkeydown="return false;" required>
		                <input type="submit" value="검색">
		            </div>
		        </fieldset>
		   	</form>
	   	</article>
		<hr>
		<article>
			<form action="/se2/main/hotelReser/hotelReser_ok.jsp" name="hotelReser" method="post">
				<table>
					<tr>
						<th>방 종류</th>
						<th>이미지</th>
						<th>가격</th>
						<th>인원수</th>
						<th>선택</th>
					</tr>
				<%
		    	if (name != null && adultStr != null
		    		&& kidStr != null && babyStr != null){
		    		
		    		int adult = Integer.parseInt(adultStr);
		    		int kid = Integer.parseInt(kidStr);
		    		int baby = Integer.parseInt(babyStr);
		    		
		    		ArrayList<RoomDTO> arr = reserDAO.searchRooms(name, adult + kid + baby, Date.valueOf(checkInStr));
		    		
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
						<td>
							<%= arr.get(i).getType() %><input type="hidden" name="type_row<%= i %>" value="<%= arr.get(i).getType() %>">
						</td>
						<td>
							<img alt="<%= arr.get(i).getImgName() %>" src="<%= arr.get(i).getImgName() %>">
						</td>
						<td>
							<%= arr.get(i).getPrice() %><input type="hidden" name="money_row<%= i %>" value="<%= arr.get(i).getPrice() %>">
						</td>
						<td>
							<%= arr.get(i).getCapacity() %>
						</td>
						<td>
							<input type="radio" name="selectedRow" value="row<%= i %>">
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
							<input type="submit" value="예약하기" onclick="reserve()">
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