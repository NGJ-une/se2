<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 목록 리스트</title>

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

%>
 
<body>
<%@include file="/header2.jsp" %>
<section>
    <h2>REVIEW 게시판</h2>
    <div>
        <table>
           <thead>
              <tr>
                  <th>NO.</th>
                  <th>제목</th>
                  <th>ID</th>
                  <th>작성날짜</th>
                  <th>추천</th>
                  <th>비추</th>
                  <th>조회수</th>
               </tr>
           </thead>
           <tbody>
             <tr>
                 <td>1</td>
                 <td>서울 호텔 최고!!!</td>
                 <td>박주연</td>
                 <td>2025-04-10</td>
                 <td>7</td>
                 <td>1</td>
                 <td>53</td>
              </tr>
            </tbody>
        </table>
        
        <!--  페이징  -->
        <div class="paging">
           <a href="#">이전</a>
           <a href="#">1</a>
           <a href="#">2</a>
            <a href="#">다음</a>
        </div>
        
        <!-- 글쓰기 오른쪽 졍랼함 -->
        <div style="text-align: right;">
           <a href="write.jsp" class="write-button"> 글쓰기</a>
        </div>
    </div>
</section>
<%@include file="/footer2.jsp" %>
</body>
</html>