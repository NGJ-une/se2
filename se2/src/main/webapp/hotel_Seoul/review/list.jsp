<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.hotel.seoul.HotelReviewDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 목록 리스트</title>
<jsp:useBean id="rdao" class = "com.hotel.seoul.HotelReviewDAO"></jsp:useBean>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f9f5f0;
        margin: 0;
        padding: 0;
        color: #5c4033;
    }

    h2 {
        text-align: center;
        color: #f0b675;
        margin-top: 30px;
        font-size: 28px;
        font-weight: bold;
    }

    table {
        width: 90%;
        max-width: 1000px;
        margin: 30px auto;
        border-collapse: collapse;
        border-top: 3px double #60401c;
        border-bottom: 3px double #9c6a31;
        background-color: #ffffff;
        box-shadow: 0px 4px 10px rgba(0,0,0,0.05);
    }

    thead th {
        background-color: #dfceba;
        color: white;
        padding: 12px;
        font-size: 16px;
    }

    tbody td {
        text-align: center;
        padding: 10px;
        border-bottom: 1px solid #eee2d6;
        font-size: 14px;
    }

    tbody tr:hover {
        background-color: #fff8f0;
    }

    a {
        text-decoration: none;
        color: #d0a38e;
    }

    a:hover {
        text-decoration: underline;
    }

    .write-button {
        display: inline-block;
        margin: 20px auto;
        padding: 10px 20px;
        background-color: #eb9c42;
        color: rgb(0, 0, 0);
        border: none;
        border-radius: 10px;
        font-size: 14px;
        cursor: pointer;
        text-align: center;
        
    }

    .write-button:hover {
        background-color: #d17a1684;
    }

    .paging {
        text-align: center;
        margin: 20px 0;
    }

    .paging a {
        margin: 0 5px;
        color: #a0522d;
        text-decoration: none;
        font-weight: bold;
    }

    .paging a:hover {
        text-decoration: underline;
    }
</style>

</head>
 <%
String id = (String)session.getAttribute("sessionid");
int totalCount = rdao.getTotalCount();
int maxList = 10;
int maxPage = 5;
String cp_s = request.getParameter("cp");
if(cp_s==null || cp_s.equals("")) {
	cp_s="1";
}
int cp = Integer.parseInt(cp_s);
int totalPage = (totalCount/maxList)+1;
int userGroup = cp/maxPage;
if(totalCount%maxList==0) totalPage--;
if(cp%maxPage==0) userGroup--;
%>
 
<body>
<%@include file="/header.jsp" %>
<section>
	<h1>REVIEW</h1>
	<div>
	<table>
		<thead>
			<tr>
				<th>NO.</th>
				<th>ID</th>
				<th>제목</th>
				<th>추천수</th>
				<th>평점</th>
				<th>조회수</th>
				<th>작성날짜</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan = "4" align = "center">
				<%
		if(userGroup != 0) {
			%>
			<a href="list.jsp?cp=<%=(userGroup-1)*maxPage+maxPage %>">&lt;</a>
			<%
		}
				%>
				<%
				for(int i = (userGroup*maxPage+1); i <= (userGroup*maxPage+maxPage); i++) {
					%>
					&nbsp;&nbsp;<a href = "list.jsp?cp=<%=i%>"><%=i %></a>
					<%
					if(i == totalPage) {
						 break;
					}
				}
				%>
				<%
				if(((totalPage/maxPage)-(totalPage%maxPage==0? 1 : 0))!= userGroup) {
					%>
					&nbsp;&nbsp;<a href = "list.jsp?cp=<%=(userGroup+1)*maxPage+1%>">&gt;</a>
					<%
				}
				%>
					        <td>
           <a href="write.jsp" class="write-button"> 글쓰기</a>
           </td>
			</tr>
		</tfoot>
		<tbody>
		<%
		ArrayList<HotelReviewDTO> arr = rdao.getInfoReviewList(cp, maxList);
		if(arr == null || arr.size() == 0) {
			%>
			<tr>
			<td colspan = "7" align = "center">등록된 후기가 없습니다.</td>
			</tr>
			<%
		}else {
			for(int i = 0; i<arr.size(); i++) {
				%>
				<tr>
				<td><%=arr.get(i).getVidx() %></td>
				<td><%=arr.get(i).getVid() %></td>
				<td><a href="content.jsp?vidx=<%=arr.get(i).getVidx()%>"><%=arr.get(i).getVtitle() %></a></td>
				<td><%=arr.get(i).getVrecommend() %></td>
				<td><%=arr.get(i).getVtotal() %></td>
				<td><%=arr.get(i).getVreadnum() %></td>
				<td><%=arr.get(i).getVdate() %></td>
				</tr>
				<%
			}
		}
		%>
		</tbody>
	</table>
	</div>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>