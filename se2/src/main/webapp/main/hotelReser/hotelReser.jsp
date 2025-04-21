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
    <link rel="stylesheet" type="text/css" href="/se2/main/hotelReser/hotelReserLayout.css">
    <title>HELIA HOTEL : 예약</title>
    <style>
    
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
			   	<div class="step-indicator">
				  <div class="step-circle active">1</div>
				  <div class="step-line"></div>
				  <div class="step-circle">2</div>
				</div>
				
				<h1 class="reser-title">호텔, 날짜, 인원 선택</h1>
			    <hr>
			    <form action="/se2/main/hotelReser/hotelReser.jsp" name="hotelReserSearch" method="get">
			        <fieldset class="reser-fieldset">
			            <div>
			                <label>지역</label>
			                <select name="name">
			                    <option value="h_seoul" <%= "h_seoul".equals(name) ? "selected" : "" %>>서울</option>
			                    <option value="h_ulsan" <%= "h_ulsan".equals(name) ? "selected" : "" %>>울산</option>
			                </select>
			                <span class="rf-check">
			                <label>체크인</label>
			                <input type="date" name="checkIn" id="checkIn" value="<%= checkInStr != null ? checkInStr : "" %>" required>
			                <label>체크아웃</label>
			                <input type="date" name="checkOut" id="checkOut" value="<%= checkOutStr != null ? checkOutStr : "" %>" required>
			                </span>
			                <span class="rf-people">
			                <label>성인</label>
			                <input type="number" name="adult" min="1" max="6" 
			                	value="<%= adultStr != null ? adultStr : "2" %>" required>
			                <label>어린이</label>
			                <input type="number" name="kid" min="0" max="5" 
			                	value="<%= kidStr != null ? kidStr : "0" %>" required>
			                <label>유아</label>
			                <input type="number" name="baby" min="0" max="5" 
			                	value="<%= babyStr != null ? babyStr : "0" %>" required>
			                </span>	
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
		  if (name != null && checkInStr != null && checkOutStr != null
		      && adultStr != null && kidStr != null && babyStr != null) {
		
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
		    if (arr == null || arr.size() == 0) {
		%>
		        <tr>
		          <td colspan="5">검색 결과가 없습니다</td>
		        </tr>
		<%
		    } else {
		      for (int i = 0; i < arr.size(); i++) {
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
		  } else {
		%>
		        <tr>
		          <th colspan="5" style="background:#fffdfb; border:1px solid #fffdfb; padding: 40px; color: #6b4c2f; font-size: 26px; padding-top:200px;">
		            예약을 원하시는 호텔, 날짜, 인원을 선택해주세요.
			          </th>
		        </tr>
		<%
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