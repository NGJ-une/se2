<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
nav {
	float: left;
}
</style>
</head>
<body>
    header 들어갈 곳
    <hr>
    <nav>
        <table border = "1">
            <tr>
                <td>마이 페이지</td>
            </tr>
            <tr>
                <td>충전하기<br>
                    프로필 수정<br>
                    비밀번호 변경<br>
                    문의내역<br>
                    회원탈퇴
                </td>
            </tr>
        </table>
    </nav>
    <section>
        <article>
            <h2>프로필 수정</h2>
            <fieldset>
                <legend>비밀 번호 확인</legend>
                <table>
                    <tr>
                        <th>회원번호 :</th>
                        <td><input type = "text" name = "idx" readonly></td>
                    </tr>
                    <tr>
                        <th>비밀번호 :</th>
                        <td><input type = "text" name = "pwd"></td>
                    </tr>
                    <tr>
                        <td><input type = "submit" value = "확인"></td>
                        <td><input type = "button" value = "취소"></td>
                    </tr>
                </table>
            </fieldset>
        </article>
    </section>
    <hr>
    footer 들어갈 곳
</body>
</html>