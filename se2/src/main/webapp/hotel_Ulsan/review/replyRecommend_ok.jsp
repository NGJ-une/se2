<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rdao" class = "com.hotel.seoul.HotelReplyDAO"></jsp:useBean>
<%
int cidx = Integer.parseInt(request.getParameter("cidx"));
int vidx = Integer.parseInt(request.getParameter("vidx"));

Cookie[] ck = request.getCookies();
if(ck != null) {
	boolean already = false;
	for(int i =0; i < ck.length; i++) {
		if(("crecommend"+cidx).equals(ck[i].getName())) {
			%>
			<script>
				window.alert('이미 추천하신 댓글입니다.');
				location.href = 'content.jsp?vidx=<%=vidx%>';
			</script>
			<%
			return;
		}
	}
}
int result = rdao.replyRecommendUpdate(cidx);
if(result > 0) {
	Cookie ck2 = new Cookie("crecommend"+cidx,"true");
	ck2.setMaxAge(60*60*24*30);
	response.addCookie(ck2);
	%>
	<script>
		window.alert('댓글을 추천 하셨습니다.');
		location.href = 'content.jsp?vidx=<%=vidx%>';
	</script>
	<%
}else {
	%>
	 <script>
       alert('댓글 추천에 실패하였습니다.');
       location.href = 'content.jsp?vidx=<%= vidx %>';
    </script>
	<%
}
%>