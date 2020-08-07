<%@ page contentType="text/html; charset=utf8" %>
<jsp:useBean id="board" class="ezen.Board" scope="page"/>
<%  String name     = request.getParameter("name");
    String id       = request.getParameter("id");
    String nickname = request.getParameter("nickname");
    String password = request.getParameter("password");
    String phone    = request.getParameter("phone");

    if (name != null && id != null && nickname != null && password != null && phone != null) {
        %><jsp:include page="/include/common_GETBlock.jsp"/><%
        board.DBOpen();
        String signSQL="INSERT INTO sign (name, id, nickname, password, phone) ";
        signSQL += "VALUES ('"+name+"','"+id+"','"+nickname+"',SHA2('"+password+"', 256),'"+phone+"')"; 
        board.Excute(signSQL);
        board.DBClose();

        %> <script> alert("회원가입이 완료되었습니다."); location.href = "/login.jsp"; </script> <%
    }
%>