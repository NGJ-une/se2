<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 리뷰</title>
<style>
    /* 전체 초기화 및 기본 설정 */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: Arial, sans-serif;
        padding: 20px;
        background-color: #f9f9f9;
        color: #333;
    }

    /* 제목 스타일 */
    h1 {
        font-size: 28px;
        margin-bottom: 30px;
        border-bottom: 2px solid #ddd;
        padding-bottom: 10px;
    }

    /* 전체 리뷰 항목을 가로로 배치 */
    .review-row {
        display: flex;
        align-items: flex-start;
        gap: 40px;
        flex-wrap: wrap;
    }

    /* 각 리뷰 항목 기본 스타일 */
    .review-item {
        font-size: 16px;
        line-height: 1.6;
        padding-right: 20px;
    }

    /* 오른쪽 세로 구분선 추가 */
    .with-divider {
        border-right: 1px solid #ccc;
        padding-right: 30px;
        margin-right: 10px;
    }

    /* 호텔 평점 정렬 및 별 아이콘 스타일 */
    .rating-box {
        text-align: center;
    }

    .rating-value {
        font-size: 20px;
        font-weight: bold;
    }

    .stars {
        font-size: 28px; /* 별 크기 키움 */
        color: gold;
        margin: 8px 0;
    }

    /* 점수별 meter바 영역 */
    .meter-group {
        display: flex;
        flex-direction: column;
        gap: 8px;
    }

    .meter-line {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    meter {
        width: 180px;
        height: 12px;
    }


    .highlight {
        font-weight: bold;
        color: #444;
    }

    /* 반응형 모바일 레이아웃 */
    @media (max-width: 768px) {
        .review-row {
            flex-direction: column;
            gap: 30px;
        }

        .with-divider {
            border-right: none;
            border-bottom: 1px solid #ccc;
            padding-bottom: 20px;
            margin-bottom: 20px;
        }

        .categories {
            padding-left: 0; /* 모바일에선 중앙정렬 유지 */
            align-items: center;
            text-align: center;
        }
    }
</style>
</head>
<body>
    <h1>호텔 리뷰</h1>

    <div class="review-row">
        <!-- 호텔 평점 -->
        <div class="review-item with-divider">
            <div class="rating-box">
                <div>호텔 평점</div>
                <div class="rating-value">4.5</div>
                <div class="stars">★★★★★</div>
                <div>5건</div>
            </div>
        </div>

        <!-- 점수별 meter -->
        <div class="review-item meter-group">
            <div class="meter-line">5점 <meter max="100" min="0" value="75"></meter></div>
            <div class="meter-line">4점 <meter max="100" min="0" value="18"></meter></div>
            <div class="meter-line">3점 <meter max="100" ,min="0" value="5"></meter></div>
            <div class="meter-line">2점 <meter max="100" min="0" value="1"></meter></div>
            <div class="meter-line">1점 <meter max="100" min="0" value="1"></meter></div>
        </div>

        <!-- 세부 평가 항목 -->
    </div>
</body>
</html>
