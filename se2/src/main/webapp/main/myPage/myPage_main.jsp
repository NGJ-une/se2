<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class = "com.hotel.mypage.DepositDAO"></jsp:useBean>
<%
String id = "asd123";
String grade = "BRONZE";
int money = mdao.importAmount(id);
if(money > 3000000) {
	grade = "DIAMOND";
}else if (money > 1000000) {
	grade = "GOLD";
}else if (money > 200000) {
	grade = "SILVER";
}
mdao.grade(grade, id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <section>
        <article>
            <div class="container">
                <div class="sidebar">
                    <p>마이페이지</p>
                </div>
                <ul>
                    <li><a href = "deposit.jsp">충전하기</a></li>
                    <li><a href = "profileEditCheck.jsp">프로필수정</a></li>
                    <li><a href = "pwChange.jsp">비빌번호변경</a></li>
                    <li>문의내역</li>
                    <li>회원탈퇴</li>
                </ul>
            </div>
            <div>
                <p>suhan lee 님은 <br> 
                   <%=grade %> 회원입니다</p>
                    <fieldset>
                        <p>회원번호 12 | 포인트 239p </p>
                    </fieldset>
            </div>
            <div>
                최근 6개월 예약 내역
            </div>
            <div>
                <fieldset>
                    <table>
                        <tr>
                            <th>예약 번호</th>
                            <th>예약한 방 등급</th>
                            <th>예약한 날짜</th>
                            <th>가격</th>
                            <th>인원</th>
                        </tr>
                        <tr>
                            <th>3</th>
                            <th>grand</th>
                            <th>2025-04-02</th>
                            <th>250,000</th>
                            <th>5명</th>
                        </tr>
                    </table>
                </fieldset>
            </div>
        </article>
    </section>
</body>
</html>