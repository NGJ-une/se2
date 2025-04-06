<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hotel.confirm.*" %>
<jsp:useBean id="hcdao" class="com.hotel.confirm.HotelConfirmDAO"></jsp:useBean>
<%
//비로그인일시 response 로 넘겨진 값 가져오기 
String ridx_s=request.getParameter("ridx");
String mid=request.getParameter("mid");
//값이 넘어오지않거나 없을경우를 대비 
if(ridx_s==null||ridx_s.equals("")){
	ridx_s="0";
}
if(mid==null||mid.equals("")){
	mid="";
}
// 넘겨진 값 파씽 
int ridx=Integer.parseInt(ridx_s);
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
		<form name="hotelConfirm" action="#">
		<table>
			<%
			ArrayList<HotelConfirmDTO> arr = hcdao.hotelConfirmresultNL(ridx);
			if(((arr==null||arr.size()==0 || arr.get(0).getRidx()==0))){
				%>
				<tr>
					<td colspan="2">
					체크아웃된 예약 내역이거나 <br>
					최근 예약 내역이 없습니다.
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
						<!-- sql 쿼리를 이용해서 Date끼리의 날짜를 뺀 값 으로 #박을 대입 -->
						<th><%=arr.get(i).getDay() %>박<%=arr.get(i).getDay()+1 %>일</th>
					</tr>
					<tr>
						<th>연락처 정보</th>
					</tr>
					<tr>
						<th>Email :<%=arr.get(i).getMemail() %></th>
						<th>Tel :<%=arr.get(i).getMtel() %></th>
					</tr>
					<tr>
						<th>예약자 성함 :<%=arr.get(i).getMlname() %><%=arr.get(i).getMfname() %></th>
						<td><input type="button" value="회원 정보 수정"></td>
					</tr>
					<tr>
						<!-- 객실 = DB의 내용을 그대로 불러 오는 과정에서 필요없는 문자열 제외 후 출력  -->
						<th>예약한 객실 :<%=arr.get(i).getRtype().substring(2, arr.get(i).getRtype().length()) %></th>
						<th>예약 인원 수 :<%=arr.get(i).getPersons() %>명</th>
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