<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class = "com.hotel.mypage.PwchangeDAO"></jsp:useBean>
<%
String pwd = request.getParameter("pwd");
String sid = (String)session.getAttribute("sessionid");
int mmoney = mdao.memeberMmoney(sid); 
String dbpwd = mdao.nowPwdBring(sid); //db에 저장된 비밀번호 값 가져오기 pw확인할때 썻던 메소드 재활용했음
int result = 0;

if(pwd.equals(dbpwd)) {
	if(mmoney > 1000) {
		%>
		<script>
		window.alert('남은 금액 환불 후 회원탈퇴 해주세요.');
		location.href = 'refund.jsp';
		</script>
		<%
	}else {
		result = mdao.memberDelete(sid);
		if(result > 0) {
			%>
			<script>
			window.alert('회원 탈퇴 되셧습니다.');
			location.href = '/se2/index.jsp';
			</script>
			<%
			session.removeAttribute("sessionid");
		}else {
			%>
			<script>
			window.alert('고객센터에 문의해주세요.');
			location.href = '/se2/index.jsp';
			</script>
			<%
		}
	}
}else {
    session.setAttribute("errorMsg", "비밀번호가 일치하지 않습니다. <br>다시 확인해주세요.");
    response.sendRedirect("cancle.jsp");
}
%>
