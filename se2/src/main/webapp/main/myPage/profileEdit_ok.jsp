<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdto" class = "com.hotel.mypage.PwchangeDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class = "com.hotel.mypage.PwchangeDAO"></jsp:useBean>
<%
String sid = (String)session.getAttribute("sessionid");
String fmail = request.getParameter("fmail");
String lmail = request.getParameter("lmail");
String email = fmail+"@"+lmail;
mdto.setMemail(email);
int result = mdao.memberEdit(sid, mdto);
String msg = result > 0 ? "회원 정보가 수정 되었습니다." : "고객센터에 문의 해주세요.";
if(result > 0 ) {
	%>
	<script>
window.alert('<%=msg%>');
location.href='myPage_main.jsp';
</script>
	<%
}else {
    session.setAttribute("errorMsg", "입력하신 값을 다시 확인해주세요. <br>다시 확인해주세요.");
    response.sendRedirect("profileEdit.jsp");
}
%>

