<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class = "com.hotel.mypage.PwchangeDAO"></jsp:useBean>
<%
int result = 0;
String sid = (String)session.getAttribute("sessionid");
String nowpwd = request.getParameter("nowpwd");//현재 비밀번호
String nowpwdIndb = mdao.nowPwdBring(sid);//세션으로 가져온 id의 db에 저장되어있는 pwd 가져오기
String newpwd = request.getParameter("newpwd");//새 비밀번호
String newpwdCheck = request.getParameter("newpwdCheck");//새 비밀번호 확인
if(nowpwd.equals(nowpwdIndb) && newpwd.equals(newpwdCheck)) {
	// 현재 비밀번호입력한 값과 db 에 저장되어 있는 값이 같고 새 비밀번호와 새 비밀번호 확인의 값이 같은지 확인
	result = mdao.pwChange(sid, newpwd);
	%>
<script>
	window.alert('비밀번호가 변경되었습니다.');
	location.href = 'myPage_main.jsp';
</script>
	<%
}else {
	%>
<script>
	window.alert('비밀번호를 확인해주세요.');
	location.href = 'pwChange.jsp';
</script>
	<%
}
%>
