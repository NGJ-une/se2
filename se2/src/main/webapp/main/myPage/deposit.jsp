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
        <h1>충전하기</h1>

        <label>충전할 금액 : </label>
        <input type="text" >
        <br>
        <br>
        <input type="button" value="충전">
        <input type="button" value="취소">
    </section>
  </div>
</body>
</html>

