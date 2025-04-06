<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="mdao" class="com.hotel.member.MemberDAO"></jsp:useBean>

<%
String userid = request.getParameter("userid");
String userpwd = request.getParameter("userpwd");
String saveid = request.getParameter("saveid"); //아이디 체크

// //내가 입력한 id의 비밀번호를 불러와서 그 결과가 result라는 변수에 들어감
String getpwd= mdao.loginCheckPwd(userid); //아이디 입력

////내가 입력한 pwd의 아이디가 동일한지 비교
String getid= mdao.loginCheckId(userpwd); //비밀번호 입력으로 아이디 가져오기



if (getpwd.equals(userpwd)) {


	if (getid.equals(userid)){
	session.setAttribute("sessionid", userid);

	
	 if(saveid!=null){
		  Cookie ck=new Cookie("saveid",userid);
		  ck.setMaxAge(60*60*24*30);
		  
		  response.addCookie(ck);

	   }else{
		   Cookie ck=new Cookie("saveid",userid);
			  ck.setMaxAge(0);
			  response.addCookie(ck);
	  
	   }
	}

%>
<script>
	alert("로그인 성공!");
    location.href = "../../index.jsp";
</script>
<%
} else{
%>
<script>
	window.alert("로그인 실패!");
	location.href = "login.jsp";
</script>
<%
}
%>


