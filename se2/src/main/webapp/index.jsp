<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
/* 섹션 1 이미지 */
.section1 img {
 
    margin-top: 50px; 
    
}
body{
		margin: 0 auto;
		overflow-x:auto;
}
@media (min-width: 1500px) {
    body {
        width: 100%;
    }
}

@media (max-width: 1499px) {
    body {
        width: 1500px; /* 최소 너비로 설정 */
        overflow-x: auto; 
    }
}

	

</style>
</head>
<body>
<%@include file="../header.jsp" %>
    <section class="section1">
        <article>
            <fieldset>
                <img src="main/img/1.jpg" alt="h1">
                <input type="button" value="바로가기">
                <img src="" alt="h2">
                <input type="button" value="바로가기">
            </fieldset>
        </article>
    </section>
    <section>
        <article>
            <fieldset>
            <label>
            새로워진 온라인 예약으로 빠르고 간편하게 예약 및 조회 해보세요.
            </label>
            <input type="button" value="호텔예약 바로가기">
            </fieldset>
            
        </article>
    </section>
    <section>
        <article>
            <fieldset>
            <h2>등급</h2>
            <table>
                <tr>
                    <td>bronze</td>
                    <td>silver</td>
                    <td>gold</td>
                    <td>diamond</td>
                </tr>
                <tr>
                    <td>~%</td>
                    <td>~%</td>
                    <td>~%</td>
                    <td>~%</td>
                </tr>
                <tr>
                    <td colspan="4">조건 : ~~~~~~~~~~</td>
                </tr>
            </table> 
            </fieldset>
            
        </article>
    </section>
    <section>
        <article>
            <fieldset>
            <legend>갤러리</legend>
                <img src="" alt="1">
                <img src="" alt="2">
                <img src="" alt="3">
                <img src="" alt="4">
                <img src="" alt="5">
                <img src="" alt="6">
                <img src="" alt="7">
            </fieldset>
        </article>
    </section>
<%@include file="../footer.jsp" %>
</body>
</html>
