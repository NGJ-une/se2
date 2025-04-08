<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
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
      width:1500px;
      margin:0 auto;
    }

    .box2 {
      padding: 20px;
      border: 1px solid #ccc;
      width: 1200px; 
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
    <div class="container">
        <%@include file="sideBar.jsp" %>   
          <section class="box2">
			<form name="login" action="login_ok.jsp" method="post">
			<h1>로그인</h1>
			<hr>
            <fieldset>
            <br>
                <p>
                ooo호텔에 오신 것을 환영합니다.<br>
                ※ OOO회원이 되시면 회원만을 위한<br>
                다양한 서비스와 혜택을 받으실 수 있습니다.
                </p>
             <br>
                 <label> 아이디 : </label><input type="text" name="userid" value="<%=saveid%>" >
             <br>
                 <label>비밀번호 : </label><input type="password" name="userpwd">
             <br>
                 <input type="checkbox" name="saveid" value="on"
                    <%=saveid.equals("")?"":"checked" %> >아이디 저장   
                  <input type="submit" value="  로그인  ">
              <br>
             </fieldset>  
			</form>
		</section>
	</div>
</body>
 <%@include file="/footer.jsp" %>
</html>

