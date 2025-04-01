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
          <h1>프로필 수정
          </h1>
          <hr>
          <fieldset>
            <label>이름 :</label>
            <input type = "text"> 
            <label>성 :</label>
            <input type = "text">
            <br>
            <br>
            <label>아이디 :</label>
            챠니♥쥬니(db 에 있는 아이디 가져오면 됨.)
            <br>
            <br>
            <label>이메일 :</label>
            <input type = "text"> @ <input type = "text">
            <select>
                <option value = "type">직접입력</option>
                <option value = "naver.com">naver.com</option>
                <option value = "google.com">google.com</option>
                <option value = "nate.com">nate.com</option>
                <option value = "daum.net">daum.net</option>
            </select>
            <br>
            <br>
            <label>전화번호 :</label>
            <input type = "text">
            <br>
            <br>
            <label>주소 :</label>
            <input type = "text">
            <br>
            <br>
            <input type ="submit" value = "변경">
            <input type = "button" value = "취소">
          </fieldset>
      </section>
    </div>
  </body>
</html>