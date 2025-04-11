<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="java.io.*" %>

<%@ page import="com.hotel.seoul.SeoulWriteDTO" %>
<%@ page import="com.hotel.seoul.SeoulWriteDAO" %>
<%@ page import="com.hotel.seoul.HotelPhotoDTO" %>
<%@ page import="com.hotel.seoul.HotelPhotoDAO" %>

<%request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="vdto" class="com.hotel.seoul.SeoulWriteDTO"></jsp:useBean>
<jsp:useBean id="vdao" class="com.hotel.seoul.SeoulWriteDAO"></jsp:useBean>
<jsp:useBean id="pdto" class="com.hotel.seoul.HotelPhotoDTO"></jsp:useBean>
<jsp:useBean id="pdao" class="com.hotel.seoul.HotelPhotoDAO"></jsp:useBean>
<%

    String savePath = "C:/java_student/project2/se2/se2/src/main/webapp/hotel_1/review/upload";

    int fileSize = 1024 * 1024 * 10; 
    
    MultipartRequest mr = new MultipartRequest(request, savePath, fileSize, "utf-8", new DefaultFileRenamePolicy());

    String vid=mr.getParameter("vid");
    String vtitle=mr.getParameter("vtitle");
    String vcontent=mr.getParameter("vcontent");
    
    String vtotal_s=mr.getParameter("vtotal"); ///형변환 해줌!!
    int vtotal = Integer.parseInt(vtotal_s);
    
    String pname1=mr.getOriginalFileName("pname1");
    String pname2=mr.getOriginalFileName("pname2");
    String pname3=mr.getOriginalFileName("pname3");
    
    //System.out.println(pname1);
    //System.out.println(pname2);
    //System.out.println(pname3);
    //String filename=mr.getOriginalFileName("upload");//입력태그 이름 기입해주면 업로드로 입력태그 파일 이름을 가져올게 하고 파일이름 가져옮
    //String writer=(String)session.getAttribute("sid");

    //int result=filedao.fileBbsUpload(filename, writer);
    //String msg=result>0?"파일 업로드 성공!":"업로드 중 오류발생!";

    //<jsp:setProperty property="*" name="vdto" />

	vdto.setVid(vid);
	vdto.setVtitle(vtitle);
	vdto.setVcontent(vcontent);
    vdto.setVtotal(vtotal);
    pdto.setPname1(pname1);
    pdto.setPname2(pname2);
    pdto.setPname3(pname3);
    
    // dto 안에 진짜 들어갔는지 확인
    System.out.println(vdto.getVid());
    System.out.println(vdto.getVtotal());
    //System.out.println(pdto.getPname1());  

    // 글쓰기 등록 메서드 결과
    int result=vdao.reviewWrite(vdto);
    
    // 글 쓴 파일을 등록할 vidx 가져오기
    
    int vidx=vdao.FileUploadvidx();
  
	System.out.println(vidx);
    System.out.println(result);

    
    
    String msg = result > 0 ? "글이 등록되었습니다." : "글이 등록되지 않았습니다.";
    %>
    <script>
    	window.alert('<%=msg%>');
       location.href ='write.jsp';
    </script>
