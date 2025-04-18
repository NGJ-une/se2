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
<title>HELIA HOTEL : 예약확인</title>
<link rel="stylesheet" type="text/css" href="/se2/css/commonsLayout.css">
<link rel="stylesheet" type="text/css" href="/se2/main/hotelConfirm/css/nl.css">
<script>
function show(){
	location.href='/se2/index.jsp';
}
function Changedate(){
	location.href='';
}
function modification(){
	location.href='/se2/main/myPage/profileEditCheck.jsp';
}
</script>
</head>
<body>
<%@ include file="/header.jsp" %>
<section class="confirm-nl">
  <article class="confirm-box">
    <h2 class="confirm-title">🔍 예약 번호 확인</h2>
    <hr>
    <form name="hotelConfirm" action="#">
      <div class="confirm-info">
        <%
        ArrayList<HotelConfirmDTO> arr = hcdao.hotelConfirmresultNL(ridx);
        if (arr == null || arr.size() == 0 || arr.get(0).getRidx() == 0) {
        %>
        <p class="no-result">❌ 체크아웃된 예약 내역이거나 최근 예약 내역이 없습니다.</p>
        <% } else {
          for (HotelConfirmDTO dto : arr) {
        %>
        <div class="confirm-card">
          <div class="row"><strong>예약번호</strong><%=dto.getRidx()%></div>
          <div class="row">
            <strong>체크인</strong><%=dto.getRcheckin()%>
            <button type="submit" class="btn-change">예약 날짜 변경</button>
          </div>
          <div class="row"><strong>체크아웃</strong><%=dto.getRcheckout()%></div>
          <div class="row"><strong>기간</strong><%=dto.getDay()%>박 <%=dto.getDay() + 1%>일</div>
          <div class="row title">📞 연락처 정보</div>
          <div class="row"><strong>Email</strong><%=dto.getMemail()%></div>
          <div class="row"><strong>Tel</strong><%=dto.getMtel()%></div>
          <div class="row">
            <strong>예약자 성함</strong><%=dto.getMfname()%><%=dto.getMlname()%>&emsp;&emsp;&nbsp;
   	        <button type="button" class="btn-edit">회원 정보 수정</button>
          </div>
          <div class="row"><strong>객실</strong><%=dto.getRtype().substring(2)%></div>
          <div class="row"><strong>인원 수</strong><%=dto.getPersons()%>명</div>
        </div>
        <% } } %>
      </div>
      <div class="btn-wrapper">
        <button type="button" onclick="show()" class="btn-confirm">확인</button>
      </div>
    </form>
  </article>
</section>

<%@ include file="/footer.jsp" %>
</body>
</html>