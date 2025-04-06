<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
      /* box1 섹션 스타일 */
  .box1 {
    padding: 30px;
    margin-right: 20px;
    border: 1px solid #ddd; /* 더 부드러운 테두리 */
    border-radius: 8px; /* 둥근 테두리 추가 */
    background-color: #ffffff; /* 배경색 변경 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과로 입체감을 줌 */
    width: 300px;
    font-size: 16px;
  }

  .box1 .sidebar {
    font-size: 22px;
    font-weight: bold;
    margin-bottom: 20px;
    color: #333;
  }
  .box1 .sidebar a{
  	text-decoration: none;
  	color:black;
  }
  .box1 ul {
    list-style-type: none;
  }

  .box1 ul li {
    margin-bottom: 12px;
  }

  .box1 ul li a {
    text-decoration: none;
    color: #333; /* 텍스트 색상 변경 */
    font-size: 18px;
    display: block;
    padding: 10px 15px;
    border-radius: 5px;
    transition: all 0.3s ease; /* 부드러운 애니메이션 효과 추가 */
  }

  .box1 ul li a:hover {
    background-color: #e0e0e0; /* 마우스 오버 시 배경색 */
    color: #007BFF; /* 링크 색상 변경 */
  }

  .box1 hr {
    border: 1px solid #eee; /* 세로 구분선을 더 깔끔하게 */
    margin: 20px 0;
  }
    </style>
    <section class="box1">
		<div class="sidebar">
		    <a href = "myPage_main.jsp">마이페이지</a>
		</div>
		<hr>
		<ul>
		    <li><a href = "deposit.jsp">충전하기</a></li>
		    <li><a href = "profileEditCheck.jsp">프로필수정</a></li>
		    <li><a href = "pwChange.jsp">비빌번호변경</a></li>
		    <li><a href = "askList.jsp">문의내역</a></li>
		    <li><a href = "cancle.jsp">회원탈퇴</a></li>
		</ul>
    </section>