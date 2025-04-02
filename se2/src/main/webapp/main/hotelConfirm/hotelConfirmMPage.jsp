<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<tr>
					<th>예약번호 :<%=request.getParameter("confirmNumber") %></th>
				</tr>
				<tr>
					<th>체크인 :</th>
					<td><input type="submit" value="예약 날짜 변경 하기"></td>
				</tr>
				<tr>
					<th>체크아웃 :</th>
					<th>#박#일</th>
				</tr>
				<tr>
					<th>연락처 정보</th>
				</tr>
				<tr>
					<th>Email :</th>
					<th>tel :</th>
				</tr>
				<tr>
					<th>예약자 성함 :</th>
					<td><input type="button" value="회원 정보 수정"></td>
				</tr>
				<tr>
					<th>예약한 객실 :</th>
					<th>예약 인원 수 :</th>
				</tr>
				<tr>
					<th colspan="2"><input type="button" value="확인" onclick="show();"></th>
				</tr>
			</table>
		</form>
	</article>
</section>
</body>
</html>