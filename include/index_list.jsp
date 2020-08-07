<%@ page contentType="text/html;charset=utf-8" %>
<jsp:useBean id="board" class="ezen.Board" scope="page"/>
<%  
    String keyword = request.getParameter("search");
    String nowPage = request.getParameter("page");
    int listCount  = 4;
    int limitFirst = 0;

    if (keyword == null || keyword.equals("")) keyword = "";
    try { limitFirst = listCount * Integer.parseInt(nowPage) - listCount; }
    catch (Exception e) { limitFirst = 0; }
    if (limitFirst < 0) { nowPage="0"; limitFirst = 0; }

    String listSQL  = "";
    listSQL =  "SELECT * FROM content ";
    listSQL += "WHERE title LIKE '%"+ keyword +"%' ";
    listSQL += "ORDER BY idx DESC ";
    listSQL += "LIMIT " + String.valueOf(limitFirst) + ", "+ String.valueOf(listCount);
    board.DBOpen();
    board.OpenQuery(listSQL);

    int index = 0;
    while( board.ResultNext() )  {
        request.setAttribute("title", board.getString("title"));
        request.setAttribute("image", board.getString("image"));
        request.setAttribute("Class", board.getString("class"));
        request.setAttribute("writer", board.getString("nickname"));
        request.setAttribute("idx", board.getString("idx"));
        request.setAttribute("date", board.getString("date"));
        request.setAttribute("content", board.getString("content"));
        request.setAttribute("view", "조회수" + board.getString("view"));
        index++; %>
        <jsp:include page="/include/index_card.jsp"/>
<%  } board.CloseQuery(); board.DBClose(); %>

<%  if (index == 0) { %>
    <jsp:include page="index_notResult.jsp"/>
<%  } %>