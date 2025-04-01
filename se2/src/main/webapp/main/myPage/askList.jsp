<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>가로로 두 공간 만들기</title>
  <style>
    .container {
      display: flex;
    }
    .box1 {
      padding: 20px;
      margin-right: 5px;
      border: 2px solid black;
      width: 200px;
      background-color: whitesmoke;
    }
    .box2 {
      padding: 20px;
      border: 1px solid #ccc;
      width: 800px; 
      background-color: white;
    }
  </style>
</head>
<body>
  <div class="container">
    <section class="box1">
        <label>마이페이지</label>
        <hr>
        <br>
        <div>충전하기</div>
        <br>
        <div>프로필 수정</div>
        <br>
        <div>비밀번호 변경</div>
        <br>
        <div>문의내역</div>
        <br>
        <div>회원탈퇴</div>
    </section>
    <section class="box2">
        <h1>문의하기</h1>

        <label>회원님께서 문의하신 내역과 답변을 확인하실 수 있습니다.</label>
        <br>
        기간조회
        <input type="button" value="1개월">
        <input type="button" value="3개월">
        <input type="button" value="6개월">
        <input type="button" value="전체">
        <input type="button" value="조회">
        <br>
        total:0
        <table>
            <tr>
                <th>No</th>
                <th>구분</th>
                <th>문의유형</th>
                <th>제목</th>
                <th>문의일자</th>
                <th>답변여부</th>
            </tr>
            
        </table>
    </section>
  </div>
</body>
</html>


