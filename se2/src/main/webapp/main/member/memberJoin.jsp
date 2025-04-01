<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberJoin</title>
<style>
h2{
	text-align: center;
}
nav {
	text-align: left;
}

form {
	text-algin: center;
}
fieldset{
   width:700px;
   margin:0px auto;
}
fieldset li{
   list-style: none;
}


</style>
<script>
	function openIdCheck(){
		window.open('idcheck.jsp','idCheck','width=500,height=250');
	}
</script>
</head>
<body>
	<section>
		<article>
			<nav>
				<table border="1" >
					<tr>
						<td>로그인</td>
					</tr>
					<tr>
						<td>로그인<br> 아이디찾기<br> 비밀번호 찾기
						</td>
					</tr>
					<tr>
						<td>회원가입<br> <br> <br></td>
					</tr>
				</table>
			</nav>
		</article>
	</section>
	<section>
		<article>
			<fieldset>
				<form name="memberJoin" action="memberJoin_ok" method="post">
					<h2>회원가입</h2>
					<hr>
					<ul>
						<li>
							<label>firstname: </label><input type="text" name="firstname">
							<label>lastname: </label><input type="text" name="lastname">
						</li>
						<li>
							<label>생년월일</label>
							<input type="date" name="birth">
						</li>
						<li>
							<label>아이디 : </label> <input type="text" style="margin-right: 10px;" name="id"><input  type="button" value="  중복검사  " onclick="openIdCheck();">	
						</li>
						<li>
							<label>비밀번호 : </label> <input type="password" name="pwd">						
						</li>
						<li>
							<label>비밀번호 확인 : </label> <input type="password" name="pwdcheck">
						</li>
						<li>
							<label>E-mail : </label><input type="text" name="email1"> @ <input type="text" name="email2"> 
						</li>
						<li>
							<label>전화번호 : </label><input type="text" name="tel">
						</li>
						<li>
							<label>주소 : </label> <input type="text" name="addr">
						</li>
						<li>
							<label>질문 : </label>
							<select name="question"> 
								<option value="question1">  질문 1 : 당신이 태어난 도시의 이름은 무엇인가요? </option>
								<option value="question2">  질문 2 : 당신의 초등학교 이름은 무엇인가요? </option>
								<option value="question3">  질문 3 : 당신의 어렸을 적 별명은 무엇인가요? </option>
								<option value="question4">  질문 4 : 당신의 부모님의 고향은 어디인가요? </option>
								<option value="question5">  질문 5 : 당신의 초등학교 선생님의 성함은 무엇인가요? </option>
							</select>
						</li>
						<li>
							<label>답변 : </label><input type="text" name="answer"><br><br>
						</li>
						<li><input type="reset" value="다시작성" name="su1">
							<input type="submit" value="가입신청" name="su2"></li>
					</ul>
				</form>
			</fieldset>
		</article>
	</section>
</body>
</html>