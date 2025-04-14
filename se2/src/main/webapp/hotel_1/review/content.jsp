<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.hotel.seoul.HotelReviewDTO" %>
<!DOCTYPE html>
<jsp:useBean id="rdao" class = "com.hotel.seoul.HotelReviewDAO"></jsp:useBean>
<html>
<head>
<meta charset="UTF-8">
<title>본문 내용</title>
<style>
    body {
        font-family: '맑은 고딕', sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 0;
    }

    section {
        max-width: 1000px;
        margin: 40px auto;
        padding: 40px;
        background-color: white;
        border-radius: 12px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.08);
        text-align: left;
    }

    ul {
        list-style: none;
        padding: 0;
        margin: 0;
        width: 100%;
    }

    ul li {
        margin-bottom: 18px;
        font-size: 16px;
        line-height: 1.8;
        width: 100%;
    }

    .center-part {
        text-align: center;
    }

    textarea {
        width: 100%;
        height: 100px;
        font-size: 15px;
        padding: 12px;
        border-radius: 8px;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }

    .comment-submit {
        text-align: right;
    }

    input[type="button"] {
        margin-top: 10px;
        margin-right: 10px;
        padding: 8px 16px;
        border: none;
        border-radius: 6px;
        background-color: orange;
        color: white;
        cursor: pointer;
    }

    .totalStar {
       display: flex;
       justify-content: center;
    }

    .star {
       appearance: none;
       padding: 1px;
    }

    .star::after {
       content: '☆';
       color: hsl(60, 80%, 45%);
       font-size: 20px;
    }

    .star:hover::after {
        content: '★';
    }

    .star:has(~ .star:hover)::after {
       content: '★';
    }

    .star:checked::after, .star:has(~ .star:checked)::after {
       content: '★';
    }

    .star:hover ~ .star::after {
       content: '☆';
    }

</style>
</head>
<%
String id = (String)session.getAttribute("sessionid");
String vidx = request.getParameter("vidx");
int idx = 0;
if(vidx != null) idx = Integer.parseInt(vidx); 
ArrayList<HotelReviewDTO> arr = rdao.getReviewRead(idx);
%>
<body>
<%@include file="/header.jsp" %>
<section>
    <article class="center-part">
        <h2>본문 내용</h2>
        <ul>
            <li>작성자 : <%=arr.get(0).getVid() %></li>
            <%
            if(arr == null || arr.size() == 0) {
            	%>
            	<li>내용이 없습니다.</li>
            	<%
            }else {
            %>
            <li>작성날짜 : <%=arr.get(0).getVdate() %></li>
            <li>평점 
                 <div class="totalStar">
        <%
            int score = arr.get(0).getVtotal();
            for(int i=1; i<=5; i++) {
                if(i <= score) {
        %>
            <span style="font-size: 20px; color: gold;">★</span>
        <%
                }else {
        %>
            <span style="font-size: 20px; color: lightgray;">☆</span>
        <%
                }
            }
        %>
    </div>
            </li>
            <li>제목 : <%=arr.get(0).getVtitle() %></li>
            <li>내용 : <%=arr.get(0).getVcontent() %></li>
            
            <li><img src = "" alt = "사용자 업로드 이미지"></li>
        </ul>
        <%
            }
        %>
        
    </article>

    <hr><br>

    <div style="text-align: center">
        <input type="button" name="recommend" value="추천">
        <input type="button" name="notrecommend" value="비추천">
    </div>

    <br><hr><br>

    <div>
        <ul>
            

            <li>작성자 : 내용 
                <input type="button" value="추천"> 
                <input type="button" value="비추천">
                <a>답글</a>
            </li>

            <li>작성자 : 내용 
                <input type="button" value="추천"> 
                <input type="button" value="비추천">
                <a>답글</a>
            </li>

            <li>작성자 : 내용 
                <input type="button" value="추천"> 
                <input type="button" value="비추천">
                <a>답글</a>
            </li>

            <li>l</li>

            <li>ㅡ 작성자 : 내용 
                <input type="button" value="추천"> 
                <input type="button" value="비추천">
                <a>답글</a>
            </li>
        </ul>
    </div>

    <div>
        <ul>
            <li><br>
                <textarea style = "resize: none;"></textarea>
                <div class="comment-submit">
                    <input type="button" value="등록">
                </div>
            </li>
        </ul>
    </div>

    <br><hr><br>

    <div style="text-align:center">
        <input type="button" name="writeEdit" value="게시글 수정">
        <input type="button" name="writeDelete" value="게시글 삭제">
        <input type="button" name="writeList" value="게시글 목록">
    </div>

    <br><br>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>
