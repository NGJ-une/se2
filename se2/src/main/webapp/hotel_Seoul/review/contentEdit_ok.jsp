<%@page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8");%>
<%@ page import="com.oreilly.servlet.*" %>
<jsp:useBean id="vdto" class="com.hotel.seoul.HotelReviewDTO"></jsp:useBean>
<jsp:useBean id="vdao" class="com.hotel.seoul.HotelReviewDAO"></jsp:useBean>
<jsp:useBean id="pdto" class="com.hotel.seoul.HotelPhotoDTO"></jsp:useBean>
<jsp:useBean id="pdao" class="com.hotel.seoul.HotelPhotoDAO"></jsp:useBean>

<%@page import="com.hotel.*" %>
<%@ page import = "com.hotel.seoul.HotelPhotoDTO" %>
<%
String contentType = request.getContentType();

if (contentType == null || !contentType.startsWith("multipart/")) {
    out.println("<h3 style='color:red'>오류: 잘못된 요청입니다. (multipart/form-data 아님)</h3>");
    out.println("<p>이 페이지는 파일 업로드용 폼에서만 접근해야 해요.</p>");
    out.println("<p><a href='write.jsp'>글쓰기 폼으로 돌아가기</a></p>");
    return;
}

%>



<%

    //String savePath = "C:/java_student/project2/se2/se2/src/main/webapp/hotel_1/review/upload";
	//String savePath="C:/java_student/jspstudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/myweb/filebbs/files";
	String savePath = application.getRealPath("/upload");
	
File directory = new File(savePath);
	
	if (!directory.exists()) {
        directory.mkdirs();
    }
	
    int fileSize = 1024 * 1024 * 10; 
    MultipartRequest mr=
    		new MultipartRequest(request,savePath,1024*1024*10,"utf-8");

	
    String vid = (String)session.getAttribute("sessionid");
	String vidx_s = mr.getParameter("idx");
	System.out.println("vidx_s="+vidx_s);
	int vidx = 0;
	if(vidx_s!=null) vidx = Integer.parseInt(vidx_s);
	System.out.println(vidx);
    String vtitle=mr.getParameter("vtitle");
    System.out.println("vtitle="+vtitle);
    String vcontent=mr.getParameter("vcontent");
    System.out.println("vcontent="+vcontent);
    ArrayList<HotelPhotoDTO> arr = pdao.getphoto(vidx);
    String vtotal_s=mr.getParameter("vtotal"); 
    int vtotal = Integer.parseInt(vtotal_s);
    
    vdto.setVtitle(vtitle);
    vdto.setVcontent(vcontent);
    vdto.setVtotal(vtotal);
    vdto.setVidx(vidx);
    	
    ArrayList<HotelPhotoDTO> arr3 = pdao.getphoto(vidx);
    String dpname1=mr.getOriginalFileName("pname1");
    String dpname2=mr.getOriginalFileName("pname2");
    String dpname3=mr.getOriginalFileName("pname3");
    System.out.println("dpname1=" + dpname1);
    String pname1= "";
    String pname2= "";
    String pname3= "";
    if(arr3 != null && arr3.size() != 0) {
    	pname1 = arr3.get(0).getPname1();
    	pname2 = arr3.get(0).getPname2();
    	pname3 = arr3.get(0).getPname3();
    }
    
    System.out.println("pname1=" + pname1);
 
  	if(dpname1 == null) {
  		dpname1=pname1;
  		pdto.setPname1(dpname1); 
  	}else {
  		pdto.setPname1(dpname1);
  	}
  	if(dpname2 == null) {
  		dpname2=pname2;
  		pdto.setPname2(dpname2); 
  	}else {
  		pdto.setPname2(dpname2);
  	}
  	if(dpname3 == null) {
  		dpname3=pname3;
  		pdto.setPname3(dpname3); 
  	}else {
  		pdto.setPname3(dpname3);
  	}
  
  	 System.out.println("111dpname1=" + dpname1);
  	pdto.setPidx(vidx);
 
	int reviewUpdate = vdao.reviewUpdate(vdto);
	int photoUpdate = 0;
	if(reviewUpdate > 0) {
		photoUpdate = pdao.photoUpdate(pdto);
		if(reviewUpdate > 0 && photoUpdate > 0) {
			%>
			<script>
			location.href = 'content.jsp?vidx=<%=vidx%>';
			</script>
			<%	
		} else {
			%>
			<script>
			location.href = 'content.jsp?vidx=<%=vidx%>';
			</script>
			<%
		}
	}else {
		%>
		<script>
		alert('알 수 없는 이유로 리뷰 수정에 어려움이 있습니다. 고객센터로 문의바랍니다.(010-4193-9065)');
		location.href = 'content.jsp?vidx=<%=vidx%>';
		</script>
		<%
	}
	
%>
