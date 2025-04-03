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
	            return;
	        }
	    }
    </script>
</head>
<jsp:useBean id="reserDTO" class="com.hotel.reser.ReserDTO"></jsp:useBean>
<jsp:useBean id="reserDAO" class="com.hotel.reser.ReserDAO"></jsp:useBean>
<body>
    <section>
	   	<h1>예약하기</h1>
	    <hr>
	    <form action="/se2/main/hotelReser/hotelReser.jsp" name="hotelReserSearch" method="get">
	        <fieldset>
	            <legend>예약하기</legend>
	            <div>
	                <label>지역</label>
	                <select name="name">
	                    <option value="seoul">서울</option>
	                    <option value="ulsan">울산</option>
	                </select>
	                <label>체크인</label>
	                <input type="date" name="checkIn" value="<%= request.getParameter("checkIn") != null ? request.getParameter("checkIn") : "" %>" required>
	                <label>체크아웃</label>
	                <input type="date" name="checkOut" value="<%= request.getParameter("checkOut") != null ? request.getParameter("checkOut") : "" %>" required>
	                <label>성인</label>
	                <input type="number" name="adult" min="0" max="2" value="<%= request.getParameter("adult") != null ? request.getParameter("checkIn") : "2" %>" required>
	                <label>어린이</label>
	                <input type="number" name="kid" min="0" max="2" value="<%= request.getParameter("kid") != null ? request.getParameter("checkIn") : "0" %>" required>
	                <label>유아</label>
	                <input type="number" name="baby" min="0" max="2" value="<%= request.getParameter("baby") != null ? request.getParameter("baby") : "0" %>" required>
	                <input type="submit" value="검색" onsubmit="searchRooms()">
	            </div>
	        </fieldset>
	       </form>
		    <hr>
		    <table>
		    	<tr>
		    		<th>방 종류</th>
		    		<th>이미지</th>
		    		<th>가격</th>
		    		<th>인원수</th>
		    		<th>선택</th>
		    	</tr>
		    	<%
		    	
		    	if (request.getParameter("name") != null && request.getParameter("headCount") != null){
		    		String region = request.getParameter("name");
		    		int headCount = Integer.parseInt(request.getParameter("adult")) 
		    				+ Integer.parseInt(request.getParameter("kid")) 
		    				+ Integer.parseInt(request.getParameter("baby"));
		    		Date checkIn = Date.valueOf(request.getParameter("checkIn"));
		    		
		    		ArrayList<RoomDTO> arr = reserDAO.searchRooms(region, headCount, checkIn);
		    		
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
		    		<td><%= arr.get(i).getType() %><input type="hidden" name="type" value="<%= arr.get(i).getType() %>"></td>
		    		<td><img alt="<%= arr.get(i).getImgName() %>" src="<%= arr.get(i).getImgName() %>"></td>
		    		<td><%= arr.get(i).getPrice() %><input type="hidden" name="money" value="<%= arr.get(i).getPrice() %>"></td>
		    		<td><%= arr.get(i).getCapacity() %></td>
		    		<td><input type="radio" name="selected"></td>
		    	</tr>
		    	<%			
		    			}
		    	%>
		    	<tr>
		    		<td colspan="5"><input type="button" value="예약하기" onclick="reserve()"></td>
		    	</tr>
		    	<%
		    		}
		    	}
		    	%>
		    </table>
	    
   </section> 
</body>
</html>