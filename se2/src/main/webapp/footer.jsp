<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        table{
            text-align: center;
            width: 100%;
            padding: 10px;
            border-style: solid;
            border-collapse: collapse;
        }
        .cell-border{
            border: 1px solid black;
        }
        .cell-bottom-border{
            border-top: 1px solid black;
            border-bottom: 1px solid black;
        }
    </style>
</head>
<body>
    <footer>
		<table>
			<tr>
				<td class="cell-border" rowspan="3"><img alt="logo" src="logo"></td>
				<td class="cell-bottom-border">ㅇㅇ호텔</td>
				<td class="cell-bottom-border">ㅇㅇ호텔</td>
				<td class="cell-bottom-border">ㅇㅇ호텔</td>
				<td class="cell-bottom-border">ㅇㅇ호텔</td>
				<td class="cell-bottom-border">ㅇㅇ호텔</td>
			</tr>
			<tr>
				<td colspan="2">ㅇㅇ 호텔 전번 000000000</td>
				<td colspan="2">ㅇㅇ 호텔 전번 000000000</td>
				<td rowspan="2" class="cell-border">고객문의</td>
			</tr>
			<tr>
				<td colspan="2" class="cell-bottom-border">ㅇㅇ 호텔 전번 000000000</td>
				<td colspan="2" class="cell-bottom-border">ㅇㅇ 호텔 전번 000000000</td>
			</tr>
			<tr id="fourth-row">
				<td class="cell-bottom-border">zzzzzzzz</td>
                <td class="cell-bottom-border">zzzzzzzz</td>
                <td class="cell-bottom-border">zzzzzzzz</td>
                <td class="cell-bottom-border">zzzzzzzz</td>
                <td class="cell-bottom-border">zzzzzzzz</td>
                <td class="cell-bottom-border">zzzzzzzz</td>
			</tr>
			<tr>
				<td>주소 ㅇㅇㅇㅇㅇ</td>
                <td>대표이사: ㅋㅋ</td>
                <td>사업자 등록번호: 212</td>
                <td rowspan="2"><img alt="photo" src="photo"></td>
                <td rowspan="2" colspan="2">인증범위: (주)ㅇㄹㅇㄴ</td>
            </tr>
            <tr>
                <td>copyright &copy;</td>
                <td colspan="2">서울 객실 예약: 서울 어쩌구</td>
            </tr>
		</table>
	</footer>
</body>
</html>