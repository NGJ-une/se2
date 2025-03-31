<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberJoin</title>
<style>
nav {
	text-align: left;
}

form {
	text-algin: center;
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
				<table border="1">
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
				<form name="memberJoin" action="memberJoin_ok">
					<h2>회원가입</h2>
					<hr>
					<ul>
						<li>
							<label>firstname: </label><input type="text" name="firstname">
							<label>lastname: </label><input type="text" name="lastname">
						</li>
						<li>
							<label>생년월일</label>
							<select name="year">
							<%
							for(int i=2025; i>=1960; i--){
							%>
							<option value="<%=i%>"><%=i%></option>
							<%
							}
							%>
							</select>년
							<select name="month">
							<%
							for(int i=1; i<=12; i++){
							%>
							<option value="<%=i%>"><%=i%></option>
							<%
							}
							%>
							</select>월
							<select name="day">
							<%
							for(int i=1; i<=31; i++){
							%>
							<option value="<%=i%>"><%=i%></option>
							<%
							}
							%>
							</select>일
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
								<option value="question1">  질문 1  </option>
								<option value="question2">  질문 2  </option>
								<option value="question3">  질문 3  </option>
							</select>
						</li>
						<li>
							<label>답변 : </label><input type="text" name="answer">
						</li>
						<li><input type="submit" value="가입신청"></li>
					</ul>
				</form>
			</fieldset>
		</article>
	</section>
</body>
</html>