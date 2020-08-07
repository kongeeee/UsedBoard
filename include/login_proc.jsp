<%@ page contentType="text/html; charset=utf8" %>
<jsp:useBean id="board" class="ezen.Board" scope="page"/>

<%  String id        = request.getParameter("id");
    String password  = request.getParameter("password");
    
    if (id != null && password != null) {
        %><jsp:include page="/include/common_GETBlock.jsp"/><%
        String loginSQL = "";
        loginSQL = "SELECT * FROM sign WHERE id='" + id + "' AND password=SHA2('" + password + "', 256)";
        board.DBOpen();
        board.OpenQuery(loginSQL);
        if (board.ResultNext()) {
            session.setAttribute("midx", board.getString("midx"));
            session.setAttribute("name", board.getString("name"));
            session.setAttribute("phone", board.getString("phone"));
            session.setAttribute("nickname", board.getString("nickname"));
            session.setAttribute("id", id);
            %> <script> alert("로그인 하였습니다."); location.href = "/"; </script> <%
            
        } else { 
            %> <script>alert("아이디 비밀번호가 일치하지 않습니다.");</script> <%
        }
        board.CloseQuery();
        board.DBClose();
    }
%>