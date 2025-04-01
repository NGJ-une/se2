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
                
                <table>
                    <tr>
                        <th>이름 :</th>
                        <td><input type = "text" name = "lname"></td>
                        <th>성 :</th>
                        <td><input type = "text" name = "fname"></td>
                    </tr>
                    <tr>
                        <th>아이디 :</th>
                        <td>db에 저장된 아이디 가져오기기</td>
                    </tr>
                    <tr>
                        <th>E-mail :</th>
                        <td><input type = "text" name = "fmail"> @ </td>
                        <td><input type = "text" name = "mmail"></td>
                        <td><select>
                            <option value = "type">직접입력</option>
                            <option value = "naver.com">naver.com</option>
                            <option value = "daum.net">daum.net</option>
                            <option value = "google.com">google.com</option>
                            <option value = "nate.com">nate.com</option>
                        </select></td>
                    </tr>
                    <tr>
                        <th>전화번호 :</th>
                        <td><input type = "text" name = "tel"></td>
                    </tr>
                    <tr>
                        <th>주소 : </th>
                        <td><input type = "text"></td>
                    </tr>
                    <tr><th rowspan ="2" style = "color:blue;">신라 리워즈 마케팅 동의</th>
                        <th colspan="2">신라 리워즈 개인 정보 마케팅 활용에 동의 하시겠습니까?</th>
                    </tr>
                    <tr>
                        <td> <input type = "radio" value = "1">예 <input type = "radio" value = "2">아니오</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><input type = "submit" value = "변경"></td>
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