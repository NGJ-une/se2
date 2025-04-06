<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.hotel.mypage.*" %>
<jsp:useBean id="mdao" class = "com.hotel.mypage.DepositDAO"></jsp:useBean>
<%
String id = (String)session.getAttribute("sessionid");
String grade = "BRONZE";
int money = mdao.importAmount(id);
if(money > 3000000) {
	grade = "DIAMOND";
}else if (money > 1000000) {
	grade = "GOLD";
}else if (money > 200000) {
	grade = "SILVER";
}
mdao.grade(grade, id);
ArrayList<DepositDTO> arr = mdao.mypageMemberInfo(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    * {
	   margin: 0;
	   padding: 0;
	   box-sizing: border-box; /* 패딩과 테두리를 크기 계산에 포함 */
	}
	
	body {
	    text-align: center; /* 화면 중앙 배치 효과 */
	    margin:0 auto;
	    padding:0;
		/*background: #e8e8e8;*/
	}
    .container {
      display: flex;
      width:1500px;
      margin:0 auto;
    }

    .box2 {
      padding: 20px;
      border: 1px solid #ccc;
      width: 1200px; 
      background-color: white;
    }
  </style>
</head>
<body>
<%@include file="/header.jsp" %>
  <div class="container">
    <%@include file="sideBar.jsp" %>
    <section class="box2">
         <div>
         <%if(arr == null || arr.size() == 0) {
         	%>
         	<script>
         	window.alert('로그인을 확인해주세요.');
         	location.href = '../member/login.jsp';
         	</script>
         	<%
         }else {
         	%>
             <p><%=arr.get(0).getMfname()%><%=arr.get(0).getMlname() %> 님은 <br> 
                <%=grade %> 회원입니다</p>
                 <fieldset>
                     <p>회원번호 <%=arr.get(0).getMidx() %> | 포인트 <%=arr.get(0).getMpoint() %>p </p>
                 </fieldset>
             <%
         }
          %>
         </div>
         <div>
             최근 6개월 예약 내역
         </div>
         <div>
             <fieldset>
                 <table>
                     <tr>
                         <th>예약 번호</th>
                         <th>예약한 방 등급</th>
                         <th>예약한 날짜</th>
                         <th>가격</th>
                         <th>인원</th>
                     </tr>
                     <tr>
                         <th>3</th>
                         <th>grand</th>
                         <th>2025-04-02</th>
                         <th>250,000</th>
                         <th>5명</th>
                     </tr>
                 </table>
             </fieldset>
         </div>

    </section>
   </div>
   <%@include file="/footer.jsp" %>
</body>
</html>