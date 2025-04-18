<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="rdao" class = "com.hotel.seoul.HotelReplyDAO"></jsp:useBean>
<jsp:useBean id="rdto" class = "com.hotel.seoul.HotelReplyDTO"></jsp:useBean>
<jsp:setProperty property="*" name="rdto"/>
<%
int vidx = Integer.parseInt(request.getParameter("vidx"));
String cid = request.getParameter("cid");
String ccontent = request.getParameter("ccontent");
int cref = Integer.parseInt(request.getParameter("cref"));
int clev = Integer.parseInt(request.getParameter("clev"));
int csunbun = Integer.parseInt(request.getParameter("csunbun"));
rdto.setVidx(vidx);
rdto.setCid(cid);
rdto.setCcontent(ccontent);
rdto.setCref(cref);
rdto.setClev(clev);
rdto.setCsunbun(csunbun);

int reWrite = rdao.reWriteReply(rdto);
if(reWrite > 0) {
	%>
	<script>
	location.href = 'content.jsp?vidx=<%=vidx%>';
	</script>
	<%
}else {
	%>
	<script>
	window.alert('답글 등록 실패');
	history.back();
	</script>
	<%
}
%>