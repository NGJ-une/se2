<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
		/*background: #e8e8e8;*/
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
  </style>
</head>
<body>
<%@include file="/header.jsp" %>
    <div class="container">
    	<%@include file="sideBar.jsp" %> 
         	<section class="box2">
            	<form name="idFind" action="idFind_ok.jsp" method="post">
               	 <h1>아이디찾기</h1>
               	 <hr>
               	 <fieldset>
                   	 <label>전화번호 : </label><input type="text" name="tel">
                   	 <br>
                   	 <label>(000-0000-000 형식으로 입력해주세요.)</label>
                   	 <br>
                     <label>질문 : </label>
                     <select name="question"> 
							<option value="1">  질문 1 : 보물 1호는? </option>
                            <option value="2">  질문 2 : 내가 다닌 초등학교 이름은? </option>
                            <option value="3">  질문 3 : 짝사랑했던 이성친구 이름은? </option>
                            <option value="4">  질문 4 : 어렸을 적 별명은?  </option>
                            <option value="5">  질문 5 : 내가 살던 고향은? </option>
                     </select>
                     <br>      
                     <label>답변 : </label><input type="text" name="answer">
                     <br><br>
               	 	 <input type="submit" value="아이디찾기">
            	 </fieldset>
            	</form>
  		  </section>     
    </div>
  <%@include file="/footer.jsp" %>
</body>
</html>