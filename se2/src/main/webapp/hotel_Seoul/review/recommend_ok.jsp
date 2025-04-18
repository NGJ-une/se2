<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rdao" class = "com.hotel.seoul.HotelReviewDAO"></jsp:useBean>
<%
int idx = Integer.parseInt(request.getParameter("vidx"));

Cookie[] ck = request.getCookies();
if(ck != null) {
	boolean already = false;
	for(int i = 0; i < ck.length; i++) {
		if(("recommend"+idx).equals(ck[i].getName())) {//쿠키 존재하는 경우
			%>
			<script>
				window.alert('이미 추천하신 리뷰입니다.');
				location.href = 'content.jsp?vidx=<%=idx%>';
			</script>
			<%
			return;
		}
	}
}
int result = rdao.recommendUpdate(idx);
if(result > 0) {
	Cookie ck2 = new Cookie("recommend"+idx, "true");
	ck2.setMaxAge(60*60*24*30);
	//ck2.setPath("/");
	response.addCookie(ck2);
	%>
	<script>
		location.href = 'content.jsp?vidx=<%= idx %>';
	</script>
	<%
}else {
	%>
	 <script>
        alert('리뷰 추천에 실패하였습니다.');
        location.href = 'content.jsp?vidx=<%= idx %>';
     </script>
	<%
}
%>