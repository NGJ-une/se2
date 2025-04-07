<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
 <style>
 
    * {
	   	margin: 0;
	    padding: 0;
	    box-sizing: border-box; /* 패딩과 테두리를 크기 계산에 포함 */
	}
	body {
	    text-align: center; /* 화면 중앙 배치 효과 */
	    margin:0 auto;
	    padding:0;
	}
    .container {
        display: flex;
        width:1500px;
        margin:0 auto;
    }

    .box2 {
        padding: 20px;
        border: 1px solid #ccc;
        width: 1200px; 
        background-color: white;
    }
    
    form {
    	width:300px;
    	text-align: center;
    	margin: 100px auto;  
    }
    
    input {
         width: 100%;
         padding: 10px;
         margin: 10px 0;
         font-size: 14px;
         box-sizing: border-box;
         border: 1px solid #ccc;
    }
    input[type="submit"] {
         border: none;
         cursor: pointer;
	}
    hr {
         width: 100%;
         border: none;
         border-top: 2px solid #eee;
         margin: 10px 0 20px;
    }
    
    
  </style>
</head>
<body>
<%@include file="/header.jsp" %>
    <div class="container">
       <%@include file="sideBar.jsp" %> 
          <section class="box2">
             <form name="pwdFind" action="pwdFind_ok.jsp" method="post">
                <h2>비밀번호 찾기</h2>
                <hr>
               <input type="text" name="id" placeholder="아이디">
                <input type="text" name="tel" placeholder="전화번호">
                <input type="submit" value="비밀번호 찾기">
            </form>
    	</section>    
    </div>  
 <%@include file="/footer.jsp" %>
</body>
</html>