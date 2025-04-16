<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복검사</title>
<style>
    html, body {
        margin: 0;
        padding: 0;
        height: 100%;
        font-family: 'Segoe UI', Tahoma, sans-serif;
        background-color: #ffffff;
        color: #333;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .formWrap {
        width: 100%;
        max-width: 400px;
    }

    h2 {
        font-size: 20px;
        margin-bottom: 10px;
        text-align: left;
    }

    hr {
        margin: 16px 0;
        border: none;
        height: 1px;
        background-color: #ccc;
    }

    .inputGroup {
        display: flex;
        gap: 8px; /* 입력창과 버튼 사이 간격 */
    }

    input[type="text"] {
        flex: 1;
        padding: 8px;
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 3px;
        box-sizing: border-box;
    }

    input[type="text"]:focus {
        outline: none;
        border-color: #f0b675;
    }

    input[type="submit"] {
        background-color: #f0b675;
        color: #fff;
        font-weight: bold;
        font-size: 14px;
        padding: 8px 14px;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        white-space: nowrap;
    }

    input[type="submit"]:hover {
        background-color: #e69c4e;
    }
</style>
</head>
<body>
    <div class="formWrap">
        <form name="idCheck" action="idCheck_ok.jsp">
            <h2>아이디 중복 확인</h2>
            <hr>
            <div class="inputGroup">
                <input type="text" name="userid" id="userid" placeholder="ID 입력">
                <input type="submit" value="중복검사">
            </div>
        </form>
    </div>
</body>
</html>
