<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.hotel.mypage.*" %>
<jsp:useBean id="mdao" class = "com.hotel.mypage.PwchangeDAO"></jsp:useBean>

<%
String id = (String)session.getAttribute("sessionid");
ArrayList<PwchangeDTO> arr = mdao.memberInfo(id); //가져오기 db로 
int fmailLocation = arr.get(0).getMemail().indexOf("@"); // @ 까지의 위치 가져오기
int total = arr.get(0).getMemail().length(); // 전체길이 가져오기
String fmail = arr.get(0).getMemail().substring(0, fmailLocation); //0번쨰 부터 @위치까지 가져오기
String lmail = arr.get(0).getMemail().substring(fmailLocation+1, total); // @의 다음부터 전체 길이 까지 가져오기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function show() {
    var setlmail = document.getElementById("lmail");<!-- lmail 가져오기-->
    var getemail = document.getElementById("emailSel").value;<!-- 옵션태그의 값 가져오기-->
    if (getemail != "type") {<!-- 직접입력이 아닐 경우 lmail에 옵션태그 에 값 넣기-->
        setlmail.value = getemail;
    } else {
        setlmail.value = ""; <!-- 직접입력일 경우 입력칸 비운것 처럼 보이게 하기-->
    }
}

</script>
 <style>

	* {
  		margin: 0;
  		padding: 0;
  		box-sizing: border-box;
  		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

	body {
  		background-color: #f5f5f5;
  		color: #333;
}

	.container {
 		 display: flex;
  		max-width: 1200px;
  		width: 100%;
 		 margin: 50px auto;
 		 gap: 40px;
}

	.box2 {
  		width: 100%;
  		padding: 40px;
 		 background-color: #fff;
 		 border-radius: 12px;
  		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

	form {
 		 max-width: 700px;
		  margin: 0 auto;
}

	h1 {
  		font-size: 28px;
  		margin-bottom: 30px;
  		text-align: center;
  		color: #444;
}
	
	fieldset {
  		border: none;
}

	label {
 		 display: block;
  		margin: 20px 0 8px;
  		font-size: 15px;
  		font-weight: 500;
}

	input[type="text"],
	input[type="password"],
	select {
 		width: 100%;
  		padding: 12px 14px;
  		border: 1px solid #ccc;
 		border-radius: 8px;
  		font-size: 15px;
  		transition: border-color 0.3s ease;
}

	input[type="text"]:focus,
	input[type="password"]:focus,
	select:focus {
  		border-color: #f79e66;
  		outline: none;
}

	/* 이메일 그룹 (한 줄 정렬) */
	.email-group {
  		display: flex;
  		gap: 8px;
  		align-items: center;
}

	.email-group input[type="text"],
	.email-group select {
  		height: 40px;
  		font-size: 14px;
  		padding: 0 10px;
  		border: 1px solid #ccc;
  		border-radius: 6px;
}

	.email-group input[type="text"] {
 		width: 35%;
}

	.email-group select {
  		width: 35%;
}	

	.email-group .at {
  		font-size: 16px;
  		line-height: 40px;
}

	/* 버튼 그룹 */
	.button-group {
  		margin-top: 40px;
  		display: flex;
  		gap: 20px;
  		justify-content: flex-start;
}

	input[type="submit"],
	input[type="button"] {
  		flex: 1;
  		padding: 12px;
  		font-size: 15px;
  		font-weight: 500;
  		border: none;
  		border-radius: 8px;
  		cursor: pointer;
  		transition: background-color 0.3s ease;
}

	input[type="submit"] {
  		background-color: #f0b675;
  		color: white;
	}

   input[type="submit"]:hover {
      	background-color: #d89e5e;
    }

	input[type="button"] {
  		background-color: #e0e0e0;
  		color: #333;
}

	input[type="button"]:hover {
  		background-color: #ccc;
}
	 
  
  
  </style>
</head>
<body>
  <%@include file="/header.jsp" %> 
    <div class="container">
      <%@include file="sideBar.jsp" %>
      <section class="box2">
      <form name = "profileEdit" action = "profileEdit_ok.jsp">
          <h1>프로필 수정
          </h1>
          <hr>
          <fieldset>
          
            <label>아이디 : <%=sid %> </label>
          
            <label>성</label>
            <input type = "text" name = "mfname" value = "<%=arr.get(0).getMfname()%>" required="required"> 
            <label>이름 </label>
            <input type = "text" name = "mlname" value = "<%=arr.get(0).getMlname()%>" required="required">

            
             <label> 이메일 </label>
        <div class="email-group">
          <input type="text" name="fmail" value="<%=fmail%>" required="required">
          <span class="at">@</span>
          <input type="text" id="lmail" name="lmail" value="<%=lmail%>" required="required">
          <select id="emailSel" onchange="show()">
            <option value="type">직접입력</option>
            <option value="naver.com">naver.com</option>
            <option value="google.com">google.com</option>
            <option value="nate.com">nate.com</option>
            <option value="daum.net">daum.net</option>
          </select>
        </div>
        
            <label>전화번호 </label>
            <input type = "text" name = "mtel" value = "<%=arr.get(0).getMtel()%>" required="required">
            
            <label>주소 </label>
            <input type = "text" name = "maddr" value = "<%=arr.get(0).getMaddr()%>" required="required">
            
            <div class="button-group">
  				<input type="submit" value="변경">
 	 			<input type="button" value="취소">
			</div>
			
          </fieldset>
      </form>
      </section>
    </div>
  </body>
  <%@include file="/footer.jsp" %>
</html>