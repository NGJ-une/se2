<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.hotel.seoul.HotelReviewDTO" %>
<%@ page import = "com.hotel.seoul.HotelPhotoDTO" %>
<jsp:useBean id="pdao" class = "com.hotel.seoul.HotelPhotoDAO"></jsp:useBean>
<jsp:useBean id="rdao" class = "com.hotel.seoul.HotelReviewDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 글쓰기 </title>
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #fdf6ee;
        margin: 0;
        padding: 0;
    }

    section {
        max-width: 800px;
        margin: 40px auto;
        padding: 20px;
    }

    table {
         width: 100%;
    	border-collapse: separate; /* 둥글게 만들려면 separate! */
    	border: 2px solid #f0b675; /* 주황 테두리 */
    	border-radius: 12px;
    	overflow: hidden; /* 둥근 테두리 효과 유지 */
    }

    th {
        text-align: center;
        padding: 10px;
        
    }

    td {
        padding: 10px;
    }

    textarea {
        resize: vertical;
        width: 100%;
    }

    /* 파일 선택 버튼만 스타일 */
    .custom-file input[type="file"] {
        display: none;
    }

    .custom-file label {
        background-color: #f0b675;
        color: white;
        padding: 6px 14px;
        border-radius: 6px;
        cursor: pointer;
        font-size: 14px;
        display: inline-block;
    }

    .custom-file label:hover {
        background-color: #e3a55c;
    }

    .file-name {
        margin-left: 10px;
        font-size: 13px;
        color: #444;
    }

    /* 별점 유지 */
    .totalStar {
        display: flex;
        align-items: center;
        gap: 4px;
    }

    .star {
        appearance: none;
        padding: 1px;
    }

    .star::after {
        content: '☆';
        color: hsl(60, 80%, 45%);
        font-size: 20px;
    }

    .star:hover::after {
        content: '★';
    }

    .star:has(~ .star:hover)::after {
        content: '★';
    }

    .star:checked::after,
    .star:has(~ .star:checked)::after {
        content: '★';
    }

    .star:hover ~ .star::after {
        content: '☆';
    }

    #resetStar {
        padding: 6px 10px;
        font-size: 12px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        background-color: #f3e1c7;
        margin-left: 10px;
        transition: 0.2s ease;
    }

    #resetStar:hover {
        background-color: #ebd4b4;
    }

    input[type="submit"], input[type="reset"] {
        padding: 10px 20px;
        margin: 10px;
        background-color: #f0b675;
        border: none;
        color: white;
        border-radius: 8px;
        cursor: pointer;
        font-weight: bold;
    }

    input[type="submit"]:hover, input[type="reset"]:hover {
        background-color: #e3a55c;
    }
</style>

<script>
function show() {
    const stars = document.querySelectorAll('.star');
    stars.forEach(star => star.checked = false);
}

function showFileName(inputId, spanId) {
    const input = document.getElementById(inputId);
    const span = document.getElementById(spanId);
    input.addEventListener('change', function () {
        span.textContent = this.files[0]?.name || '선택된 파일 없음';
    });
}
window.onload = function () {
    showFileName('file1', 'fileName1');
    showFileName('file2', 'fileName2');
    showFileName('file3', 'fileName3');
};

</script>
</head>
<%
String idx = request.getParameter("vidx");
int vidx = 0;
if(idx != null) vidx = Integer.parseInt(idx);
String id = (String)session.getAttribute("sessionid");
ArrayList<HotelReviewDTO> arr = rdao.getreviewEdit(vidx);
ArrayList<HotelPhotoDTO> arr2 = pdao.getphoto(vidx);
String filename1 = "";
String filename2 = "";
String filename3 = "";
if(arr2 != null & arr2.size() != 0) {
	filename1 = arr2.get(0).getPname1();
	filename2 = arr2.get(0).getPname2();
	filename3 = arr2.get(0).getPname3();
	if(filename1.equals("none")) {
		filename1 = "선택된 파일 없음.";
	}
	if(filename2.equals("none")) {
		filename2 = "선택된 파일 없음.";
	}
	if(filename3.equals("none")) {
		filename3 = "선택된 파일 없음.";
	}
}
%>
<body>
<%@include file="/header.jsp" %>

<section class="Container1">

    <form action="contentEdit_ok.jsp" method="post"  enctype="multipart/form-data">
        <table>
            <tr>
                <th>작성자</th>
                <td><%=id %></td> 
            </tr>
            <tr>
            <%
            if (arr != null && arr.size() != 0) {	
           %>
                <th>제목</th>
                <td><input type="text" name="vtitle" required value = "<%=arr.get(0).getVtitle() %>"></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea rows="12" name="vcontent" required><%=arr.get(0).getVcontent() %></textarea></td>
            </tr>

            <tr>
                <th>파일 업로드 1</th>
                <td>
                    <div class="custom-file">
                        <label for="file1">파일 선택</label>
                        <input type="file" name="pname1" id="file1">
                        <span class="file-name" id="fileName1"><%=filename1 %></span>
                    </div>
                </td>
            </tr>
            <tr>
                <th>파일 업로드 2</th>
                <td>
                    <div class="custom-file">
                        <label for="file2">파일 선택</label>
                        <input type="file" name="pname2" id="file2">
                        <span class="file-name" id="fileName2"><%=filename2 %></span>
                    </div>
                </td>
            </tr>
            <tr>
                <th>파일 업로드 3</th>
                <td>
                    <div class="custom-file">
                        <label for="file3">파일 선택</label>
                        <input type="file" name="pname3" id="file3">
                        <span class="file-name" id="fileName3"><%=filename3 %></span>
                    </div>
                </td>
            </tr>

            <tr>
                <th>평점</th>
                <td class="totalStar"  >
                <%
                String star1 = "";
                String star2 = "";
                String star3 = "";
                String star4 = "";
                String star5 = "";
                int total = arr.get(0).getVtotal();
                switch(total) {
                case 1 : star1 = "checked"; break;
                case 2 : star2 = "checked"; break;
                case 3 : star3 = "checked"; break;
                case 4 : star4 = "checked"; break;
                case 5 : star5 = "checked";
                }
                %>
                    <input type="radio" class="star" id="star1" name="vtotal" value="1" required <%=star1 %>>
                    <input type="radio" class="star" id="star2" name="vtotal" value="2" required <%=star2 %>>
                    <input type="radio" class="star" id="star3" name="vtotal" value="3" required <%=star3 %>>
                    <input type="radio" class="star" id="star4" name="vtotal" value="4" required <%=star4 %>>
                    <input type="radio" class="star" id="star5" name="vtotal" value="5" required <%=star5 %>>
                    <input type="button" id="resetStar" value="별점 초기화" onclick="show();">
                </td>
            </tr>
            <%
            }
            %>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="수정 하기">
                    <input type="button" value="취소">
                </td>
            </tr>
  
        </table>
    </form>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>