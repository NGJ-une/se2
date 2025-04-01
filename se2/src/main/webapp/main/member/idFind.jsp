<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
    h2{
        text-align: center;
    }
    fieldset{
           width:700px;
           margin:0px auto;
        }
    fieldset li{
        list-style: none;
    }
    .idfindZone{
        display: flex;
    }
    .loginmenu{
      padding: 20px;
      margin-right: 5px;
      border: 2px solid black;
      width: 200px;
      background-color: whitesmoke;
    }
    .idFindField{
      padding: 20px;
      border: 1px solid #ccc;
      width: 800px; 
      background-color: white;
    }
</style>
</head>
<body>
    <section class="idfindZone">
          <nav class="loginmenu">
            <br>
            <div>로그인</div><br><hr>
            <br>
            <div>로그인</div>
            <br>
            <div style="color: pink;">아이디 찾기</div>
            <br>
            <div>비밀번호 찾기</div>
            <br>
            <hr>
            <br>
            <div>회원가입</div>
          </nav>
          <fieldset class="idFindField">
            	<form name="idFind" action="idFind_ok.jsp" method="post">
               	 <h2>아이디찾기</h2>
               	 <hr>
               	 <ul>
                   	 <li><label>전화번호 : </label><input type="text"><br></li>
                 	 <li>
                     	<label>질문 : </label>
                        <select name="question"> 
							<option value="question1">  질문 1 : 보물 1호는? </option>
                            <option value="question2">  질문 2 : 내가 다닌 초등학교 이름은? </option>
                            <option value="question3">  질문 3 : 짝사랑했던 이성친구 이름은? </option>
                            <option value="question4">  질문 4 : 어렸을 적 별명은?  </option>
                            <option value="question5">  질문 5 : 내가 살던 고향은? </option>
                        </select><br>      
                	</li>
                	<li>
                    <label>답변 : </label><input type="text" name="answer"><br><br>
                	</li>
               	 	<li><input type="submit" value="아이디찾기"></li>
                </ul>
            	</form>
          </fieldset>
    </section>     
</body>
</html>