<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.hotel.mypage.*" %>
<jsp:useBean id="mdao" class = "com.hotel.mypage.DepositDAO"></jsp:useBean>
<%
String id = (String)session.getAttribute("sessionid");
ArrayList<DepositDTO> arr = mdao.mypageMemberInfo(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style>
    * {
	   margin: 0;
	   padding: 0;
	   box-sizing: border-box; /* 패딩과 테두리를 크기 계산에 포함 */ 
	}
	
	body {
	    text-align: center; /* 화면 중앙 배치 효과 */
	    margin:0 auto;
	    padding:0;
		/*background: #e8e8e8;*/
	}
    .container {
      display: flex;
      width:1500px;
      margin:0 auto;
    }

    .box2 {
      padding: 20px;
      border: 1px solid #ccc;
      width: 1200px; 
      background-color: white;
    }
  </style>
</head>
<script>
function cancleConfirm() {
	return window.confirm("정말 회원 탈퇴 하시겠습니까?");
}
</script>
<body>
  <%@include file="/header.jsp" %>
    <div class="container">
      <%@include file="sideBar.jsp" %>
      <section class="box2">
      <form name = "cancle" action = "cancle_ok.jsp" onsubmit ="return cancleConfirm();">
          <h1>회원탈퇴</h1>
            <fieldset><%=arr.get(0).getMfname() %><%=arr.get(0).getMlname() %> 님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 더 확인합니다.</fieldset>
            <br>
          <label>회원 번호 : </label>
          <%=arr.get(0).getMidx()%>
          <br>
          <br>
          <label>비밀 번호 :</label>
          <input type = "text" name = "pwd">
          <br>
          <br>
          <input type="submit" value="탈퇴">
          <input type="button" value="취소">
      </form>
      </section>
    </div>
  </body>
  <%@include file="/footer.jsp" %>
</html>