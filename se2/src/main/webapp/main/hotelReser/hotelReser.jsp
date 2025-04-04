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
    	function searchRooms(){
	        let headCount = parseInt(document.hotelReserSearch.adult.value) + parseInt(document.hotelReserSearch.kid.value)
	             + parseInt(document.hotelReserSearch.baby.value);
	        
	        if (headCount < 1 || headCount > 6){
	            alert('인원은 1명에서 6명까지 가능합니다');
	            event.preventDefalult();
	        }
	    }
    	function keepSelected(){
    		window.alert(document.hotelReserSearch.name.options[0].value);
    		window.alert(document.hotelReserSearch.name.options[1].value);
    	}
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
		                <select name="name" onload="keepSelected()">
		                    <option value="h_seoul">서울</option>
		                    <option value="h_ulsan">울산</option>
		                </select>
		                <label>체크인</label>
		                <input type="date" name="checkIn" value="<%= checkInStr != null ? checkInStr : "" %>" required>
		                <label>체크아웃</label>
		                <input type="date" name="checkOut" value="<%= checkOutStr != null ? checkOutStr : "" %>" required>
		                <label>성인</label>
		                <input type="number" name="adult" min="0" max="2" value="<%= adultStr != null ? adultStr : "2" %>" required>
		                <label>어린이</label>
		                <input type="number" name="kid" min="0" max="2" value="<%= kidStr != null ? kidStr : "0" %>" required>
		                <label>유아</label>
		                <input type="number" name="baby" min="0" max="2" value="<%= babyStr != null ? babyStr : "0" %>" required>
		                <input type="submit" value="검색" onsubmit="searchRooms()">
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