<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.hotel.mypage.*" %>
<jsp:useBean id="adao" class = "com.hotel.mypage.AsklistDAO"></jsp:useBean>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>가로로 두 공간 만들기</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box; /* 패딩과 테두리를 크기 계산에 포함 */
    }

    body {
        text-align: center; /* 화면 중앙 배치 효과 */
        margin: 0 auto;
        padding: 0;
    }

    .container {
        display: flex;
        width: 1200px;
        margin: 0 auto;
    }

    .box2 {
        padding: 20px;
        border: 1px solid #ccc;
        width: 900px;
        background-color: white;
    }
	.box2 label {
		text-align:left;
	}
    /* 테이블 스타일 */
    table.list {
        width: 100%;
        border-collapse: collapse; /* 테두리 간격 제거 */
        margin-top: 20px;
    }

    table.list th, table.list td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;
    }

    table.list th {
        background-color: #fbf4d7; /*#E4D9C7; /* 헤더 배경색 */
        font-weight: bold;
    }
	table.list tr{
		background-color: white;
	}
	
    /* 버튼 스타일 */
    .listbt{
    	text-align:right;
    }
    .listbt input[type="button"] {
        padding: 10px 15px;
        margin: 10px 5px;
        border: 1px solid #f2f2f2;
        background-color: #f2f2f2;
        color: black;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
        transition: background-color 0.3s ease;
    }

    .listbt input[type="button"]:hover {
        background-color: #f0b675; /* 호버 시 버튼 색상 변경 */
    }
    .listbt input[type="text"] {
    	width:110px;
    	height:50px;
    	text-align:center;
    	margin-right:15px;
    	border: 1px;
    	
    }

    /* 공지 텍스트 */
    .box2 label {
        display: block;
        margin-bottom: 15px;
        font-size: 18px;
        color: #333;
    }

    .box2 h1 {
        text-align: left;
        font-size: 28px;
        margin-bottom: 20px;
    }
    .box2 hr {
    	margin-bottom: 20px;
    }
    .listpage{
    	background-color: #f2f2f2  !important;
    	
    	border:none;
    }
    .listpage a{
    	text-decoration: none;
    	color : black;
    }
    .askbt input[type="button"]{
    	padding:10px;
    	text-align:center;
    	border-color: white;
    	font-weight: bold;
    }
</style>
<script>
function updateAskDate(months) {
	  // 현재 날짜 가져오기
	  var now = new Date();

	  // 지정한 개월 수를 뺌
	  now.setMonth(now.getMonth() - months);

	  // 날짜를 "yyyy년 MM월 dd일" 형식으로 변환
	  var formattedDate =
	    now.getFullYear() + "년 " +
	    String(now.getMonth() + 1).padStart(2, '0') + "월 " +
	    String(now.getDate()).padStart(2, '0') + "일";

	  // 업데이트된 날짜를 출력하거나 입력 필드에 반영
	  document.querySelector('input[name="askdate"]').value = formattedDate;
	}
function updateZero(){
	  document.querySelector('input[name="askdate"]').value = "";
}

</script>
</head>
<%
String id = (String)session.getAttribute("sessionid");
int totalCnt=adao.getTotalCnt(id);
int listSize = 10;
int pageSize = 5;
String cp_s = request.getParameter("cp");
if(cp_s==null || cp_s.equals("")){
	cp_s="1";
}
int cp = Integer.parseInt(cp_s);

int totalPage = (totalCnt/listSize)+1;
if(totalCnt%listSize==0)totalPage--;
int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;
%>
<body>
<%@include file="/header2.jsp" %>
  <div class="container">
    <%@include file="sideBar.jsp" %>
    <section class="box2">
        <h1>문의내역</h1>
		<hr>
        <label>회원님께서 문의하신 내역과 답변을 확인하실 수 있습니다.</label>
        <br>
		<%

		    java.time.LocalDate today = java.time.LocalDate.now();	
		    java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
		    String formattedDate = today.format(formatter);
		%>
		<div class="listbt">
		    기간조회
		    <input type="button" value="1개월" onclick="updateAskDate(1)">
		    <input type="button" value="3개월" onclick="updateAskDate(3)">
		    <input type="button" value="6개월" onclick="updateAskDate(6)">
		    <input type="button" value="전체" onclick="updateZero()">
		    <br>
		    <input type="text" name="askdate" value="" readonly>
		    <input type="text"  value="~" readonly style='width:30px;'>
		    <input type="text" name="now" value="<%= formattedDate %>" readonly>
		    <input type="button" value="조회">
		    <hr>
		</div>
        <table class ="list">
        	<thead>
	           <tr class ="listhead">
	               <th style='width:100px;'>No</th>
	               <th style='width:600px;'>유형 | 제목</th>
	               <th style='width:200px;'>문의일자</th>
	           </tr>
            </thead>
            <tfoot>
				<tr class="listpage" >
					<td colspan ="2" align = "center">
				<%
				if(userGroup!=0){
				%>
				<a href="askList.jsp?cp=<%=(userGroup-1)*pageSize+pageSize %>">&lt;</a>
				<% 
				}
				for(int i=(userGroup*pageSize+1); i<=(userGroup*pageSize +pageSize);i++){
					if(i==cp){
						%>&nbsp;&nbsp;<a href="askList.jsp?cp=<%=i%>"style="color:red; font-weight:bold"><%=i%></a>&nbsp;&nbsp;<%	
					} else {
						%>&nbsp;&nbsp;<a href="askList.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;<%
					}
					
					if(i==totalPage){
						break;
					}
				}
				if(((totalPage/pageSize)-(totalPage%pageSize==0?1:0))!=userGroup){
					%>
					<a href = "askList.jsp?cp=<%=(userGroup+1)*pageSize+1 %>">&gt;</a>
					<%
				}
				%>
					<td class = "askbt"><a href="ask/askWrite.jsp">
					<input type="button" value="문의하기">
					</a></td>
				</tr>
			</tfoot>
	       	<tbody>

			<%
			
			ArrayList<AsklistDTO> arr = adao.askList(id, cp, listSize); 
			if(arr==null || arr.size()==0) {
				%>
				<tr class="listbody">
					<td colspan="3" align = "center">
					등록된 게시글이 없습니다.
					</td>
				</tr>
				<%
			} else {
				for(int i = 0; i<arr.size(); i++) {
					%>
					<tr class="listbody">
						<td style='width:100px;'><%=arr.get(i).getRownum()%></td>  
						<td style='width:600px;'><a href = "ask/askContent.jsp?iidx=<%=arr.get(i).getIidx()%>"><%=arr.get(i).getItitle() %></a></td>
						<td style='width:200px;'><%=arr.get(i).getIdate()%></td>
					</tr>
					<%
				}
			}
			%>
			</tbody>
		
        </table>
    </section>
  </div>
<%@include file="/footer2.jsp" %>
</body>
</html>


