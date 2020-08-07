<%@ page contentType="text/html; charset=utf8" %>
<%@ page import="java.net.*" %>
<jsp:useBean id="board" class="ezen.Board" scope="page"/>
<%	String keyword = request.getParameter("search");
	String nowPage = request.getParameter("page");

	if (keyword == null || keyword.equals("")) keyword = "";
    if (nowPage == null || nowPage.equals("")) nowPage = "1";

    //한글 encoding
    String keywordEx = URLEncoder.encode(keyword,"utf-8");

	String countSQL =   "SELECT COUNT(*) AS count FROM content ";
    countSQL +=         "WHERE title LIKE '%"+ keyword +"%'";

	board.DBOpen();
	board.OpenQuery(countSQL);
	board.ResultNext();

    int nowPageInt = Integer.parseInt(nowPage);
	int contentSum = board.getInt("count");
	int pageCount = 5;
	int contentCount = 4;
    int index = 1;
    int count = 1;
    int maxPage = contentSum / contentCount + ((contentSum % contentCount != 0) ? 1 : 0);
    while (nowPageInt > pageCount + index - 1) { index += 5; }

    String leftArrow  = (nowPageInt <= 1) ? "disabled" : "waves-effect";
    String rightArrow = (nowPageInt >= maxPage) ? "disabled" : "waves-effect";
    String leftLink   = (nowPageInt <= 1) ? "" : "href=\"/index.jsp?search=" + keywordEx + "&page=" + String.valueOf(nowPageInt - 1) + "\"";
    String rightLink  = (nowPageInt >= maxPage) ? "" : "href=\"/index.jsp?search=" + keywordEx + "&page=" + String.valueOf(nowPageInt + 1) + "\"";

    board.CloseQuery();
    board.DBClose();
%>
<div>
    <ul class="pagination center">
        
        <li class="<%= leftArrow %>"><a <%= leftLink %>><i class="material-icons">chevron_left</i></a></li>
        
        <%  for (; index <= maxPage && count <= 5; index++, count++) { %>
                <li class="waves-effect <%= ((index == nowPageInt) ? "active green" : "") %>"><a href="/index.jsp?search=<%=keywordEx%>&page=<%=index%>"><%= index %></a></li>
        <%  } %>

        <li class="<%= rightArrow %>"><a <%= rightLink %>><i class="material-icons">chevron_right</i></a></li>
    </ul>
</div>
<%  if (nowPageInt < 1 || nowPageInt > maxPage) { %>
    <script>
        alert("없는 페이지 입니다.");
        location.href="/";
    </script>
<%  } %>