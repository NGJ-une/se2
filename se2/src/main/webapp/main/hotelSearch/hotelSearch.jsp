<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 바탕 화면 투명하게 하는 부분 -->
<div class="overlay" id="overlay" style="display: none;"></div>

<div class="popup-page" id="popupPage" style="display: none;">
  <h2 class="hs">호텔 찾기</h2>
  <table class="table-bt">
	  <tr>
	  <td><a href="index.jsp"><input type="button" class="seoul-bt" value="h-seoul"></a></td>
	  <td><a href="index.jsp"><input type="button" class="ulsan-bt" value="h-ulsan"></a></td>
	  </tr>
  </table>
  <button class="close-bt" onclick="hidePopup()">X</button>
</div>

<script>
  function showPopup() {
    document.getElementById('overlay').style.display = 'block';
    document.getElementById('popupPage').style.display = 'block';
  }

  function hidePopup() {
    document.getElementById('overlay').style.display = 'none';
    document.getElementById('popupPage').style.display = 'none';
  }
</script>

<style>
  .hs{
   color: #d9d9d9;
   background: #e8e8e8;
   text-shadow: -1px -1px 1px rgba(255,255,255,.1), 1px 1px 1px rgba(0,0,0,.5);
   color: #d9d9d9;
   background: #e8e8e8;
   text-align: center;
   font-size: 30px;
  }
  .overlay {
    position: fixed; 
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 999; /*숫자가 클수록 앞으로 나옴*/
    display: none;
  }

  .popup-page {
    position: fixed; /*요소를 화면에 고정*/
    top: 50%; /*수직중심*/
    left: 50%; /*수평중심*/
    transform: translate(-50%, -50%); 
    /*팝업 창이 화면의 중앙에 정확히 배치되도록 보장 
    위에 top과 left는 기준점이 좌상단이여서 위 태그를 이용해 자신의 너비와 높이의 절반만큼 이동*/
    width: 600px;
    background: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
    /*0.3자리는 투명도*/
    z-index: 1000;
    display: none;
  }
  .table-bt{
  	border:none;
  	width:500px
  	text-align:center;
  }
  .seoul-bt,.ulsan-bt{
   width:250px;
   height:200px;
   color: #d5d5d5;
   background: #e8e8e8;
   text-shadow: -1px -1px 1px rgba(255,255,255,.1), 1px 1px 1px rgba(0,0,0,.5);
   background: #e8e8e8;
   text-align: center;
   font-size: 50px;
   border:none;
  }
  .close-bt {
    margin-top: 10px;
    padding: 10px 20px;
    background-color: white;
    color: black;
    border: none;
    cursor: pointer;
    /*커서를 올리면 손모양으로 바뀌게*/
    float: right;
  }
</style>