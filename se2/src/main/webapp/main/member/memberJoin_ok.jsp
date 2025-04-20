<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.hotel.member.MemberDTO" %>
<%@page import="com.hotel.member.MemberDAO" %>
<%@ page import = "java.util.*" %>


<jsp:useBean id="mdto" class="com.hotel.member.MemberDTO" scope="request" />
<jsp:useBean id="mdao" class="com.hotel.member.MemberDAO" scope="request" />
<%
    request.setCharacterEncoding("UTF-8");

    // 파라미터 수집
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String birth = request.getParameter("birth");
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String pwdcheck = request.getParameter("pwdcheck");
    String email1 = request.getParameter("email1");
    String email2 = request.getParameter("email2");
    String tel = request.getParameter("tel");
    String addr = request.getParameter("addr");
    String question = request.getParameter("question");
    String answer = request.getParameter("answer");

    String email = email1 + "@" + email2;

    // 나이 계산
    int age = 0;
    if (birth != null && birth.length() >= 4) {
        int birthYear = Integer.parseInt(birth.substring(0, 4));
        Calendar now = Calendar.getInstance();
        int currentYear = now.get(Calendar.YEAR);
        age = currentYear - birthYear;
    }

    // 유효성 검사
    String errorMessage = null;
    if (age < 20) {
        errorMessage = "20세 미만은 가입할 수 없습니다.";
    } else if (!pwd.equals(pwdcheck)) {
        errorMessage = "비밀번호가 일치하지 않습니다.";
    }

    if (errorMessage != null) {
        // requestScope로 값 저장해서 다시 memberJoin.jsp로
        request.setAttribute("fname", fname);
        request.setAttribute("lname", lname);
        request.setAttribute("birth", birth);
        request.setAttribute("id", id);
        request.setAttribute("pwd", pwd);
        request.setAttribute("pwdcheck", pwdcheck);
        request.setAttribute("email1", email1);
        request.setAttribute("email2", email2);
        request.setAttribute("tel", tel);
        request.setAttribute("addr", addr);
        request.setAttribute("question", question);
        request.setAttribute("answer", answer);
        request.setAttribute("errorMessage", errorMessage);

        // JS로 alert 띄우고 이동
%>
<script>
    alert('<%= errorMessage %>');
    history.back(); // 이전 페이지로
</script>
<%
    } else {
        // DTO에 값 설정
        mdto.setFname(fname);
        mdto.setLname(lname);
        mdto.setBirth(birth);
        mdto.setId(id);
        mdto.setPwd(pwd);
        mdto.setEmail(email);
        mdto.setTel(tel);
        mdto.setAddr(addr);
        int questionInt = 0;
        try {
            questionInt = Integer.parseInt(question);
        } catch (NumberFormatException e) {
            questionInt = 0;
        }

        mdto.setQuestion(questionInt); // 🔥 이걸로 바꿔!
        mdto.setAnswer(answer);

        int result = mdao.memberJoin(mdto);

        if (result > 0) {
%>
<script>
    alert('회원가입이 완료되었습니다.');
    location.href = 'login.jsp';
</script>
<%
        } else {
%>
<script>
    alert('회원가입 중 오류가 발생했습니다.');
    history.back();
</script>
<%
        }
    }
%>