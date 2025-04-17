<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HELIA HOTEL : 호텔소개</title>
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
    	margin-bottom: 30px;
    	border-bottom: 3px solid #eee;
    	color: #6b4c2f;
    }
    .hotelimg {
    	width: 830px;
    	height: 550px;
    	border-radius: 12px;
   		object-fit: cover;
    }
     ul {
        margin-top: 10px;
        margin-left: 20px;
        list-style-type: none;
  	    padding-left: 0;
    }
  </style>
</head>
<body>
<%@include file = "/header.jsp" %>
<div class="container">
  	<%@include file = "hotelInfoSideBar.jsp" %>
  <section class="box2">
      <h1>개요</h1>
      <div class = "hotelInfoimg">
        <img src = "/se2/main/hotelInfo/img/Helia1.png" alt="h1" class = "hotelimg">
      </div>
<label><h3>Welcome to HELIA Hotel, where luxury meets comfort.</h3></label>
<br>
<p>
  HELIA 호텔은 단순한 숙박 이상의 가치를 제공합니다. 우아한 디자인, 정제된 감성, 그리고 탁월한 서비스를 바탕으로  
  고객 한 분 한 분에게 최상의 경험을 선사하기 위해 존재합니다. 고요한 휴식과 세련된 감각이 조화를 이루는 공간,  
  그것이 바로 HELIA 호텔입니다.
</p>

<p>
  도심 속에서도 자연의 여유로움을 느낄 수 있는 인테리어, 기능성과 감성을 모두 만족시키는 객실 설계,  
  그리고 언제나 따뜻하게 맞이하는 직원들의 환대는 HELIA만의 특별함입니다.  
  HELIA 호텔은 고객의 소중한 순간을 더욱 빛나게 만들어줄 완벽한 무대가 되어드립니다.
</p>

<br>

<label><h3>Core Values of HELIA</h3></label>
<ul>
  <li>고객의 만족을 최우선으로 생각하며, 작은 디테일 하나까지 세심하게 배려합니다.</li>
  <li>변화하는 시대에 발맞추어 끊임없이 혁신하고, 차별화된 서비스를 제공합니다.</li>
  <li>지속 가능한 친환경 운영을 실천하며, 사회적 책임을 다합니다.</li>
  <li>모든 직원은 고객을 가족처럼 여기며, 진심 어린 서비스로 감동을 전합니다.</li>
</ul>

<br>

<label><h3>호텔 비전</h3></label>
<p>
  HELIA 호텔은 글로벌 브랜드로서, 세계 각지의 고객에게 언제나 동일한 품격과 만족을 제공하고자 합니다.  
  단순한 ‘숙박’이 아닌, ‘경험’과 ‘기억’을 선물하는 공간으로 자리매김하며,  
  고객의 삶 속 특별한 순간에 언제나 함께하는 동반자가 되겠습니다.
</p>

<p>
  HELIA는 다가오는 미래를 위한 준비도 게을리하지 않습니다. 디지털 혁신, 지속 가능한 개발, 지역 사회와의 조화로운 상생을 통해  
  더욱 신뢰받는 글로벌 호텔 브랜드로 성장해 나갈 것입니다. 고객의 여정이 시작되는 순간부터 마무리되는 순간까지,  
  HELIA는 늘 그 곁에서 최상의 서비스와 품격 있는 공간으로 함께하겠습니다.
</p>

  </section>
</div>
<%@include file = "/footer.jsp" %>
</body>
</html>