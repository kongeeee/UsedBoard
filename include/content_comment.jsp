<%@ page contentType="text/html;charset=utf-8" %>
<jsp:useBean id="board" class="ezen.Board" scope="page"/>
<div class="input-field col s12">
    <form name="form_comment" method="POST" action="comment.jsp">
        <i class="material-icons prefix">comment</i>
        <textarea id="comment" name="comment" class="materialize-textarea"></textarea>
        <label for="comment">댓글쓰기</label>
        <button class="btn waves-effect waves-light green lighten-1 right">입력하기</button>
        <input type="hidden" name="idx" value="${param.idx}"/>
    </form>
</div>
<div>
    <%  String commentSQL = "SELECT * FROM comment WHERE idx=" + request.getParameter("idx") + " ORDER BY cidx ASC";
        board.DBOpen();
        board.OpenQuery(commentSQL);

        while (board.ResultNext()) {
            String nickname = board.getString("name");
            String comment  = board.getString("comment");
    %> 
            <div class="comment-box row">
                <div class="col s2 comment-name"><%= nickname %></div>
                <div class="col s10 comment-content"><%= comment %></div>
            </div>

    <%  } board.CloseQuery(); board.DBClose(); %>
</div>