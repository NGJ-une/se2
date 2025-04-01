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
    .loginfindCon{
        display: flex;
    }
    .loginmenu{
      padding: 20px;
      margin-right: 5px;
      border: 2px solid black;
      width: 200px;
      background-color: whitesmoke;
    }
    .idForm{
      padding: 20px;
      border: 1px solid #ccc;
      width: 800px; 
      background-color: white;
    }
</style>
</head>
<body>
    <section class="loginfindCon">
          <nav class="loginmenu">
            <br>
            <div>로그인</div><br><hr>
            <br>
            <div>로그인</div>
            <br>
            <div>아이디 찾기</div>
            <br>
            <div>비밀번호 찾기</div>
            <br>
            <hr>
            <br>
            <div>회원가입</div>
          </nav>
        <fieldset>
            <article class="idForm">
            <form name="idFind" action="idFind_ok.jsp" method="post">
                <h2>아이디찾기</h2>
                <hr>
                <ul>
                   <li><label>전화번호 : </label><input type="text"></li><br>
                   <li>
                     <label>질문 : </label>
                        <select name="question"> 
                            <option value="question1">  질문 1 : 당신이 태어난 도시의 이름은 무엇인가요? </option>
                            <option value="question2">  질문 2 : 당신의 초등학교 이름은 무엇인가요? </option>
                            <option value="question3">  질문 3 : 당신의 어렸을 적 별명은 무엇인가요? </option>
                            <option value="question4">  질문 4 : 당신의 부모님의 고향은 어디인가요? </option>
                            <option value="question5">  질문 5 : 당신의 초등학교 선생님의 성함은 무엇인가요? </option>
                        </select>
                </li><br>
                <li>
                    <label>답변 : </label><input type="text" name="answer"><br><br>
                </li>
                <li><input type="submit" value="아이디찾기"></li>
                </ul>
            </form>
        </fieldset>
    </article>
    </section>     
</body>
</html>