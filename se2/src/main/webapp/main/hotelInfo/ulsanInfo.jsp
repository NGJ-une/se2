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
      line-height: 1.7;
    }
    h1 {
    	font-size: 28px;
    	color: #333;
    	margin-bottom: 30px;
    	border-bottom: 3px solid #eee;
    	padding-bottom: 10px
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
    .intro h3{
      font-weight: 600;
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

<div class="Ulsanimg">
  <img src="/se2/main/hotelInfo/img/U_Information.png" alt="HELIA Ulsan" class="hotelimg">
</div>

<label><h3>HELIA 호텔 울산 지점</h3></label>
<br>
<div class = "intro">
<label><h3>Where the ocean breeze meets modern elegance.</h3></label>
</div>
<br>

<p>
  HELIA 호텔 울산은 바다와 도심이 어우러진 특별한 장소에 자리잡은 프리미엄 호텔입니다.  
  동해의 시원한 바다 내음을 가까이에서 느낄 수 있는 이곳은, 일상의 피로를 잊고 여유로운 시간을 보내기에 완벽한 공간입니다.  
  해가 바다 위로 부드럽게 내려앉는 풍경은 HELIA 울산에서만 누릴 수 있는 가장 아름다운 선물입니다.
</p>

<br>

<p>
  비즈니스 출장객에게는 도심의 편리한 접근성과 조용하고 고급스러운 숙박 공간을 제공하며,  
  여행객에게는 바다를 품은 객실, 감각적인 인테리어, 여유로운 휴식 공간을 통해 완벽한 힐링을 선사합니다.  
  가족 여행, 연인과의 특별한 날, 혹은 나를 위한 호캉스까지—모든 순간이 특별한 기억으로 남을 수 있도록 준비했습니다.
</p>

<br>

<p>
  HELIA 호텔은 단순한 숙박을 넘어, 울산이라는 도시의 아름다움과 따뜻함을 담아낸 공간입니다.  
  로비에 들어서는 순간부터 퇴실하는 마지막까지, 고객 한 분 한 분의 여정을 세심하게 배려하는 서비스로 감동을 전합니다.
</p>

<br>

<label><h3>Core Values of HELIA</h3></label>
<ul>
  <li>고객의 만족과 감동을 최우선으로 생각합니다.</li>
  <li>세련된 공간, 세심한 서비스로 완성하는 프리미엄 경험을 제공합니다.</li>
  <li>환경을 생각하는 지속 가능한 운영을 실천합니다.</li>
  <li>모든 직원은 고객을 가족처럼 대하며 따뜻하게 맞이합니다.</li>
</ul>

<br>

<label><h3>HELIA Ulsan's Vision</h3></label>
<p>
  HELIA 울산은 지역의 랜드마크로 자리잡으며, 고객의 일상 속 ‘가장 품격 있는 쉼표’가 되고자 합니다.  
  여행을 더욱 특별하게, 비즈니스를 더 성공적으로, 일상 속 한순간을 더 감성적으로—  
  HELIA는 고객과 함께 ‘기억에 남을 이야기’를 만들어 갑니다.
</p>

<p>
  우리는 지역사회와의 동반 성장을 통해, 울산의 가치를 알리고 함께 발전하는 호텔로 나아가고 있습니다.  
  단순한 숙소가 아닌, 머무는 것만으로도 특별한 경험이 되는 공간.  
  HELIA 호텔 울산에서 여러분을 기다립니다.
</p>
</div>
</section>
<%@include file = "/footer.jsp" %>
</body>
</html>