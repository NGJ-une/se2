<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="com.hotel.member.MemberDAO"></jsp:useBean>

<%

String userid = request.getParameter("userid");

// 숫자만 입력한 아이디는 사용 불가
if (userid.matches("^\\d+$")) {
    session.setAttribute("errorMsg", "아이디는 숫자로만 구성될 수 없습니다. 영문을 포함해주세요.");
    response.sendRedirect("idCheck.jsp");
    return; // 아래 코드 실행 안 되도록 중단
}

boolean result = mdao.idCheck(userid); //userid의 값을 dao idcheck메소드로 넘김

if(result){ //userid 입력한 값과 db의 userid와 같을때
    session.setAttribute("errorMsg", "이미 사용하고있는 아이디 입니다.");
    response.sendRedirect("idCheck.jsp");
}else{ // 사용 가능할 때
%>

<script>
window.alert('<%=userid%>는 사용가능한 아이디입니다.');
opener.document.memberJoin.id.value = '<%=userid%>';
window.self.close();
</script>

<%
}
%>