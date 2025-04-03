<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hotel.confirm.*" %>
<jsp:useBean id="hcdao" class="com.hotel.confirm.HotelConfirmDAO"></jsp:useBean>
<%
//response 로 넘겨진 값 가져오기 
String rid=request.getParameter("rid");
//넘겨진 값 저장 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{border: 1px solid gray;}
</style>
<script>
function show(){
	location.href='/se2/index.jsp';
}
</script>
</head>
<body>
    <h2>예약확인</h2>
    <hr>
<section>
    <article>
        <fieldset>
            <label>예약번호 : <%=request.getParameter("confirmNumber") %></label>
            <hr>
            <label>체크인 :</label> 
            <hr>
            <label>체크아웃 :</label>
            <hr>
            <label>예약자 명 :</label>
            <hr>
            <label>연락처 :</label>
            <br>
            <label>E-mail:</label>
            <hr>
            <label>예약 객실 :</label>
            <br>
            <label>예약 인원 :</label>
        </fieldset>
        <br>
        <input type = "button" value = "확인" onclick="show();">
    </article>
</section>
<section>
	<article>
		<form name="hotelConfirmMdata" action="#">
			<table>
			<%
			ArrayList<HotelConfirmDTO> arr = hcdao.hotelConfirmresult(rid);
			if(arr==null||arr.size()==0){
				%>
				<tr>
					<td colspan="2">
					이미 지난 예약 번호 이거나 <br>
					예약 내역이 없습니다.
					</td>
				</tr>
				<%
			}else{
				for(int i=0;i<arr.size();i++){
					%>
					<tr>
						<th>예약번호 :<%=arr.get(i).getRidx()%></th>
					</tr>
					<tr>
						<th>체크인 :<%=arr.get(i).getRcheckin() %></th>
						<td><input type="submit" value="예약 날짜 변경 하기"></td>
					</tr>
					<tr>
						<th>체크아웃 :<%=arr.get(i).getRcheckout() %></th>
						<th><%=arr.get(i).getDay() %>박<%=arr.get(i).getDay()+1 %>일</th>
					</tr>
					<tr>
						<th>연락처 정보</th>
					</tr>
					<tr>
						<th>Email :<%=arr.get(i).getMemail() %></th>
						<th>tel :<%=arr.get(i).getMtel() %></th>
					</tr>
					<tr>
						<th>예약자 성함 :<%=arr.get(i).getMlname() %><%=arr.get(i).getMfname() %></th>
						<td><input type="button" value="회원 정보 수정"></td>
					</tr>
					<tr>
						<th>예약한 객실 :<%=arr.get(i).getRtype() %></th>
						<th>예약 인원 수 :<%=arr.get(i).getPersons() %></th>
					</tr>
					<%
				}
			}
			%>
				<tr>
					<th colspan="2"><input type="button" value="확인" onclick="show();"></th>
				</tr>
			</table>
		</form>
	</article>
</section>
</body>
</html>