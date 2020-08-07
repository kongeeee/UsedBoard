<%@ page contentType="text/html;charset=utf-8" %>

<jsp:useBean id="board" class="ezen.Board" scope="page"/>

<jsp:include page="/include/common_loginCheck.jsp"/>
<%
    String comment  = request.getParameter("comment");
    String idx      = request.getParameter("idx");
    String nickname = (String) session.getAttribute("name");
    String alert    = "";

    if (comment != null) {
        board.DBOpen();
        String insertSQL = "INSERT INTO comment (idx, name, date, comment) ";
        insertSQL += "VALUES("+idx+", '"+nickname+"', now(), '"+comment+"')";
        board.Excute(insertSQL);
        board.DBClose();
        alert = "댓글이 입력되었습니다.";
    } else {
        alert = "댓글을 입력하세요.";
    }
%>
<script>
    alert("<%= alert %>");
    location.href = "/content.jsp?idx=<%=idx%>";
</script>