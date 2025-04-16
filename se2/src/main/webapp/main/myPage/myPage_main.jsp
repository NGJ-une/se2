<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.hotel.mypage.*"%>
<jsp:useBean id="mdao" class="com.hotel.mypage.DepositDAO"></jsp:useBean>
<jsp:useBean id="pdao" class="com.hotel.mypage.MainPageDAO"></jsp:useBean>
<jsp:useBean id="vdao" class="com.hotel.seoul.SeoulWriteDAO"></jsp:useBean>


<%
String id = (String) session.getAttribute("sessionid");
String grade = "BRONZE";
int point = mdao.importAmount(id);
if (point > 3000000) {
	grade = "DIAMOND";
} else if (point > 1000000) {
	grade = "GOLD";
} else if (point > 200000) {
	grade = "SILVER";
}
mdao.grade(grade, id);
ArrayList<DepositDTO> arr = mdao.mypageMemberInfo(id);
ArrayList<MainPageDTO> arr2 = pdao.getReserInfo(id);
ArrayList<Integer> arr3 = vdao.getVridxList(id);

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
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
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
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
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
.grade-diamond {
	color: #8e44ad;
	font-weight: bold;
}

.grade-gold {
	color: #f39c12;
	font-weight: bold;
}

.grade-silver {
	color: #3498db;
	font-weight: bold;
}

.grade-bronze {
	color: #795548;
	font-weight: bold;
}

input[type="button"] {
	padding: 6px 12px;
	font-size: 14px;
	margin-top: 6px;
	margin-right: 6px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s ease, transform 0.2s ease;
	background-color: #b58143;
	color: white;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1);
}

input[type="button"]:hover {
	background-color: #d59a57;
	transform: translateY(-1px);
}

input[type="button"]:active {
	background-color: #a96c2d;
	transform: translateY(0);
}


</style>


</head>
<body>
	<%@include file="/header.jsp"%>
	<div class="container">
		<%@include file="sideBar.jsp"%>
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
				<h2><%=arr.get(0).getMfname()%><%=arr.get(0).getMlname()%>
					님
				</h2>
				<p>
					현재 등급: <span class="grade-<%=grade.toLowerCase()%>"><%=grade%></span>
		<%if ("BRONZE".equals(grade)) { %>
				<img src="img/icon_BRONZE.png" alt="브론즈 등급 이미지" style="width:20px; height:20px; vertical-align: middle; margin-left: 6px;">
	<% } else if ("SILVER".equals(grade)) {
	%>			<img src="img/icon_DIAMOND.png" alt="실버 등급 이미지" style="width:20px; height:20px; vertical-align: middle; margin-left: 6px;">
	<% } else if ("GOLD".equals(grade)) {
	%>			<img src="img/icon_GOLD.png" alt="골드 등급 이미지" style="width:20px; height:20px; vertical-align: middle; margin-left: 6px;">
	<% } else if ("DIAMOND".equals(grade)) {
	%>	<img src="img/icon_SILVER.png" alt="다이아몬드 등급 이미지" style="width:20px; height:20px; vertical-align: middle; margin-left: 6px;">
	<% } %><br>
					<br>
					회원 번호:
					<%=arr.get(0).getMidx()%><br> 누적 결제 금액:
					<%=arr.get(0).getMpoint()%>p
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
						<th>후기</th>
					</tr>
					
				<%
				if (arr2 == null || arr2.size() == 0) {
				%>
				<tr>
					<td colspan="6">최근 6개월 이내에 예약한 방이 없습니다.</td>
				</tr>
				<%
				} else {
					for (int i = 0; i < arr2.size(); i++) {

						
				%>
				<tr>
					<td><%=arr2.get(i).getRidx()%></td>
					<td><%=arr2.get(i).getRtype()%></td>
					<td><%=arr2.get(i).getRcheckin()%> ~ <%=arr2.get(i).getRcheckout()%></td>
					<td><%=arr2.get(i).getRmoney()%></td>
					<td><%=arr2.get(i).getRadult() + arr2.get(i).getRkid()%></td>
					<td>
					<%
						if (arr3 != null && arr3.contains(arr2.get(i).getRidx())) {
					%>
						<a href="/se2/hotel_Seoul/review/content.jsp?vidx=<%=vdao.getvidx(arr2.get(i).getRidx()) %>" style="text-decoration: none;">작성완료</a>
					<%
						} else {
							Date checkoutDate = arr2.get(i).getRcheckout();
							Calendar checkoutCal = Calendar.getInstance();
							checkoutCal.setTime(checkoutDate);

							Calendar today = Calendar.getInstance();
							Calendar sevenAfterCheckout = (Calendar) checkoutCal.clone();
							sevenAfterCheckout.add(Calendar.DAY_OF_YEAR, 7);

							if (!today.before(checkoutCal) && (!today.after(sevenAfterCheckout))) {
					%>
						<a href="/se2/hotel_Seoul/review/write.jsp?vridx=<%=arr2.get(i).getRidx() %>"><input type="button" value="후기작성"></a>
					<%
							} else {
					%>
						작성기간이 아닙니다.
					<%
							}
						}
					%>
					</td>
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
<%@include file="/footer.jsp"%>
</body>
</html>