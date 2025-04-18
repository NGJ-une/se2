<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class = "com.hotel.mypage.DepositDAO"></jsp:useBean>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>HELIA HOTEL : 환불</title>
 <style>
    * {
	   margin: 0;
	   padding: 0;
	   box-sizing: border-box; /* 패딩과 테두리를 크기 계산에 포함 */ 
	}
	
	body {
		font-family: 'Noto sans KR', sans-serif;
		background-color: #f0f2f5;
	}
    .container {
      display: flex;
      width: 1200px;
      margin: 50px auto;
      gap: 20px;
    }

    .box2 {
      flex: 2;
      padding: 40px;
      border-radius: 12px;
      background-color: #ffffff;
      box-shadow: 0 4px 10px rgba(0,0,0,0.08);
      font-size: 16px;
    }
    h1{
    font-size: 28px;
    color: #333;
    margin-bottom: 30px;
    border-bottom: 3px solid #eee;
    }
    .currentMoney {
    	font-size: 18px;
    	margin-bottom: 25px;
    	color: #b58143;
    	font-weight: bold;
    }
    label {
    	display: block;
    	margin-bottom: 10px;
    	font-size: 16px;
    	color: #555;
    }
  	.bankGroup {
  		display:flex;
  		gap: 10px;
  		align-items: center;
  		margin-bottom: 20px;
  	}
    input[type= "number"] {
    	width: 300px;
    	padding: 12px;
    	font-size: 12px;
    	border: 1px solid #ccc;
    	border-radius: 8px;
    	margin-bottom: 20px;
    }
    input[type = "submit"], input[type="reset"] {
		padding: 12px 24px;	
		font-size: 16px;
		margin-top 20px;
		margin-right: 10px;
		border: none;
		border-radius: 8px;
		cursor: pointer;
		transition: 0.3s ease;
    }
    input[type="submit"] {
    background-color: #b58143;
    	color: white;
    }
    input[type="submit"]:hover {
    	background-color: #f0b675;
    }
    input[type="reset"] {
      background-color: #e0e0e0;
      color: #333;
    }
    input[type="reset"]:hover {
      background-color: #bdbdbd;
    }
   .bankGroup {
    display: flex;
    gap: 10px;
    align-items: center;
    margin-bottom: 20px;
}
	.bankGroup select, .bankGroup input {
	    padding: 12px;
	    font-size: 16px;
	    border: 1px solid #ccc;
	    border-radius: 8px;
	    width: 200px; /* select와 input의 넓이를 동일하게 설정 */
	}
	
	.bankGroup label {
	    font-size: 16px;
	    color: #555;
	}
	.container p {
	    font-size: 14px;
	    margin-top: 10px;
     }
     
     .refundInfoBox {
      flex: 1;
      background-color: #ffffff;
      border-radius: 12px;
      padding: 30px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
      color: #444;
      width: 300px;
    }
    
    .refundInfoBox h3 {
      margin-bottom: 15px;
      color: #444;
    }

    .refundInfoBox p {
      font-size: 15px;
      margin-bottom: 10px;
      line-height: 1.6;
    }

    .emoji {
      font-size: 22px;
      margin-right: 6px;
    }
    
    .refundErrorMsg {
        color: red;
	    font-size: 14px;
	    margin-top: 10px;
    }
  </style>
</head>
<body>
<%@include file = "/header.jsp" %>
  <div class="container">
  <%@include file="sideBar.jsp" %>
    <section class="box2">
    <form name ="refund" action = "refund_ok.jsp">
        <h1>환불하기</h1>

        <%
        String id = (String)session.getAttribute("sessionid");
        int money = mdao.getmemberMmoney(id);
        %>
        <label class = "currentMoney">현재 보유 금액 : <%=money %> 원</label>
        <label>환불할 금액  </label>
        <input type="number" name = "mmoney" required="required" min="1" max ="1000000000">
        <br>
        <label>환불 받을 은행 </label>
        <div class = "bankGroup">
        <select name = "bbank">
        <option value = "0">은행 선택</option>
        <option value = "1">농협</option>
        <option value = "2">국민</option>
        <option value = "3">신한</option>
        <option value = "4">카카오</option>
        </select>
        <br>
         <label>계좌 번호 : </label>
         <input type = "number" name = "bacount" required="required">
        </div>
        <%
		    String errorMsg = (String) session.getAttribute("errorMsg");
		    if (errorMsg != null) {
		%>
		    <p class = "refundErrorMsg"><%= errorMsg %></p>
		<%
		        session.removeAttribute("errorMsg");
		    }
		%>
        <br>
        <input type="submit" value="환불">
        <input type="reset" value="취소">
    </form>
    </section>
      <aside class = "refundInfoBox">
      	<h3>❗유의사항</h3>
      	<p class = "refundInfo"><span class = "emoji">1.</span> 환불 최소 금액은 1,000원 입니다.</p>
      	<p class = "refundInfo"><span class = "emoji">2.</span> 계좌번호 형식은 - 없이 숫자만 입력 해주세요.</p>
      	<p class = "refundInfo"><span class = "emoji">3.</span> 환불 후 환불이 완료되기 전까지 영업일 기준 2~3 일 정도 소요 됩니다.</p>
      	<p class = "refundInfo"><span class = "emoji">☎</span> 문의: 1234-5678</p>
      </aside>
    </div>
  </div>
<%@include file = "/footer.jsp" %>
</body>
</html>

