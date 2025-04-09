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
	   font-family: 'Noto Sans KR', sans-serif;
	   background-color: #f0f2f5;
	}
    .container {
      display: flex;
      width:1200px;
      margin: 50px auto;
      gap: 20px;
    }

    .box2 {
      flex: 1;
      padding: 40px;
      border-radius: 12px;
      background-color: white;
      box-shadow: 0 4px 12px rgba(0,0,0,0.08);
      font-size: 16px;
    }
    
    h1 {
    	font-size: 28px;
    	color: #EB1A1A;
    	margin-bottom:30px;
    	border-bottom: 3px solid #eee;
    }
    fieldset {
    	border: 2px solid #ffcccc;
    	background-color: #fff4f4;
    	padding: 20px;
    	margin-bottom: 30px;
    	border-radius: 8px;
    	font-size: 16px;
    	color: #444;
    }
    
    lable {
    	display:block;
    	margin-top: 10px;
    	font-size: 16px;
    	color: #333;
    }
    
    input[type="password"] {
    width: 300px;
    padding: 12px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 8px;
    margin-top: 8px;
    }
    
    input[type="submit"], input[type="button"] {
    	padding: 12px 24px;
    	font-size: 16px;
    	margin-top: 20px;
    	margin-right: 10px;
    	border: none;
    	border-radius: 8px;
    	cursor: pointer;
    	transition: 0.3s ease;
    }
    
    input[type="submit"] {
    	background-color: #b58143;
    	color:white;
    }
    
    input[type="submit"]:hover {
    	background-color: #EB1A1A;
    }
     input[type="button"]:hover {
      background-color: #bdbdbd;
    }
  </style>
</head>
<script>
function cancleConfirm() {
	return window.confirm("정말 회원 탈퇴 하시겠습니까?");
}
</script>
<body>
  <%@include file="/header2.jsp" %>
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
          <input type = "password" name = "pwd">
          <br>
          <br>
          <input type="submit" value="탈퇴">
          <input type="button" value="취소">
      </form>
      </section>
    </div>
  </body>
  <%@include file="/footer2.jsp" %>
</html>