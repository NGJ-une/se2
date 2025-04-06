<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.hotel.mypage.*" %>
<jsp:useBean id="mdao" class = "com.hotel.mypage.PwchangeDAO"></jsp:useBean>

<%
String sid = (String)session.getAttribute("sessionid");
ArrayList<PwchangeDTO> arr = mdao.memberInfo(sid); //가져오기 db로 
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
    }
    
    .box2 {
      padding: 20px;
      border: 1px solid #ccc;
      width: 800px; 
      background-color: white;
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
            <label>성 :</label>
            <input type = "text" name = "mfname" value = "<%=arr.get(0).getMfname()%>"> 
            <label>이름 :</label>
            <input type = "text" name = "mlname" value = "<%=arr.get(0).getMlname()%>">
            <br>
            <br>
            <label>아이디 :</label>
            <%=sid %>(session 에 있는 아이디 가져오면 됨.)
            <br>
            <br>
            <label>이메일 :</label>
            <input type = "text" name = "fmail" value = "<%=fmail%>"> @ <input type = "text" id = "lmail" name = "lmail" value = "<%=lmail%>">
            <select id = "emailSel" onchange="show()">
                <option value = "type">직접입력</option>
                <option value = "naver.com">naver.com</option>
                <option value = "google.com">google.com</option>
                <option value = "nate.com">nate.com</option>
                <option value = "daum.net">daum.net</option>
            </select>
            <br>
            <br>
            <label>전화번호 :</label>
            <input type = "text" name = "mtel" value = "<%=arr.get(0).getMtel()%>">
            <br>
            <br>
            <label>주소 :</label>
            <input type = "text" name = "maddr" value = "<%=arr.get(0).getMaddr()%>">
            <br>
            <br>
            <input type ="submit" value = "변경">
            <input type = "button" value = "취소">
          </fieldset>
      </form>
      </section>
    </div>
  </body>
  <%@include file="/footer.jsp" %>
</html>