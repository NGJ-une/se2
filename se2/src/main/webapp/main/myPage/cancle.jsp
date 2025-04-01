<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
          <h1>회원탈퇴</h1>
            <hr>
            <fieldset>ㅇㅇ 님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 더 확인합니다.</fieldset>
            <br>
          <label>회원 번호 : </label>
          1
          <br><br>
          <label>비밀 번호 :</label>
          <input type = "text">
          <br>
          <br>
          <input type="button" value="탈퇴">
          <input type="button" value="취소">
      </section>
    </div>
  </body>
</html>