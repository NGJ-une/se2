<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.hotel.member.*" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mdao" class="com.hotel.member.MemberDAO"></jsp:useBean>
<%


String userid="1234";
userid = request.getParameter("userid");

String userpwd = request.getParameter("userpwd");
if(userpwd==null){
	userpwd="";
}

String saveid = request.getParameter("saveid"); //아이디 체크

// //내가 입력한 id의 비밀번호를 불러와서 그 결과가 result라는 변수에 들어감
MemberDTO mdto = mdao.loginCheckPwd(userid);
String getpwd= mdto != null ? mdto.getPwd() : null; //아이디 입력으로 비밀번호 가져오기

////내가 입력한 pwd의 아이디가 동일한지 비교
String getid= mdao.loginCheckId(userpwd); //비밀번호 입력으로 아이디 가져오기



if (userpwd.equals(getpwd)) { // DB의 PWD 와 내가 입력한  동일한지 확인
	session.setAttribute("sessionid", userid);
	session.setAttribute("grade", mdto.getGrade());
	session.setAttribute("point", mdto.getPoint());
	session.setAttribute("balance", mdto.getMoney());
	session.setAttribute("dcRate", mdto.getDiscount());

	 	if(saveid!=null){
		  Cookie ck=new Cookie("saveid",userid);
		  ck.setMaxAge(60*60*24*30); 
		  response.addCookie(ck); 

	   		}else{
		      Cookie ck=new Cookie("saveid",userid);
			  ck.setMaxAge(0);
			  response.addCookie(ck);
	  
	   }

%>
<script>
	window.alert("로그인 성공!!");
	location.href = "/se2/index.jsp";
</script>
<%
} else  {
%>
<script>
	window.alert("ID 또는 비밀번호가 잘못 입력되었습니다.");
	location.href = "login.jsp";

</script>
<%

}
%>