<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>예약하기</h1>
    <hr>
    <form action="hotelReserSearch" name="hotelReserSearch">
        <fieldset>
            <legend>예약하기</legend>
            <div>
                <label>지역</label>
                <select name="region">
                    <option value="s">서울</option>
                    <option value="u">울산</option>
                </select>
                <label>체크인</label>
                <input type="date" name="checkIn">
                <label>체크아웃</label>
                <input type="date" name="checkOut">
                <label>성인</label>
                <input type="number" name="adult" min="0" max="2" value="2">
                <label>어린이</label>
                <input type="number" name="kid" min="0" max="2" value="0">
                <label>유아</label>
                <input type="number" name="baby" min="0" max="2" value="0">
                <input type="submit" value="검색">
            </div>
        </fieldset>
    </form>
    <hr>
    
</body>
</html>