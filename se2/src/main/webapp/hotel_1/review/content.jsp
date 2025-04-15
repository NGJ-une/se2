<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.hotel.seoul.HotelReviewDTO" %>
<%@ page import = "com.hotel.seoul.HotelReplyDTO" %>
<!DOCTYPE html>
<jsp:useBean id="rdao" class = "com.hotel.seoul.HotelReviewDAO"></jsp:useBean>
<jsp:useBean id="redao" class = "com.hotel.seoul.HotelReplyDAO"></jsp:useBean>
<html>
<head>
<meta charset="UTF-8">
<title>본문 내용</title>
<style>
    body {
        font-family: '맑은 고딕', sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 0;
    }

    section {
        max-width: 1000px;
        margin: 40px auto;
        padding: 40px;
        background-color: white;
        border-radius: 12px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.08);
        text-align: left;
    }

    ul {
        list-style: none;
        padding: 0;
        margin: 0;
        width: 100%;
    }

    ul li {
        margin-bottom: 18px;
        font-size: 16px;
        line-height: 1.8;
        width: 100%;
    }

    .center-part {
        text-align: center;
    }

    textarea {
        width: 100%;
        height: 100px;
        font-size: 15px;
        padding: 12px;
        border-radius: 8px;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }

    .comment-submit {
        text-align: right;
    }

    input[type="button"] {
        margin-top: 10px;
        margin-right: 10px;
        padding: 8px 16px;
        border: none;
        border-radius: 6px;
        background-color: orange;
        color: white;
        cursor: pointer;
    }

    .totalStar {
       display: flex;
       justify-content: center;
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

    .star:checked::after, .star:has(~ .star:checked)::after {
       content: '★';
    }

    .star:hover ~ .star::after {
       content: '☆';
    }

  .comment-box {
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 12px 16px;
        margin-bottom: 12px;
        background-color: #fdfdfd;
        box-shadow: 0 2px 5px rgba(0,0,0,0.03);
        position: relative;
    }

    .comment-meta {
        font-size: 14px;
        font-weight: bold;
        color: #333;
        margin-bottom: 8px;
    }

    .comment-content {
        font-size: 15px;
        line-height: 1.6;
        color: #444;
        white-space: pre-wrap;
        margin-bottom: 10px;
    }

    .comment-actions {
        display: flex;
        justify-content: flex-start;
        gap: 10px;
    }

    .comment-actions input[type="button"],
    .comment-actions a {
        font-size: 13px;
        padding: 6px 10px;
        background-color: #f0f0f0;
        color: #555;
        border: 1px solid #ccc;
        border-radius: 4px;
        cursor: pointer;
        text-decoration: none;
    }

    .comment-actions a:hover,
    .comment-actions input[type="button"]:hover {
        background-color: #e0e0e0;
    }

    .reply-textarea {
        margin-top: 10px;
    }
</style>
<script>
function showTextArea(commentId) {
	
	var textArea = document.getElementById("replyTextArea"+commentId);
	var subbt = document.getElementById("commentSubmit"+commentId);
	
	if(textArea.style.display == "none" || textArea.style.display == "") {
		textArea.style.display = "block";
		subbt.style.display = "block";
	}else {
		textArea.style.display = "none";
		subbt.style.display = "none";
	}
}
</script>
</head>
<%
String id = (String)session.getAttribute("sessionid");
String vidx = request.getParameter("vidx");
int idx = 0;
if(vidx != null) idx = Integer.parseInt(vidx); 
ArrayList<HotelReviewDTO> arr = rdao.getReviewRead(idx);
ArrayList<HotelReplyDTO> arr2 = redao.getReplyList(idx);
%>
<body>
<%@include file="/header.jsp" %>
<section>
    <article class="center-part">
        <h2>본문 내용</h2>
        <ul>
            
            <%
            if(arr == null || arr.size() == 0) {
            	%>
            	<li>내용이 없습니다.</li>
            	<%
            }else {
            %>
            <li>작성자 : <%=arr.get(0).getVid() %></li>
            <li>작성날짜 : <%=arr.get(0).getVdate() %></li>
            <li>평점 
                 <div class="totalStar">
        <%
            int score = arr.get(0).getVtotal();
            for(int i=1; i<=5; i++) {
                if(i <= score) {
        %>
            <span style="font-size: 20px; color: gold;">★</span>
        <%
                }else {
        %>
            <span style="font-size: 20px; color: lightgray;">☆</span>
        <%
                }
            }
        %>
    </div>
            </li>
            <li>제목 : <%=arr.get(0).getVtitle() %></li>
            <li>내용 : <%=arr.get(0).getVcontent() %></li>
            
            <li><img src = "" alt = "사용자 업로드 이미지"></li>
        </ul>
        <%
            }
        %>
        
    </article>

    <hr><br>
	<form name = "vrecommend1" action = "recommend_ok.jsp">
		<input type = "hidden" name = "vidx" value = "<%=idx%>">
    <div style="text-align: center">
        <input type="submit" name="recommend" value="추천 <%=arr.get(0).getVrecommend()%>">
    </div>
	</form>
    <br><hr><br>

    <div>
        <ul>
        	<%
        		if( arr2 != null && arr2.size() > 0) {
        			for(int i = 0; i < arr2.size(); i ++) {
        				int reWrite = arr2.get(i).getClev()*20;
        				
        				%>
        				<li style = "padding-left: <%=reWrite%>px;">
        				<div></div>
        				작성자 : <%=arr2.get(i).getCid() %>
        				내용 : <%=arr2.get(i).getCcontent().replaceAll(" ", "&nbsp;").replaceAll("\\n", "<br>") %> 
        				<input type="button" value="추천(<%=arr2.get(i).getCrecommend()%>)" onclick = "location.href = 'replyRecommend_ok.jsp?cidx=<%=arr2.get(i).getCidx()%>&vidx=<%=idx%>';"> 
        				<input type="button" value="비추천(<%=arr2.get(i).getCnotrecommend()%>)" onclick = "location.href = 'replynotRecommend_ok.jsp?cidx=<%=arr2.get(i).getCidx()%>&vidx=<%=idx%>';"> 
        				<a href = "javascript:void(0);" onclick = "showTextArea(<%=arr2.get(i).getCidx()%>)">답글</a>
        				<form name = "reWriteReply" action = "reWriteReply_ok.jsp">
					        <input type="hidden" name="vidx" value="<%=arr2.get(i).getVidx()%>">
					        <input type="hidden" name="cid" value="<%=id %>">
					        <input type="hidden" name="cref" value="<%=arr2.get(i).getCref()%>">
					        <input type="hidden" name="clev" value="<%=arr2.get(i).getClev()%>">
					        <input type="hidden" name="csunbun" value="<%=arr2.get(i).getCsunbun()%>">
				        
						<textarea id="replyTextArea<%=arr2.get(i).getCidx()%>" name="ccontent" style="resize: none; display: none;" placeholder="답글을 작성하세요."></textarea>
						<div class = "commentSubmit">
							<input type = "submit" value ="등록" id="commentSubmit<%=arr2.get(i).getCidx()%>" style = "display: none;">
						</div>
						</form>
						</li>
				
        				<%
        			}
        		}else {
        			%>
        			<li>등록된 댓글이 없습니다.</li>
        			<%
        		}
        	%>
        </ul>
    </div>

    <div>
    	<form name = "writeReply" action = "writeReply_ok.jsp">
    	<input type="hidden" name="vidx" value="<%= idx %>">
        <ul>
            <li><br>
                <textarea style = "resize: none;" name = "ccontent"></textarea>
                <div class="comment-submit">
                    <input type="submit" value="등록">
                </div>
            </li>
        </ul>
        </form>
    </div>

    <br><hr><br>

    <div style="text-align:center">
        <input type="button" name="writeEdit" value="게시글 수정" onclick = "location.href = 'contentEdit.jsp?vidx=<%=idx%>';">
        <input type="button" name="writeDelete" value="게시글 삭제">
        <input type="button" name="writeList" value="게시글 목록" onclick = "location.href='list.jsp'">
    </div>

    <br><br>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>
