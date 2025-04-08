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

// 아이디 중복체크
	function openIdCheck(){
		window.open('idCheck.jsp','idCheck','width=500,height=250');
	}

//비밀번호 중복체크
	function pwdCheck() {
		let pwd = document.memberJoin.pwd.value;
		let pwdcheck = document.memberJoin.pwdcheck.value;

		if (pwd !== pwdcheck) {
			alert("비밀번호가 일치하지 않습니다.");
			document.memberJoin.pwd.focus();
			return false;
		}
		return true;
	}
</script>

</head>
<body>
    <section class="memberJoinZone">
          <nav class="loginmenu">
            <br>
            <h4>로그인</h4><br><hr>
            <br>
            <div><a href="login.jsp">로그인</a></div>
            <br>
            <div><a href="idFind.jsp">아이디 찾기</a></div>
            <br>
            <div><a href="pwdFind.jsp">비밀번호 찾기</a></div>
            <br>
            <hr>
            <br>
            <div style="color: #f3415e;" ><a href="memberJoin.jsp">회원가입</a></div>
          </nav>
			<fieldset class="memberJoinField">
				<form name="memberJoin" action="memberJoin_ok.jsp" method="post" onsubmit="return pwdCheck();">
					<h2>회원가입</h2>
					<hr>
					<ul>
						<li>
							<label>firstname: </label><input type="text" name="fname">
							<label>lastname: </label><input type="text" name="lname">
						</li>
						<li>
							<label>생년월일</label>
							<input type="date" name="birth">
						</li>
						<li>
							<label>아이디 : </label>
							<input type="text" readonly style="margin-right: 10px;" name="id">
							<input type="button" value="  중복검사  " onclick="openIdCheck();">	
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
								<option value="1">  질문 1 : 보물 1호는? </option>
                            	<option value="2">  질문 2 : 내가 다닌 초등학교 이름은? </option>
                            	<option value="3">  질문 3 : 짝사랑했던 이성친구 이름은? </option>
                            	<option value="4">  질문 4 : 어렸을 적 별명은?  </option>
                            	<option value="5">  질문 5 : 내가 살던 고향은? </option>
							</select>
						</li>
						<li>
							<label>답변 : </label><input type="text" name="answer"><br><br>
						</li>
						<%
						%>
						<li><input type="submit" value="가입신청" name="su2"  style="margin-right: 100px;">
						<input type="reset" value="다시작성" name="su1"></li>
					</ul>
				</form>
			</fieldset>
	</section>
</body>
</html>