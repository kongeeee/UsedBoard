<%@ page contentType="text/html; charset=utf8" %>
<jsp:useBean id="board" class="ezen.Board" scope="page"/>
<jsp:include page="/include/common_GETBlock.jsp"/>
<%  String id = request.getParameter("id");
    board.DBOpen();
    String selectSQL = "SELECT id FROM sign WHERE id='" + id + "'";
    board.OpenQuery(selectSQL);
    out.print(board.ResultNext());
    board.CloseQuery();
    board.DBClose();
%>