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
        <h1>문의하기</h1>

        <label>회원님께서 문의하신 내역과 답변을 확인하실 수 있습니다.</label>
        <br>
        기간조회
        <input type="button" value="1개월">
        <input type="button" value="3개월">
        <input type="button" value="6개월">
        <input type="button" value="전체">
        <input type="button" value="조회">
        <br>
        total:0
        <table>
            <tr>
                <th>No</th>
                <th>제목</th>
                <th>문의일자</th>
            </tr>
            		<tbody>
		<%
		String id = (String)session.getAttribute("sessionid");
		ArrayList<AsklistDTO> arr = adao.askList(id); 
		if(arr==null || arr.size()==0) {
			%>
			<tr>
				<td colspan="3" align = "center">
				등록된 게시글이 없습니다.
				</td>
			</tr>
			<%
		} else {
			for(int i = 0; i<arr.size(); i++) {
				%>
				<tr>
					<td><%=arr.get(i).getRownum() %></td>
					<td><%=arr.get(i).getItitle() %></td>
					<td><%=arr.get(i).getIdate()%></td>
				</tr>
				<%
			}
		}
		%>
		</tbody>
        </table>
    </section>
  </div>
<%@include file="/footer.jsp" %>
</body>
</html>


