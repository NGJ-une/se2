<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.hotel.mypage.*" %>
<jsp:useBean id="adao" class = "com.hotel.mypage.AsklistDAO"></jsp:useBean>
<%
String iidx_s = request.getParameter("iidx");
if(iidx_s==null || iidx_s.equals("")) {
	iidx_s = "0";
}
int iidx = Integer.parseInt(iidx_s); // 결과값을 int로 바꾸는 것
AsklistDTO dto = adao.askcontent(iidx);
if(dto == null) {
	%>
	<script>
	window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
	location.href = '/main/myPage/askList.jsp';
	</script>
	<%
	return; 
}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>가로로 두 공간 만들기</title>
<style>
	* {
	  margin: 0;
	  padding: 0;
	  box-sizing: border-box;
	}
	
	body {
	  text-align: center;
	  margin: 0 auto;
	  padding: 0;
	  font-family: 'Noto Sans KR', sans-serif;
	  background-color: #f5f5f5;
	}
	
	.container {
	  display: flex;
	  width: 1200px;
	  margin: 0 auto;
	}
	
	/* 메인 콘텐츠 영역 */
	.box2 {
	  padding: 40px;
	  border-radius: 12px;
	  background-color: #ffffff;
	  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	  color: #333;
	  width: 900px;
	}
	
	/* 제목 */
	.box2 h1 {
	  text-align: left;
	  font-size: 32px;
	  font-weight: bold;
	  margin-bottom: 10px;
	  color: #222;
	}
	
	.box2 hr {
	  margin-bottom: 20px;
	  border: none;
	  border-top: 1px solid #ccc;
	}
	
	/* 폼 테이블 */
	table.content {
	  width: 100%;
	  border-collapse: separate;
	  border-spacing: 0 15px;
	  background-color: #fff;
	}
	
	table.content th {
	  text-align: left;
	  padding: 8px 10px;
	  font-size: 15px;
	  font-weight: bold;
	  color: #333;
	}
	table.content td input[type="text"],
	table.content td textarea {
	  width: 100%;
	  padding: 12px 14px;
	  border: 0.5px solid #ccc;
	  border-radius: 6px;
	  font-size: 16px;
	  background-color: #fafafa;
	  transition: border-color 0.3s ease;
	}
	
	/* 버튼 스타일 */
	table.content td input[type="button"] {
	  width: 100px;
	  height: 40px;
	  font-size: 16px;
	  font-weight: bold;
	  border-radius: 6px;
	  border: none;
	  color: gray;
	  background-color: #fbf4d7;
	  margin: 0 10px;
	  cursor: pointer;
	}
	
	/* textarea 조정 */
	table.content td textarea {
	  resize: vertical;
	  min-height: 500px;
	}
	
</style>

</head>
<body>
<%@include file="/header.jsp" %>
  <div class="container">
    <%@include file="/main/myPage/sideBar.jsp" %>
<section class="box2">
    <h1>문의내역</h1>
    <hr>
    <form>
        <table class="content">
            <tr>
                <th>문의 분류</th>
                <td colspan="3">
                    <input type="text" name="ititle" value="<%=dto.getItitle()%>">
                </td>
            </tr>
            <tr>
                <th>제목</th>
                <td colspan="3">
                    <input type="text" name="ititle" value="<%=dto.getItitle()%>">
                </td>
            </tr>
            <tr>
                <th>문의 날짜</th>
                <td colspan="3">
                    <input type="text" name="ititle" value="<%=dto.getIdate()%>">
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    <textarea name="icontent" rows="8"><%=dto.getIcontent()%></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="4" align="center">
                	<a href = "/se2/main/myPage/askList.jsp">
                    <input type="button" value="목록으로">
                    </a>
                </td>
            </tr>
        </table>
    </form>
</section>
  </div>
<%@include file="/footer.jsp" %>
</body>
</html>


