<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<style>
h2{
	text-align: center;
	color:#332c04ab;
}
p{
	text-align: center;
}

nav{
	float: left;
}
form {
	text-align: center;
}
fieldset{
   width:700px;
   margin:0px auto;
}
 fieldset li{
	list-style: none;
	float: center;
	
}
</style>
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
		<fieldset>
			<form name="login" action="login_ok.jsp" method="post">
			<h2>로그인</h2><hr>
            <div>
                <p>ooo호텔에 오신 것을 환영합니다.<br>
                ※ OOO회원이 되시면 회원만을 위한<br>
                다양한 서비스와 혜택을 받으실 수 있습니다.
                </p>
            </div>
               <ul>
                    <li><label> 아이디 : </label><input type="text" value="호텔 아이디 입력" name="id"></li>
                    <li><label>비밀번호 : </label><input type="password" name="pwd"></li>
                    <li><input type="submit" value=" 로그인 "></li>
                    <li><input type="checkbox"><label>아이디 저장</label></li>    
               </ul>
			</form>
		</fieldset>
	</section>
</body>
</html>