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
if (nowpwd.equals(newpwd)) {
    session.setAttribute("errorMsg", "현재 비밀번호와 새 비밀번호가 같습니다.<br>다른 비밀번호를 입력해주세요.");
    response.sendRedirect("pwChange.jsp");
}
// 현재 비밀번호가 맞고 새 비밀번호와 확인이 일치할 경우
else if (nowpwd.equals(nowpwdIndb) && newpwd.equals(newpwdCheck)) {
    result = mdao.pwChange(sid, newpwd);
    %>
    <script>
        window.alert('비밀번호가 변경되었습니다.');
        location.href = 'myPage_main.jsp';
    </script>
    <%
}
// 비밀번호 확인 값이 다를 경우
else {
    session.setAttribute("errorMsg", "비밀번호가 잘못 입력되었습니다.<br>다시 확인해주세요.");
    response.sendRedirect("pwChange.jsp");
}
%>
