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
    
    h1{
    color: #6b4c2f;
    }
  </style>
</head>
<body>
<%@include file = "/header.jsp" %>
<div class="container">
  	<%@include file = "hotelInfoSideBar.jsp" %>
  <section class="box2">
      <h1>HELIA Ulsan</h1>
        <img src = "/se2/main/hotelInfo/img/ulsan.jpg" alt="h1" class = "hotelimg">
<label><h3>HELIA 호텔 울산 지점</h3></label>
  <br>
  <label><h3>Welcome to HELIA Hotel Ulsan, where luxury meets comfort.</h3></label>
  <br>
  <p>HELIA 호텔 울산 지점은 울산의 중심에서 최상의 서비스와 편안함을 제공합니다. 
     현대적이고 고급스러운 디자인, 세심한 서비스, 그리고 편리한 위치로 고객님을 맞이합니다. 
     울산의 아름다운 경관을 배경으로 한 HELIA 호텔은 비즈니스와 여가 모두를 위한 이상적인 장소입니다.</p>
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
  <p>HELIA 호텔 울산 지점은 울산을 찾는 여행객들에게 품격 있는 서비스를 제공하며, 
     지역사회와 함께 성장하는 지속 가능한 호텔이 되겠습니다. 
     우리는 고객님의 여행과 비즈니스가 특별하고 기억에 남을 수 있도록, 울산에서만 경험할 수 있는 
     최고의 서비스와 편의를 제공합니다.</p>
  </section>
</div>
<%@include file = "/footer.jsp" %>
</body>
</html>