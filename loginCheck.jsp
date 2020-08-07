<%@ page contentType="text/html; charset=utf8" %>
<jsp:useBean id="board" class="ezen.Board" scope="page"/>
<jsp:include page="include/common_GETBlock.jsp"/>
<%  String id = request.getParameter("id");
    String password = request.getParameter("passowrd");

    // 아이디와 비밀번호가 일치하면 true를 아니면 false를 반환한다
    board.DBOpen();
    String selectSQL = "SELECT id FROM sign WHERE id='" + id + "' and SHA2('" + password + "',256)";
    board.OpenQuery(selectSQL);
    out.print(board.ResultNext());
    board.CloseQuery();
    board.DBClose();
%>