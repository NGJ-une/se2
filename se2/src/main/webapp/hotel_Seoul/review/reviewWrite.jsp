<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<style>
 .totalStar {
 	display: flex;
 }
 .star {
 	appearance: none;
 	padding: 1px;
 }
 .star::after {/*appearance: none 으로 기존 라디오 모양 표시  X 후 after 로 원하는 모양 표현*/
 	content: '☆';
 	color: hsl(60, 80%, 45%);
 	font-size: 20px;
 }
 .star:hover::after {
  	content: '★';
 }
 .star:has(~ .star:hover)::after { /*자신의 요소 되에 hover된 star 있을경우 활성화*/
 	content: '★';
 }
 .star:checked::after, .star:has(~ .star:checked)::after {/*클릭했을 경우 별 고정*/
 	content: '★';
 }
 .star:hover ~ .star::after {
 	content: '☆';
 }
 h1 {
 	font-size: 26px;
 	border-bottom: 3px solid #EB1A1A;
 }
 #resetStar {
 	padding : 8px 8px;
 	font-size: 12px;
 	margin-top: 4px;
 	margin-right: 18px;
 	border: none;
 	border-radius: 8px;
 	cursor: pointer;
 	transition: 0.3s ease;
 }
 #resetStar:hover {
 	background-color: #e0e0e0;
 }
 input[type = "submit"], input[type = "button"] {
 	padding: 12px 24px;
 	font-size: 16px;
 	margin-right: 10px;
 	border: none;
 	border-radius: 8px;
 	cursor: pointer;
 	transition: 0.3s ease;
 }
 input[type = "submit"]:hover {
 	background-color: #e0e0e0;
 }
 input[type = "button"]:hover {
 	background-color: #e0e0e0;
 }
</style>
<script>
function show() {
	 var stars = document.querySelectorAll('.star');
	  for(var i = 0; i < stars.length; i++) {
		  stars[i].checked = false;
	  }
}
</script>
</head>
<body>
<h1>별점</h1>
   <div class = "totalStar" >
   	<input type = "radio" class = "star" id = "star1" value ="1">
   	<input type = "radio" class = "star" id = "star2" value ="2">
   	<input type = "radio" class = "star" id = "star3" value ="3">
   	<input type = "radio" class = "star" id = "star4" value ="4">
   	<input type = "radio" class = "star" id = "star5" value ="5">
   	<input type = "button" id = "resetStar" value = "별점 초기화" onclick = "show();">
   </div>
</body>
</html>
