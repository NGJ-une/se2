<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<!--a{text-decoration: none; color: #555;}
ul,ol,li,dl,dt,dd{list-style: none; margin: 0px; padding: 0px;}
body,div,td,th,p,textarea{margin: 0; padding: 0; font-size: 12px; color:#101010;}
-->
footer {
  background-color: #E4D9C7;
  color: #5b4c42;
  font-family: 'Noto Sans KR', sans-serif;
  padding-top: 40px;
  border-top: 1px solid #e2dcd2;
  font-size: 14px;
}

footer a {
  color: #7b6d62;
  text-decoration: none;
  transition: color 0.3s ease;
}

footer a:hover {
  color: #b58143; /* 부드러운 골드/브라운 */
}

.footHub {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px 20px 40px;
}

.compInfo h2 {
  font-family: 'Playfair Display', serif;
  font-size: 26px;
  font-weight: 700;
  margin-bottom: 15px;
  color: #6b4c2f;
}

.brandWrap {
  display: flex;
  gap: 30px;
  margin: 15px 0;
  flex-wrap: wrap;
}

.brandWrap .brand,
.brandMono,
.brandStay {
  font-size: 14px;
}

.linkInfo {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 20px;
  margin-top: 30px;
}

.linkInfo dl {
  margin: 0;
}

.linkInfo dt {
  font-weight: bold;
  margin-bottom: 8px;
  color: #3f3027;
}

.linkInfo dd {
  margin: 4px 0;
}

.footer {
  background-color: #f5f0eb;
  padding: 30px 20px;
  border-top: 1px solid #e4ded8;
}

.linkBox ul,
.selectLang ul {
  display: flex;
  flex-wrap: wrap;
  gap: 15px;
  padding: 0;
  margin: 0 0 15px;
  list-style: none;
}

.adressBox p {
  color: #6e5e52;
  line-height: 1.6;
  margin-bottom: 10px;
  font-size: 13px;
}

.footLinkbtn {
  display: inline-block;
  background-color: #e8d5c4;
  color: #5b4c42;
  padding: 5px 10px;
  border-radius: 4px;
  font-size: 12px;
  text-decoration: none;
  margin-top: 5px;
}

.footLinkbtn:hover {
  background-color: #d4a373;
  color: #fff;
}

.copyright,
.certiMark {
  font-size: 12px;
  color: #998e85;
  margin-top: 15px;
}


<!---->

</style>

</head>
<body>
<footer>
    <div class="foot footHub">
        <div class="localBox">
            <div class="localBoxer">
                <div class="compInfo">
                    <h2>THE SHILLA SEOUL</h2>
                </div>
                <div class="brandWrap">
                    <div class="brand">
                        <dl>
                            <dt>
                                <a href="#">THE HOTEL 1</a>
                            </dt>
                        </dl>
                    </div>
                    <div class="brandMono">
                        <a href="#">THE HOTEL 2</a>
                    </div>
                    <div class="brandStay">
                        <a href="#">THE HOTEL 3</a>
                    </div>
                </div>
                <div class="linkInfo">
                    <dl class="introduction">
                        <dd class="d1">
                            <a href="#">
                                <span>호텔신라소개</span>
                            </a>
                        </dd>
                        <dd class="d2">
                            <a href="#">
                                <span>호텔 개발</span>
                            </a>
                        </dd>
                        <dd class="d3">
                            <a href="#">
                                <span>고객문의</span>
                            </a>
                        </dd>
                        <dd class="d8">
                            <a href="#">
                                <span>사이트맵</span>
                            </a>
                        </dd>
                        <dd class="d4">
                            <a href="#">
                                <span>신라리워즈 전환 안내</span>
                            </a>
                        </dd>
                        <dd class="d5">
                            <a href="#">
                                <span>The Shilla shop</span>
                            </a>
                        </dd>
                        <dd class="d6">
                            <a href="#">
                                <span>삼성상품권</span>
                            </dd>
                            <dd class="d7">
                                <a href="#">
                                    <span>신라리워즈 전환 안내 </span>
                                </dd>
                            </dl>
                            <dl class="inquires">
                                <dt class="dt">SNS</dt>
                                <dd class="insta">
                                    <a title="Instagram-popup" target="_blank" href="#">
                                        <sapn>Instagram</sapn>
                                    </a>
                                </dd>
                                <dd class="facebook">
                                    <a title="Facebook-popup" target="_blank" href="#"></a>
                                    <span>Facebook</span>
                                </dd>
                            </dl>
                            <dl>
                                <dd class="d1">
                                    <span>서울신라호텔 02-2233-3131</span>
                                </dd>
                                <dd class="d2">
                                    <span>제주신라호텔 064-735-5114</span>
                                </dd>
                                <dd class="d3">
                                    <span>신라스테이 02-2230-0700</span>
                                </dd>
                                <dd class="d4">
                                    <span>신라리워즈 02-2230-5528</span>
                                </dd>
                            </dl>
                </div>
            </div>
        </div>
    <div>
    <div class="footer">
        <div class="linkBox">
            <ul>
                <li class="link first">
                    <a href="#">신라리워즈 약관</a>
                </li>
                <li class="link2">
                    <a href="#">개인정보처리방침</a>
                </li>
                <li class="link3">
                    <a href="#">이메일무단수집금지</a>
                </li>
                <li class="link4">
                    <a href="#">윤리경영</a>
                </li>
                <li class="link5">
                    <a href="#">건축/시설물 안전관리</a>
                </li>
                <li class="link6 last">
                    <a href="#">고정형 영상정보처리기기 운영방침</a>
                </li>
            </ul>
        </div>
        <div class="selectLang">
            <ul>
                <li class="en first">
                    <a href="#">English</a>
                </li>
                <li class="ja">
                    <a href="#">日本語</a>
                </li>
                <li class="zh last">
                    <a href="#">简体中文</a>
                </li>
            </ul>
        </div>
        <div class="adressBox">
            <p>
                ㈜호텔신라 서울특별시 중구 동호로 249 (우: 04605)  Tel: 02-2233-3131 Fax: 02-2230-3769 사업자등록번호: 203-81-43363 통신판매신고번호: 중구00272호 대표이사 이부진    호스팅서비스제공자 삼성SDS㈜    서울객실예약 shilla.reserve@samsung.com  제주객실예약 jejushilla@samsung.com
            </p>
            <a class="footLinkbtn" href="#">사업자정보확인</a>
        </div>
        <div class="copyright">
            <p>COPYRIGHT © HOTEL SHILLA CO., LTD. ALL RIGHTS RESERVED.</p>
        </div>
        <div class="certiMark">
            <p>ISMS 인증범위: ㈜호텔신라 호텔 인터넷 홈페이지 서비스 / 유효기간: 2023.12.20 ~ 2026.12.19</p>
        </div>
    </div>
</footer>
</body>
</html>