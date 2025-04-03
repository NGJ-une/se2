<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.hotel.reser.RoomDTO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script type="text/javascript">
	    function searchRooms(){
	        let region = document.hotelReserSearch.region.value;
	        let count = parseInt(document.hotelReserSearch.adult.value) + parseInt(document.hotelReserSearch.kid.value)
	             + parseInt(document.hotelReserSearch.baby.value);
	        
	        if (count < 1 || count > 6){
	            alert('인원은 6명 까지 가능합니다');
	            return;
	        }
	        location.href = "/se2/main/hotelReser/hotelReser.jsp?region=" + region + "&count=" + count;
	    }
    </script>
</head>
<jsp:useBean id="reserDAO" class="com.hotel.reser.ReserDAO"></jsp:useBean>
<body>
    <h1>예약하기</h1>
    <hr>
    <form action="/se2/main/hotelReser/hotelReser_ok" name="hotelReserSearch" method="post">
        <fieldset>
            <legend>예약하기</legend>
            <div>
                <label>지역</label>
                <select name="region">
                    <option value="seoul">서울</option>
                    <option value="ulsan">울산</option>
                </select>
                <label>체크인</label>
                <input type="date" name="checkIn">
                <label>체크아웃</label>
                <input type="date" name="checkOut">
                <label>성인</label>
                <input type="number" name="adult" min="0" max="2" value="2">
                <label>어린이</label>
                <input type="number" name="kid" min="0" max="2" value="0">
                <label>유아</label>
                <input type="number" name="baby" min="0" max="2" value="0">
                <input type="button" value="검색" onclick="searchRooms()">
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
    	</tr>
    	<%
    	if (request.getParameter("region") != null && request.getParameter("count") != null){
    		String region = request.getParameter("region");
    		int count = Integer.parseInt(request.getParameter("count"));
    		ArrayList<RoomDTO> arr = reserDAO.searchRooms(region, count);
    		
    		if (arr == null || arr.size() == 0){
    	%>
    	<tr>
    		<td colspan="4">검색 결과가 없습니다</td>
    	</tr>
    	<%
    		} else {
    			for (int i = 0; i < arr.size(); i++){
    	%>
    	<tr>
    		<td><%= arr.get(i).getType() %></td>
    		<td><img alt="<%= arr.get(i).getImgName() %>" src="<%= arr.get(i).getImgName() %>"></td>
    		<td><%= arr.get(i).getPrice() %></td>
    		<td><%= arr.get(i).getCapacity() %></td>
    	</tr>
    	<%			
    			}
    	%>
    	<tr>
    		<td colspan="4"><input type="submit" value="예약하기">
    	</tr>
    	<%
    		}
    	}
    	%>
    </table>
</body>
</html>