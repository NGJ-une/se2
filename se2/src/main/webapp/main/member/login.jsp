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
    }
    fieldset{
           width:700px;
           margin:0px auto;
        }
    fieldset li{
        list-style: none;
    }
    .loginZone{
        display: flex;
    }
    .loginmenu{
      padding: 20px;
      margin-right: 5px;
      border: 2px solid black;
      width: 200px;
      background-color: whitesmoke;
    }
    .loginField{
      padding: 20px;
      border: 1px solid #ccc;
      width: 800px; 
      background-color: white;
    }
</style>
</head>
<%
String saveid=""; 


Cookie cks[]=request.getCookies();
if(cks!=null){
	for(int i=0; i<cks.length; i++){
		if(cks[i].getName().equals("saveid")){
			saveid=cks[i].getValue();
		}
	}
}
%>
<body>
<%@include file="/header.jsp" %>

    <section class="loginZone">
          <nav class="loginmenu">
            <br>
            <div>로그인</div><br><hr>
            <br>
            <div style="color: #f3415e;" >로그인</div>
            <br>
            <div>아이디 찾기</div>
            <br>
            <div>비밀번호 찾기</div>
            <br>
            <hr>
            <br>
            <div>회원가입</div>
          </nav>
		<fieldset class="loginField">
			<form name="login" action="login_ok.jsp" method="post">
			<h2>로그인</h2>
			<hr>
            <div>
                <p>ooo호텔에 오신 것을 환영합니다.<br>
                ※ OOO회원이 되시면 회원만을 위한<br>
                다양한 서비스와 혜택을 받으실 수 있습니다.
                </p>
            </div>
               <ul>
                    <li><label> 아이디 : </label><input type="text" name="userid"></li>
                    <li><label>비밀번호 : </label><input type="password" name="userpwd"></li>
                    <li><input type="submit" value=" 로그인 "></li>
                    <li><input type="checkbox" name="saveid" value="on"
                    <%=saveid.equals("")?"":"checked" %> >아이디 저장</li>    
               </ul>
			</form>
		</fieldset>
	</section>
<%@include file="/footer.jsp" %>
</body>
</html>

