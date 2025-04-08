<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Noto+Sans+KR:wght@400;500&display=swap');
/**/
body {
  margin: 0;
  font-family: 'Noto Sans KR', sans-serif;
  background-color: #fffdfb;
  color: #333;
}

.soft-header {
  background: #fef8f3;
  border-bottom: 1px solid #e2dcd2;
  padding: 10px 0;
  position: relative;
  box-shadow: 0 2px 4px rgba(0,0,0,0.05);
}

.soft-top-links {
  text-align: right;
  padding: 0 50px;
  font-size: 13px;
  color: #777;
}

.soft-top-links a {
  color: #8a8a8a;
  margin-left: 15px;
  text-decoration: none;
  font-weight: 400;
  transition: color 0.3s;
}

.soft-top-links a:hover {
  color: #b58143; /* 부드러운 골드브라운 포인트 */  
}

.soft-main-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 25px 60px;
}

.soft-nav {
  display: flex;
  gap: 25px;
}

.soft-nav a {
  color: #555;
  text-decoration: none;
  position: relative;
  font-weight: 500;
  font-size: 15px;
  transition: color 0.3s ease;
}

.soft-nav a::after {
  content: '';
  position: absolute;
  bottom: -6px;
  left: 0;
  width: 0%;
  height: 2px;
  background: #d4a373;
  transition: width 0.3s;
}

.soft-nav a:hover {
  color: #b58143;
}

.soft-nav a:hover::after {
  width: 100%;
}

.soft-logo {
  font-family: 'Playfair Display', serif;
  font-size: 60px;
  font-weight: 700;
  color: #6b4c2f;
  letter-spacing: 2px;
  text-align: center;
  flex: 0 0 auto;
  text-shadow: 0 1px 2px rgba(210, 180, 140, 0.2);
}
</style>
</head>
<body>
<!-- header.jsp -->
<header class="soft-header">
    <div class="soft-top-links">
      <a href="#"><strong>로그인</strong></a>
      <a href="#">회원가입</a>
    </div>
  
    <div class="soft-main-header">
      <nav class="soft-nav left">
        <a href="#">호텔찾기</a>
        <a href="#">호텔소개</a>
      </nav>
  
      <div class="soft-logo">HOTEL SHILLA</div>
  
      <nav class="soft-nav right">
        <a href="#">예약하기</a>
        <a href="#">예약확인</a>
      </nav>
    </div>
  </header>
</html>