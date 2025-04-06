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
    }
    
    .box2 {
      padding: 20px;
      border: 1px solid #ccc;
      width: 800px; 
      background-color: white;
    }
  </style>
</head>
<body>
  <%@include file="/header.jsp" %>
  <div class="container">
    <%@include file="sideBar.jsp" %>
    <section class="box2">
    <form name = "pwchange" action = "pwChange_ok.jsp">
        <h1>비밀번호 변경</h1>
        <label>현재 비밀번호 : </label>
        <input type="text" name = "nowpwd">
        <br>
        <label>새 비밀번호 : </label>
        <input type="text" name = "newpwd">
        <br>
        <label>새 비밀번호 확인 : </label>
        <input type="text" name = "newpwdCheck">
        <br>
        <input type="submit" value="변경">
        <input type="button" value="취소">
    </form>
    </section>
  </div>
  <%@include file="/footer.jsp" %>
</body>
</html>



