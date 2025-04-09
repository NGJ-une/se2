<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>가로로 두 공간 만들기</title>
  <style>
    * {
		maigin: 0;
		padding: 0;
		box-sizing: border-box;
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
      flex:1;
      padding: 40px;
      border-radius: 12px;
      background-color: white;
      box-shadow: 0 4px 10px rgba(0,0,0,0.08);
      font-size: 16px;
    }
    h1 {
    	font-size: 28px;
    	margin-bottom: 30px;
    	border-bottom: 3px solid #eee;
    }
    lable {
    	display: block;
    	margin-top: 10px;
    	font-size: 16px;
    	color: #333;
    }
    input[type="password"] {
    	width: 300px;
    	padding: 10px;
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
    	cursor: pointer; /*마우스를 서브밋과 버튼에 올렸을 때 손가락 모양으로 바뀜*/
    	transition: 0.3s ease; /*속성이 바뀔때 자연스럽게 바뀜 0.3 초 동안*/
    }
    input[type="submit"] {
    	background-color: #b58143;
    	color:white;
    }
    input[type="submit"]:hover {
    	background-color: #f0b675;
    }
     input[type="button"]:hover {
      background-color: #bdbdbd;
    }
    .pwdGroup {
    	display: flex;
    	align-items: center;
    	margin-bottom: 20px;
    }
    .pwdGroup label {
    	width: 140px;
    	font-size: 16px;
    	color:#333;
    	text-align: left;
    }
  </style>
</head>
<body>
  <%@include file="/header2.jsp" %>
  <div class="container">
    <%@include file="sideBar.jsp" %>
    <section class="box2">
    <form name = "pwchange" action = "pwChange_ok.jsp">
        <h1>🔒비밀번호 변경</h1>
        <div class = "pwdGroup">
        <label>현재 비밀번호 : </label>
        <input type="password" name = "nowpwd">
        </div>
        <br>
        <div class = "pwdGroup">
        <label>새 비밀번호 : </label>
        <input type="password" name = "newpwd">
        </div>
        <br>
        <div class = "pwdGroup">
        <label>새 비밀번호 확인 : </label>
        <input type="password" name = "newpwdCheck">
        </div>
        <br>
        <input type="submit" value="변경">
        <input type="button" value="취소">
    </form>
    </section>
  </div>
  <%@include file="/footer2.jsp" %>
</body>
</html>



