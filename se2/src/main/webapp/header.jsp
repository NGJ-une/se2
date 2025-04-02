<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	header{
		position: fixed; top: 0; left: 0; right: 0;
	}

</style>
<header>
  <nav>
    <div>
      <a id="login">로그인</a> | <a id="memberJoin">회원가입</a>
    </div>
    <ul>
      <li><a class="top-menu-text" id="hotelSearchLink" onclick="showPopup()" href="#">호텔찾기</a></li>
      <li><a class="top-menu-text" href="#">호텔소개</a></li>
      <li><a id="title" href="#">Hotel SHILLA</a></li>
      <li><a class="top-menu-text" href="#">예약하기</a></li>
      <li><a class="top-menu-text" href="#">예약확인</a></li>
    </ul>
  </nav>
  <%@ include file="/main/hotelSearch/hotelSearch.jsp" %> <!-- 호텔 찾기 -->
</header>