<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 서울 지점 정보 </title>

<style>
 	.container {
      display: flex;
      width: 1500px;
      margin: 0 auto;
    }
	.box2 h1 {
      font-size: 28px;
      margin-bottom: 10px;
      text-align: left;
    }
    .box2 hr {
      border: none;
      border-top: 1px solid #ddd;
      margin: 20px 0;
    }
        .tr1 img {
      width: 100%;
      height: auto;
      border-radius: 12px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .tr2 td {
      text-align: center;
  </style>
  
</head>
<body>
<%@include file="/header2.jsp" %>
<div class="container">
    <%@include file="/main/myPage/sideBar.jsp" %>
    <section class="box2">
      <h1> 서울신라호텔 </h1>
        <hr>
        <table>
          <tr>
         	 <td class="tr1">
         	 	<img src="/se2/main/hotelInfo/img/seoulMainImg.jpg" alt="front">
         	 </td>
       	  </tr>
       	  <tr>
       	  	  <td class="td2">
       	  	  	<h2>Urban Lifestyle Hotel</h2>
       	  	  	한국의 전통미와 현대적 감각을 겸비하고 있는 세계 속의 명문호 서울 신라호텔은 세계 최고의 어번(Urban)의 라이프 스타일 호텔로 고객들에게 최고급 Hospitality 서비스를 제공합니다.
       	  	  		한국을 대표하는 럭셔리 호텔로서 '일상이 최고의 순간이 되는 곳'이라는 컨셉을 새롭게 선보이며 휴식은 물론 고급 식문화, 예술, 뷰티, 쇼핑, 웨딩, 엔터테인먼트 등 고객의 고품격 라이프 스타일을 제안하는 공간으로 거듭나고 있습니다.
       	  	  	
       	  	  </td>
       	  	  <td>
       	  	  <h2> A Leading Global Property</h2>
       	  	  LHW의 멤버로 세계 럭셔리 호텔들과 어깨를 나란히 하고 있는 서울 신라호텔은
       	  	  고객 한 분 한 분을 배려하는 기품있는 서비스로 세계 각국의 수반들과 
       	  	  외교, 경제, 문화 등의 분야의 명사로부터 찬사를 받고 있으며, 
       	  	  Conde Nast Traveler,Travel & Leisure, Zaget, 
       	  	  Euromoney등 권위 있는 해외 매체로부터 매년 
       	  	  한국 최고의 호텔로 선정되고 있습니다.
       	  	  </td>
       	  </tr>
        </table>
        
      <h3>전통과 현대가 공존하는 품격 있는 휴식처</h3><br>

      <h3>세계 수준의 환대와 서비스</h3>
      <br>
      <p>백제호텔은 전 세계 고객의 다양한 기대를 충족시키기 위해, 세심한 배려와 고품격 시설을 갖춘 글로벌 스탠다드의 호텔입니다. 비즈니스, 문화, 휴식의 모든 순간이 특별해질 수 있도록 최고의 경험을 선사합니다.

		핵심 가치: The Pride of Baekje</p>
      <ul>
        <li>전통을 현대적으로 재해석합니다.</li>
        <li>전통을 현대적으로 재해석합니다.</li>
        <li>고객을 위한 최고의 서비스를 지향합니다.</li>
        <li>서로에 대한 존중과 배려를 중시합니다.</li>
      </ul>

  </section>
</div>
<%@include file="/footer2.jsp" %>
</body>
</html>