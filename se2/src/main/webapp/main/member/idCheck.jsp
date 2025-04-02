<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복검사</title>
</head>
<body>
<form name="idCheck" action="idCheck_ok.jsp">
<fieldset>

	<div style="color: #f3415e;">로그인 중복확인</div><hr>
	<label>아이디를 입력해주세요</label><br>
   <label>ID</label>
   <input type="text" name="userid">
   <input type="submit" value="중복검사">
</fieldset>
</form>
</body>
</html>