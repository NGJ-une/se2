<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HELIA HOTEL : 아이디 중복검사</title>
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
        max-width: 500px;  /* 폼의 최대 너비 설정 */
        padding: 20px;
        box-sizing: border-box;
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
        gap: 12px;
        justify-content: space-between;
    }

    input[type="text"] {
        flex: 1;
        padding: 14px;  /* 패딩을 더 주어 입력창을 더 길게 설정 */
        font-size: 16px;  /* 폰트 크기를 키워 입력창을 더 길게 */
        border: 1px solid #ccc;
        border-radius: 3px;
        box-sizing: border-box;
        height: 50px;  /* 입력창 높이를 더 크게 설정 */
    }

    input[type="text"]:focus {
        outline: none;
        border-color: #f0b675;
    }

    input[type="submit"] {
        width: 150px;  /* 버튼 크기를 더 크게 설정 */
        padding: 12px 16px;
        font-size: 16px;
        background-color: #E4D9C7;
        color: black;
        font-weight: bold;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        white-space: nowrap;
        height: 50px;
    }

    input[type="submit"]:hover {
        background-color: #825517;
        color: #fff;
    }

    .idDuplitionMsg, #idErrorMsg {
        color: red;
        font-size: 16px;
        margin-top: 10px;
        word-wrap: break-word;  /* 긴 메시지가 있을 경우 줄바꿈 처리 */
        white-space: pre-wrap;  /* 공백도 유지하면서 줄바꿈 처리 */
        max-width: 100%; /* 메시지가 화면 크기를 벗어나지 않도록 설정 */
    }

</style>
<script>
    // 아이디: 영문 + 숫자만 허용, 숫자만은 안 됨
    function blockId(input) {
        input.value = input.value.replace(/[^a-zA-Z0-9]/g, "");
    }

    function idCheck() {
        const userid = document.getElementById("userid").value;
        const msg = document.getElementById("idErrorMsg");

        // 숫자만 입력된 경우 오류 메시지 표시
        if (/^\d+$/.test(userid)) {
            msg.textContent = "아이디는 숫자로만 구성될 수 없습니다. 영문을 포함해주세요.";
            return false;
        }

        msg.textContent = ""; // 정상일 경우 메시지 제거
        return true;
    }
</script>
</head>
<body>
    <div class="formWrap">
        <form name="idCheck" action="idCheck_ok.jsp" onsubmit="return idCheck();">
            <h2>아이디 중복 확인</h2>
            <hr>
            <div class="inputGroup">
                <input type="text" name="userid" id="userid" placeholder="ID 입력" required oninput="blockId(this)">
                <input type="submit" value="중복검사">
            </div>

            <p id="idErrorMsg"></p>

            <%
                // 중복 검사 결과에 따른 메시지 표시
                String errorMsg = (String)session.getAttribute("errorMsg");
                if(errorMsg != null) {
            %>
                <p class="idDuplitionMsg"><%=errorMsg %></p>
            <%
                    session.removeAttribute("errorMsg");
                }
            %>
        </form>
    </div>
</body>
</html>