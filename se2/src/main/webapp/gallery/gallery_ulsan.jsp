<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="/se2/css/sideBar.css">
  <style>
    * {
      box-sizing: border-box;
    }
    body {
      text-align: center;
      margin: 0 auto;
      padding: 0;
    }
    .container {
      display: flex;
      width: 1500px;
      margin: 0 auto;
    }
    .box2 {
      padding: 40px;
      border-radius: 12px;
      background-color: #fff;
      width: 1200px;
      font-family: 'Apple SD Gothic Neo', 'Malgun Gothic', sans-serif;
      color: #333;
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
    .box2 table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 20px 20px;
    }
    .tr1 img {
      width: 100%;
      height: auto;
      border-radius: 12px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .tr2 td {
      text-align: center;
    }
    .tr2 img {
      width: 250px;
      height: 250px;
      object-fit: cover;
      border-radius: 12px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
      transition: transform 0.3s ease;
    }
    .tr2 img:hover {
      transform: scale(1.05);
    }
    .tr2 div {
      font-size: 22px;
      font-weight: bold;
      margin: 20px 0;
    }
  </style>
  <script>
  function change(element) {
	  // 상단 이미지와 텍스트 가져오기
	  var tr1Image = document.querySelector(".tr1 img");  // 상단 이미지
	  var tr1Text = document.querySelector(".tr1 div");  // 상단 텍스트

	  // 클릭한 이미지의 src와 텍스트 가져오기
	  var selectedSrc = element.getAttribute("src");
	  var selectedText = element.nextElementSibling.innerText;

	  // 상단 이미지 및 텍스트 변경
	  tr1Image.setAttribute("src", selectedSrc);  // 이미지 변경
	  tr1Text.innerText = selectedText;  // 텍스트 변경
	}
  </script>
</head>
<body>
<%@include file="/header.jsp" %>
  <div class="container">
    <section class="box1">
      <div class="sidebar">
        <label>갤러리</label>
      </div>
      <hr>
      <ul>
        <li><a href="gallery_seoul.jsp">호텔서울</a></li>
        <li><a href="gallery_ulsan.jsp">호텔울산</a></li>
      </ul>
    </section>
    <section class="box2">
      <h1>사진</h1>
      <hr>
      <table>
        <tr class="tr1">
          <td colspan="4">
            <img src="/se2/main/img/1.jpg" alt="front">
            <div>호텔 서울</div>
          </td>
        </tr>
        <tr class="tr2">
          <td>
            <img src="/se2/main/img/3.jpg" alt="standard" onclick="change(this)">
            <div>스탠다드</div>
          </td>
          <td>
            <img src="/se2/main/img/4.jpg" alt="delux" onclick="change(this)">
            <div>디럭스</div>
          </td>
          <td>
            <img src="/se2/main/img/5.jpg" alt="suite" onclick="change(this)">
            <div>스위트</div>
          </td>
          <td>
            <img src="/se2/main/img/6.jpg" alt="grand" onclick="change(this)">
            <div>그랜드</div>
          </td>
        </tr>
      </table>
    </section>
  </div>

<%@include file="/footer.jsp" %>
</body>
</html>