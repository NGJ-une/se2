<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<body>
<%@include file="/header.jsp" %>
<section>
    <article class="center-part">
        <h2>본문 내용</h2>
        <ul>
            <li>박주연 (작성자 이름 불러옴)</li>
            <li>2025-04-10</li>
            <li>평점 
                <div class="totalStar">
                    <input type="radio" class="star" id="star1" value="1">
                    <input type="radio" class="star" id="star2" value="2">
                    <input type="radio" class="star" id="star3" value="3">
                    <input type="radio" class="star" id="star4" value="4">
                    <input type="radio" class="star" id="star5" value="5">
                </div>
            </li>
            <li>호텔 넘 좋아요 (제목)</li>
            <li>(내용) 이러이러한 점이 너무 좋더라구요</li>
            
            <li>(사진)</li>
        </ul>
        
    </article>

    <hr><br>

    <div style="text-align: center">
        <input type="button" name="recommend" value="추천">
        <input type="button" name="notrecommend" value="비추천">
    </div>

    <br><hr>

    <div>
        <ul>
            <li>댓글 리스트~</li>

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
                <textarea></textarea>
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
