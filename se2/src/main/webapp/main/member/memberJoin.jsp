<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
    h2{
        text-align: center;
    }
    fieldset{
           width:700px;
           margin:0px auto;
        }
    fieldset li{
        list-style: none;
    }
    .memberJoinZone{
        display: flex;
    }
    .loginmenu{
      padding: 20px;
      margin-right: 5px;
      border: 2px solid black;
      width: 200px;
      background-color: whitesmoke;
    }
    .memberJoinField{
      padding: 20px;
      border: 1px solid #ccc;
      width: 800px; 
      background-color: white;
    }
</style>
<script>
	function openIdCheck(){
		window.open('idcheck.jsp','idCheck','width=500,height=250');
	}
</script>
</head>
<body>
    <section class="memberJoinZone">
          <nav class="loginmenu">
            <br>
            <div>로그인</div><br><hr>
            <br>
            <div>로그인</div>
            <br>
            <div>아이디 찾기</div>
            <br>
            <div>비밀번호 찾기</div>
            <br>
            <hr>
            <br>
            <div style="color: #f3415e;" >회원가입</div>
          </nav>
			<fieldset class="memberJoinField">
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
								<option value="question1">  질문 1 : 보물 1호는? </option>
                            	<option value="question2">  질문 2 : 내가 다닌 초등학교 이름은? </option>
                            	<option value="question3">  질문 3 : 짝사랑했던 이성친구 이름은? </option>
                            	<option value="question4">  질문 4 : 어렸을 적 별명은?  </option>
                            	<option value="question5">  질문 5 : 내가 살던 고향은? </option>
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
	</section>
</body>
</html>