<%@ page contentType="text/html;charset=utf-8" %>

<jsp:useBean id="board" class="ezen.Board" scope="page"/>
<jsp:include page="/include/common_loginCheck.jsp"/>

<%  String idx = request.getParameter("idx");
    String selectSQL = "SELECT id FROM content WHERE idx = " + idx;
    String contentDeleteSQL = "DELETE FROM content WHERE idx = " + idx;
    String commentDeleteSQL = "DELETE FROM comment WHERE idx = " + idx;
    String info = "";

    board.DBOpen();

    board.OpenQuery(selectSQL);

    if (board.ResultNext()) {
        String id = board.getString("id");
        String userid = (String)session.getAttribute("id");
        if (id.equals(userid)) {
            board.Excute(contentDeleteSQL);
            board.Excute(commentDeleteSQL);
            info = "게시물이 삭제되었습니다.";
        } else {
            info = "게시물을 삭제할 권한이 없습니다.";
        }
    } else {
        info = "존재하지 않는 게시물입니다.";
    }
    
    board.CloseQuery();
    board.DBClose();
%>
<script> alert('<%= info %>'); location.href = '/'; </script>