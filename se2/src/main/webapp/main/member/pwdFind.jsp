<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
    .pwdfindZone{
        display: flex;
    }
    .loginmenu{
      padding: 20px;
      margin-right: 5px;
      border: 2px solid black;
      width: 200px;
      background-color: whitesmoke;
    }
    .pwdFindField{
      padding: 20px;
      border: 1px solid #ccc;
      width: 800px; 
      background-color: white;
    }
</style>
<script>
	function pwdFindPopup(){
		window.open('pwdFindPopup.jsp','pwdFind','width=500,height=250');
	}
</script>
</head>
<body>
    <section class="pwdfindZone">
          <nav class="loginmenu">
            <br>
            <div>로그인</div><br><hr>
            <br>
            <div>로그인</div>
            <br>
            <div>아이디 찾기</div>
            <br>
            <div style="color: #f3415e;">비밀번호 찾기</div>
            <br>
            <hr>
            <br>
            <div>회원가입</div>
          </nav>
        <fieldset class="pwdFindField">
            <form name="idFind" action="idFind_ok.jsp" method="post">
                <h2>비밀번호 찾기</h2>
                <hr>
                <ul>
                     <li><label>아이디 : </label><input type="text"></li><br>
                    <li><label>전화번호 : </label><input type="text"></li><br>
                <li><input type="submit" value="비밀번호 찾기" onclick="pwdFindPopup();"></li>
                </ul>
            </form>
        </fieldset>
    </section>      
</body>
</html>