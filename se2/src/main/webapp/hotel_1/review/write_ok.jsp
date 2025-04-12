<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%request.setCharacterEncoding("utf-8");%>
<%@ page import="com.oreilly.servlet.*" %>


<%@page import="com.hotel.*" %>
<%
String contentType = request.getContentType();
System.out.println("contentType = " + contentType);

if (contentType == null || !contentType.startsWith("multipart/")) {
    out.println("<h3 style='color:red'>오류: 잘못된 요청입니다. (multipart/form-data 아님)</h3>");
    out.println("<p>이 페이지는 파일 업로드용 폼에서만 접근해야 해요.</p>");
    out.println("<p><a href='write.jsp'>글쓰기 폼으로 돌아가기</a></p>");
    return;
}
%>


<jsp:useBean id="vdto" class="com.hotel.seoul.SeoulWriteDTO"></jsp:useBean>
<jsp:useBean id="vdao" class="com.hotel.seoul.SeoulWriteDAO"></jsp:useBean>
<jsp:useBean id="pdto" class="com.hotel.seoul.HotelPhotoDTO"></jsp:useBean>
<jsp:useBean id="pdao" class="com.hotel.seoul.HotelPhotoDAO"></jsp:useBean>
<%

    //String savePath = "C:/java_student/project2/se2/se2/src/main/webapp/hotel_1/review/upload";
String savePath="C:/java_student/jspstudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/myweb/filebbs/files";
    int fileSize = 1024 * 1024 * 10; 
    MultipartRequest mr=
    		new MultipartRequest(request,savePath,1024*1024*10,"utf-8");


    String vid = (String)session.getAttribute("sessionid");

    //String vid=mr.getParameter("vid");
    String vtitle=mr.getParameter("vtitle");
    String vcontent=mr.getParameter("vcontent");
    
    String vtotal_s=mr.getParameter("vtotal"); ///형변환 해줌!!
    int vtotal = Integer.parseInt(vtotal_s);
    
    String pname1=mr.getOriginalFileName("pname1");
    String pname2=mr.getOriginalFileName("pname2");
    String pname3=mr.getOriginalFileName("pname3");
    
    //<jsp:setProperty property="*" name="vdto" />

	vdto.setVid(vid);
	vdto.setVtitle(vtitle);
	vdto.setVcontent(vcontent);
    vdto.setVtotal(vtotal);

    
    // dto 안에 진짜 들어갔는지 확인
    System.out.println(vdto.getVid());
    System.out.println(vdto.getVtotal());
    //System.out.println(pdto.getPname1());  

    // 1. 글쓰기 등록 메서드 결과
    int writeResult=vdao.reviewWrite(vdto);
    
    // 2. 글 쓴 파일을 등록할 vidx 가져오기
    int vidx=vdao.recentPost();
    
    // 3. 파일 작성 시 vidx동일하게 등록되도록 하기
    

	if (pdto.getPname1() == null){
        //pdto.setPname1("");
        pname1="none";
       pdto.setPname1(pname1);
         pdto.setPidx(vidx);

         int fileUpload=pdao.photoUpload(pdto);
     
         String msg = fileUpload > 0 ? "글이 등록되었습니다." : "글이 등록되지 않았습니다.";
         %>
         <script>
            window.alert('<%=msg%>');
            location.href ='write.jsp';
         </script>
 <%
	}if(pdto.getPname2() == null){
     pname2="none";
     pdto.setPname2(pname2);
     pdto.setPidx(vidx);
     
     int fileUpload=pdao.photoUpload(pdto);
     
     String msg = fileUpload > 0 ? "글이 등록되었습니다." : "글이 등록되지 않았습니다.";
     %>
     <script>
        window.alert('<%=msg%>');
        location.href ='write.jsp';
     </script>
     
  <%
  }if(pdto.getPname3()==null){
     pname3="none";
     pdto.setPname3(pname3);
     pdto.setPidx(vidx);
    int fileUpload=pdao.photoUpload(pdto);
     
     String msg = fileUpload > 0 ? "글이 등록되었습니다." : "글이 등록되지 않았습니다.";
     %>
     <script>
        window.alert('<%=msg%>');
        location.href ='write.jsp';
     </script>
     
	
    <%
  }if(!(pdto.equals(null))){
        pdto.setPname1(pname1);
        pdto.setPname2(pname2);
        pdto.setPname3(pname3);
        pdto.setPidx(vidx);
   
    
    //4. 글, 파일 모두 등록
  	int fileUpload=pdao.photoUpload(pdto);
	

    String msg = fileUpload > 0 ? "글이 등록되었습니다." : "글이 등록되지 않았습니다.";
    %>
    <script>
    	window.alert('<%=msg%>');
       location.href ='write.jsp';
    </script>
<%}%>