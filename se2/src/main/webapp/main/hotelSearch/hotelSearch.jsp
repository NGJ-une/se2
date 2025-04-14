<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 바탕 화면 투명하게 하는 부분 -->
<div class="overlay" id="overlay" style="display: none;"></div>

<div class="popup-page" id="popupPage" style="display: none;">
  
  <div>
	  <table class="table-bt">
		  <tr>
		  	  <th colspan="2"><h2 class="hs">호텔 찾기</h2></th>
		  </tr>  
		  <tr>
			  <td><a href="/se2/index.jsp"><input type="button" class="seoul-bt" value="HELIA SEOUL"></a></td>
			  <td><a href="/se2/hotel_1/hotelUlsan.jsp"><input type="button" class="ulsan-bt" value="HELIA ULSAN"></a></td>
		  </tr>
		  <tr>
  		      <td colspan="2" class="close-td"><input type="button" class="close-bt" onclick="hidePopup()" value="X"><td>
  		  </tr>
      </table>
  </div>
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
    width: 900px;
    background: whitesmoke;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
    /*0.3자리는 투명도*/
    z-index: 1000;
    display: none;
  }
    .hs{
   color: #6b4c2f;
   background: #E4D9C7;
   text-shadow: -1px -1px 1px rgba(255,255,255,.1), 1px 1px 1px rgba(0,0,0,.5);
   text-align: center;
   font-size: 30px;
  }
  .table-bt{
  	border:none;
  	width:100%;
  	text-align:center;
  	padding:10px;
  }
  .seoul-bt,.ulsan-bt{
   width:100%;
   height:200px;
   color: white;
   background: #e8e8e8;
   text-align: center;
   font-size: 50px;
   border:none;
   text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5)
  }
 .ulsan-bt {
    background-image: url('/se2/main/hotelSearch/img/ulsan.jpg'); /* 배경 이미지 경로 */
    background-size: cover; /* 이미지를 버튼 크기에 맞게 조정 */
    background-position: center; /* 배경 이미지를 중앙에 배치 */
 }
  .seoul-bt:hover, .ulsan-bt:hover {
    opacity: 0.8; /* 마우스를 올렸을 때 버튼이 살짝 투명해짐 */
  }
  .close-td{
  	text-align:right;
  	height:30px;
  	
  }
  .close-bt {
    background-color: white;
    color: #6b4c2f;
    border: none;
    cursor: pointer;
    /*커서를 올리면 손모양으로 바뀌게*/
    text-align:right;
  }
  
</style>