<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="rdao" class="com.hotel.mypage.RefundDAO" />
<jsp:useBean id="rdto" class="com.hotel.mypage.RefundDTO" />
<jsp:setProperty property="*" name="rdto" />
<%
    String id = (String) session.getAttribute("sessionid");
    String mid = id;
    rdto.setMid(mid);

    int mmoney = Integer.parseInt(request.getParameter("mmoney")); // 환불 금액
    String bbank = request.getParameter("bbank"); // 은행 (0~4 값)
    String bacount = request.getParameter("bacount"); // 계좌번호
    String msg = "";

    int bankValue = Integer.parseInt(bbank);
    switch (bankValue) {
        case 1: bbank = "농협"; break;
        case 2: bbank = "국민"; break;
        case 3: bbank = "신한"; break;
        case 4: bbank = "카카오"; break;
        default: bbank = ""; break;
    }
    rdto.setBbank(bbank);

    if (bankValue == 0) {
        session.setAttribute("errorMsg", "환불 받을 은행을 선택해주세요.");
        response.sendRedirect("refund.jsp");
    } else if (mmoney < 1000) {
        session.setAttribute("errorMsg", "1000원 이상 금액만 환불 가능합니다.");
        response.sendRedirect("refund.jsp");
    } else {
        int result2 = rdao.refundDetails(rdto);
        if (result2 > 0) {
            int result = rdao.reFund(id, mmoney);
            msg = result > 0
                ? "입력하신 " + bbank + "은행 " + bacount + " 계좌로 " + mmoney + "원 환불 되셨습니다."
                : "환불 받을 금액을 다시 확인해주세요.";
            session.setAttribute("errorMsg", "환불 받을 금액을 다시 확인해주세요.");
            response.sendRedirect("refund.jsp");
        } else {
%>
            <script>
                window.alert('고객센터에 문의해주세요.');
                location.href = 'refund.jsp';
            </script>
<%
        }
    }
%>
