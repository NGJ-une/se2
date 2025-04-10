<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.hotel.mypage.*" %>
<jsp:useBean id="mdao" class="com.hotel.mypage.DepositDAO"></jsp:useBean>
<jsp:useBean id="pdao" class = "com.hotel.mypage.MainPageDAO"></jsp:useBean>
<%
String id = (String)session.getAttribute("sessionid");
String grade = "BRONZE";
int money = mdao.importAmount(id);
if(money > 3000000) {
    grade = "DIAMOND";
} else if(money > 1000000) {
    grade = "GOLD";
} else if(money > 200000) {
    grade = "SILVER";
}
mdao.grade(grade, id);
ArrayList<DepositDTO> arr = mdao.mypageMemberInfo(id);
ArrayList<MainPageDTO> arr2 = pdao.getReserInfo(id);

%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>마이페이지</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Noto Sans KR', sans-serif;
      background-color: #f0f2f5;
    }

    .container {
      display: flex;
      width: 1200px;
      margin: 50px auto;
      gap: 20px;
    }

    .box2 {
      flex: 1;
      background-color: white;
      padding: 40px; /*상하 간격*/
      border-radius: 12px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.08);
    }
    
    .member-card {
      background-color: #fafaf0;
      border-left: 6px solid #f6f6c4;
      padding: 20px 30px;
      border-radius: 8px;
      margin-bottom: 30px;
      text-align: left;
    }

    .member-card h2 {
      font-size: 22px;
      margin-bottom: 10px;
    }

    .member-card p {
      font-size: 16px;
      line-height: 1.6;
    }

    fieldset {
      border: none;
      margin-top: 10px;
    }

    .section-title {
      font-size: 20px;
      font-weight: bold;
      margin: 40px 0 20px;
      border-bottom: 2px solid #f6f6c4;
      padding-bottom: 8px;
      text-align: left;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 10px;
      background-color: #fff;
      border-radius: 8px; /*둥글게 만들기*/
      overflow: hidden;
      box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    }

    th, td {
      padding: 14px 16px;
      text-align: center;
      border-bottom: 1px solid #eee;
    }

    th {
      background-color: #f9fafc;
      color: #333;
      font-weight: 600;
    }

    td {
      color: #555;
    }

    /*등급별 색상 차별화*/
    .grade-diamond { color: #8e44ad; font-weight: bold; }
    .grade-gold { color: #f39c12; font-weight: bold; }
    .grade-silver { color: #3498db; font-weight: bold; }
    .grade-bronze { color: #795548; font-weight: bold; }
  </style>
</head>
<body>
  <%@include file="/header2.jsp" %>
  <div class="container">
    <%@include file="sideBar.jsp" %>
    <section class="box2">
      <%
        if (arr == null || arr.size() == 0) {
      %>
        <script>
          alert("로그인을 확인해주세요.");
          location.href = "../member/login.jsp";
        </script>
      <%
        } else {
      %>
        <div class="member-card">
          <h2><%=arr.get(0).getMfname()%><%=arr.get(0).getMlname()%> 님</h2>
          <p>
            현재 등급: 
            <span class="grade-<%=grade.toLowerCase()%>"><%=grade %></span><br>
            회원 번호: <%=arr.get(0).getMidx() %><br>
            포인트: <%=arr.get(0).getMpoint() %>p
          </p>
        </div>

        <div class="section-title">📅 최근 6개월 예약 내역</div>
        <fieldset>
          <table>
            <tr>
              <th>예약 번호</th>
              <th>방 등급</th>
              <th>예약 날짜</th>
              <th>가격</th>
              <th>인원</th>
            </tr>
			<%
			if(arr2 == null || arr2.size() == 0) {
				%>
				<tr>
					<td colspan="5">최근 6개월 이내에 예약한 방이 없습니다.</td>
				</tr>
				<%
			}else {
				for(int i = 0; i < arr2.size(); i++) {
					%>
					<tr>
					<td><%=arr2.get(i).getRidx() %></td>
					<td><%=arr2.get(i).getRtype() %></td>
					<td><%=arr2.get(i).getRcheckin() %>~<%=arr2.get(i).getRcheckout() %></td>
					<td><%=arr2.get(i).getRmoney() %></td>
					<td><%=arr2.get(i).getRadult() + arr2.get(i).getRkid() %></td>
					</tr>
					<%
				}
			}
			%>
          </table>
        </fieldset>
      <%
        }
      %>
    </section>
  </div>
  <%@include file="/footer2.jsp" %>
</body>
</html>
