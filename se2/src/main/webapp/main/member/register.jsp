<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="com.hotel.member.MemberDAO" %>
<%@page import="com.hotel.member.RegisterDTO" %>

<jsp:useBean id="mdao" class="com.hotel.member.MemberDAO"></jsp:useBean>
<jsp:useBean id="dto" class="com.hotel.member.RegisterDTO"></jsp:useBean>

<%
//dto에서 값 가져와야됨 !!!! ㅜㅜ

RegisterDTO mdto = mdao.registerOk();
 
int midx = 0;
String mid = "";
String mfname = "";
String mlname = "";

if (mdto != null ) {
    midx = mdto.getMidx(); 
    mid = mdto.getMid(); 
    mfname = mdto.getMfname(); 
    mlname = mdto.getMlname(); 

}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HELIA HOTEL : 회원가입</title>
 <style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box; /* 패딩과 테두리를 크기 계산에 포함 */
    }
    body {
        text-align: center; /* 화면 중앙 배치 효과 */
        margin: 0 auto;
        padding: 0;
        font-family: Arial, sans-serif;
    }
    .container {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 100%;
        max-width: 1200px;
        margin: 0 auto;
        padding: 50px 20px;
    }

    h2 {
        margin-bottom: 20px;
        font-size: 28px;
        color: #6b4c2f;
    }

    h4 {
        font-size: 22px;
        color: #4e4e4e;
    }

    h6 {
        font-size: 16px;
        color: #666;
    }

    .box {
        
        border: 5px solid  #E4D9C7;

       
        border-radius: 10px;
        padding: 20px;
        width: 100%;
        max-width: 600px;
        
    }

    .box label {
        font-size: 16px;
        color: #4e4e4e;
        display: inline-block;
        width: 45%; /* label의 너비를 각각 45%로 설정 */
        text-align: center;
    }

    .box .label-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 100%;
        margin-bottom: 10px;
    }

    .box .label-container span {
        width: 5%;
        text-align: center;
        font-size: 18px;
        color: #4e4e4e;
    }

    .box p {
        background-color: #e4d9c7;
        padding: 15px;
        border-radius: 8px;
        color: #333;
        font-size: 14px;
        margin-top: 15px;
    }

    .box hr {
        border: none;
        border-top: 2px solid #ddd;
        margin: 15px 0;
    }

    .box .btn-submit {
        width: 100%;
        padding: 12px;
        font-size: 16px;
        border: 1;
        background-color: #f0b675;
        cursor: pointer;
        border-radius: 5px;
    }

    .box .btn-submit:hover {
        background-color: #e08e4c;
    }

    .login-btn-container {
        margin-top: 20px;
        font-size: 14px;
    }

    .login-btn-container a {
        color: #fff;
        text-decoration: none;
        padding: 10px 20px;
        background-color: #6b4c2f;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    .login-btn-container a:hover {
        background-color: #bca987; 
    }
    
    /** 상단에 표처럼 생긴 거 꾸민 것 css @*/
     .step-wrapper {
        display: flex;
        justify-content: center; /* wrapper 안에서 가운데 정렬 */
    }

    .step-container {
        display: flex;
        gap: 2rem;
    }

    .step {
        text-align: center;
        padding: 1rem;
        border-bottom: 3px solid #ccc;
        color: #888;
        font-weight: bold;
        min-width: 120px;
    }

    .step.active {
        border-bottom: 4px solid #825517;
        color: #000;
       
       }
    

  </style>
  <script>
    function loginButton() { 
        window.location.href = 'login.jsp'; 
    }
  </script>
</head>
<body>
<%@ include file="/header.jsp" %>

    <section class="container">
      <div class="step-wrapper">
   		 <div class="step-container">
           <div class="step">약관동의</div>
           <div class="step">회원정보 입력</div>
           <div class="step active">가입완료</div>
         </div>
      </div><br>

        <div class="box">
            <h2>헬리아리워즈 가입완료</h2> 
            <h4 style="color:#aca291">감사합니다.</h4>
            <h6><%=mfname+mlname%> 님께서는 헬리아리워즈에 정상적으로 가입되셨습니다.</h6>
            <hr>

            <div class="label-container">
                <label>헬리아 리워즈 번호</label>
                <span>ㅣ</span>
                <label style="color:#aca291"><%=midx%></label>
            </div>
            <div class="label-container">
                <label>아이디</label>
                <span>ㅣ</span>
                <label style="color:#aca291"><%=mid %></label>
            </div>

            <p>
                헬리아리워즈 번호는 가입 시 기재하신 이메일로 발송되었습니다.<br>
                로그인 하신 후 다양한 혜택과 서비스를 경험해보시기 바랍니다.
            </p>
        </div>

        <div class="login-btn-container">
            <a href="login.jsp">로그인</a>
        </div>
    </section>     
<%@ include file="/footer.jsp" %>
</body>
</html>
