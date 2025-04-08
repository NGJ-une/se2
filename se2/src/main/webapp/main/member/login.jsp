<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>

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
    }

    .container {
        display: flex;
        width: 1200px;
        margin: 0 auto;
    }

    form {
        width: 500px;
        text-align: center;
        margin: 100px auto;
    }

    input {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        font-size: 14px;
        box-sizing: border-box;
        border: 1px solid #ccc;
    }

    input[type="submit"] {
        border: none;
        cursor: pointer;
    }

    hr {
        width: 100%;
        border: none;
        border-top: 2px solid #eee;
        margin: 10px 0 20px;
    }

    .checkbox-container {
    width: 100%;
    margin-top: 10px;
    display: flex;
    align-items: center;
    justify-content: flex-start; /* 왼쪽 정렬 */
    padding-left: 2px; /* 살짝 여유 */
}

input[type="checkbox"] {
    width: auto;  /* 이게 포인트! */
    margin: 0 8px 0 0;
}

    label {
        display: inline;
        font-size: 14px;
        color: #333;
    }

    p {
        margin-top: 20px;
    }

    a {
        text-decoration: none;
        color: #007BFF;
        margin: 0 10px;
    }
</style>
</head>

<%
String saveid = ""; 
Cookie cks[] = request.getCookies();
if (cks != null) {
    for (int i = 0; i < cks.length; i++) {
        if (cks[i].getName().equals("saveid")) {
            saveid = cks[i].getValue();
        }
    }
}
%>

<body>
<%@include file="/header2.jsp" %>
<section class="container">
    <form name="login" action="login_ok.jsp" method="post">
        <h1>로그인</h1>
        <hr>
        <p>
            ooo호텔에 오신 것을 환영합니다.<br>
            ※ OOO회원이 되시면 회원만을 위한<br>
            다양한 서비스와 혜택을 받으실 수 있습니다.
        </p>
        <br>
        <hr>
        <br>
        <input type="text" name="userid" placeholder="아이디" value="<%=saveid%>">
        <br>
        <input type="password" name="userpwd" placeholder="비밀번호">
        <br>

        <!-- 아이디 저장 체크박스 왼쪽 정렬 -->
        <div class="checkbox-container">
            <label>
                <input type="checkbox" name="saveid" value="on" <%= saveid.equals("") ? "" : "checked" %>>
                아이디 저장
            </label>
        </div>

        <input type="submit" value="  로그인  ">
        <br>
        <p>
            <a href="idFind.jsp"> 아이디 찾기 </a> |
            <a href="pwdFind.jsp"> 비밀번호 찾기 </a> |
            <a href="memberJoin.jsp"> 회원가입 </a>
        </p>
    </form>
</section>
</body>
<%@include file="/footer2.jsp" %>
</html>