<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복검사</title>
<style>

    input[type="submit"] {
         border: none;
         cursor: pointer;
	}

    input[type="submit"]:hover {
    	background-color: #f0b675;
    }


	.idPopup {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
</style>
</head>
<body>
<form name="idCheck" action="idCheck_ok.jsp">

	<div class="idPopup">로그인 중복확인<hr>
   <label>ID</label>
   <input type="text" name="userid" >
   <input type="submit" value="중복검사">
   </div>
</form>
</body>
</html>