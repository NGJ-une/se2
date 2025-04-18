<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rdao" class="com.hotel.seoul.HotelReplyDAO" />
<jsp:useBean id="rdto" class="com.hotel.seoul.HotelReplyDTO" />
<jsp:setProperty property="*" name="rdto" />
<%
request.setCharacterEncoding("utf-8");
String cid = (String) session.getAttribute("sessionid");
if (cid == null) {
%>
    <script>
        alert('로그인 후 이용해주세요.');
        location.href = 'login.jsp';
    </script>
<%
    return;
}
int vidx = Integer.parseInt(request.getParameter("vidx"));
String ccontent = request.getParameter("ccontent");
int result = rdao.writeReply(vidx, cid, ccontent);
if (result > 0) {
%>
    <script>
        location.href = 'content.jsp?vidx=<%=vidx%>';
    </script>
<%
} else {
%>
    <script>
        alert('댓글 등록 실패');
        history.back();
    </script>
<%
}
%>
