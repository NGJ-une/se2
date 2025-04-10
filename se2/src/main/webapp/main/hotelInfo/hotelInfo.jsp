<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
    body{
    	font-family: 'Noto Sans KR', sans-serif;
    	background-color: #ffffff;
    }
	  .container {
      display: flex;
      width:1200px;
      margin: 50px auto;
      gap: 20px;
    }
    .box2 {
      flex: 2;
      padding: 40px;
      border-radius: 12px;
      background-color: #ffffff;
      font-size: 16px;
    }
    h1 {
    	font-size: 28px;
    	color: #333;
    	margin-bottom: 30px;
    	border-bottom: 3px solid #eee;
    }
    .hotelimg {
    	width: 830px;
    	height: 550px;
    }
  </style>
</head>
<body>
<%@include file = "/header.jsp" %>
<div class="container">
  	<%@include file = "hotelInfoSideBar.jsp" %>
  <section class="box2">
      <h1>개요</h1>
        <img src = "/se2/main/hotelInfo/img/1.jpg" alt="h1" class = "hotelimg">
 <label><h3>Welcome to HELIA Hotel, where luxury meets comfort.</h3></label>
  <br>
  <p>HELIA 호텔은 우아한 디자인과 세심한 서비스로 고객에게 최상의 경험을 제공합니다. 
     고객님께 최고의 안락함과 품격을 제공하기 위해 노력하는 HELIA는, 현대적이고 편리한 시설과 
     고급스러운 인테리어로 고객을 맞이합니다.</p>
  <br>
  <label><h3>Core Values of HELIA</h3></label>
  <ul>
    <li>고객의 만족을 최우선으로 생각합니다.</li>
    <li>끊임없는 혁신을 통해 서비스를 향상시킵니다.</li>
    <li>친환경적인 운영을 지향합니다.</li>
    <li>모든 직원은 고객을 가족처럼 대합니다.</li>
  </ul>
  <br>
  <label><h3>호텔 비전</h3></label>
  <p>HELIA 호텔은 전 세계 고객에게 품격 높은 서비스를 제공하며, 지속 가능한 성장을 목표로 
     다가오는 시대에 맞춘 최고의 호텔 서비스를 제공하겠습니다. 우리는 고객의 여행과 비즈니스가 
     더욱 특별하고 기억에 남을 수 있도록 항상 노력합니다.</p>
  </section>
</div>
<%@include file = "/footer.jsp" %>
</body>
</html>