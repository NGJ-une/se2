<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/se2/css/header.css">
<header>
  <nav>
    <div>
      <a id="login">로그인</a> | <a href="main/member/memberJoin.jsp">회원가입</a>
    </div>
    <ul>
      <li><a class="top-menu-text" id="hotelSearchLink" onclick="showPopup()" href="#">호텔찾기</a></li>
      <li><a class="top-menu-text" href="#">호텔소개</a></li>
      <li><a id="title" href="#">Hotel SHILLA</a></li>
      <li><a class="top-menu-text" href="/se2/main/hotelReser/hotelReser.jsp">예약하기</a></li>
      <!-- 우선 비로그인시 만 이동링크 걸어둠 -->
      <li><a class="top-menu-text" href="/se2/main/hotelConfirm/hotelConfirmNM.jsp">예약확인</a></li>
    </ul>
  </nav>
  <%@ include file="/main/hotelSearch/hotelSearch.jsp" %> <!-- 호텔 찾기 --> 
</header>

if(rs.get()).equals(매개변수)){
	if(){
	}
} else{

}

