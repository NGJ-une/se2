<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    /* loginZone 섹션 스타일 */

   .loginZone{
      padding: 30px;
      margin-right: 20px;
      border: 1px solid #ddd; /* 더 부드러운 테두리 */
      border-radius: 8px; /* 둥근 테두리 추가 */
      background-color: #ffffff; /* 배경색 변경 */
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과로 입체감을 줌 */
      width: 300px;
      font-size: 16px;
  }
    .loginZone .loginSideBar{
      font-size: 22px;
      font-weight: bold;
      margin-bottom: 20px;
   	  color: #333;
 }
   .loginZone ul {
      list-style-type: none;
 }
    .loginZone  ul li {
      margin-bottom: 12px;
 }
    .loginZone ul li a {
      text-decoration: none;
      color: #333; /* 텍스트 색상 변경 */
      font-size: 18px;
      display: block;
      padding: 10px 15px;
      border-radius: 5px; 
      transition: all 0.3s ease; /* 부드러운 애니메이션 효과 추가, transition: [속성] [시간] [타이밍 함수] [지연 시간] */
    }
     .loginZone hr{
      border: 1px solid #eee; /* 세로 구분선을 더 깔끔하게 */
      margin: 20px 0;
    }
    
</style>
    <section class="loginZone">
    	<div class="loginSideBar">
    		<a href = "../myPage/myPage_main.jsp">마이페이지</a>
		</div>
		<hr>
		<ul>
            <li><a href="login.jsp">로그인</a></li>
        <hr>
            <li><a href="idFind.jsp">아이디 찾기</a></li>
            <li><a href="pwdFind.jsp">비밀번호 찾기</a></li>
        <hr>
            <li><a href="memberJoin.jsp"></a></li>
        </ul>
     </section>