<%@ page contentType="text/html;charset=utf-8" %>

<jsp:useBean id="board" class="ezen.Board" scope="page"/>

<jsp:include page="/include/common_loginCheck.jsp"/>
<%-- <jsp:include page="/include/common_prevPage.jsp"/> --%>

<%  
    String idx        = request.getParameter("idx");
    String contentSQL = "SELECT * FROM content WHERE idx=";

    try { Integer.parseInt(idx); }
    catch (Exception e) { idx = "0"; }

    board.DBOpen();
    board.OpenQuery(contentSQL + idx);
    boolean isAvailable = board.ResultNext();
    
    if (!isAvailable) { %>
        <jsp:forward page="/contentNotFound.jsp"/>
<%  }
    String view         = board.getString("view");
    String title        = board.getString("title");
    String name         = board.getString("name");
    String image_source = board.getString("image");
    String content      = board.getString("content");
    String price        = board.getString("price") + " 원";
    String phone        = board.getString("phone");
    String Class        = board.getString("class");
    String id           = board.getString("id");
    if (Class.equals("0")) Class = "판매";
    else Class = "구매";
    content = content.replaceAll("\r\n","<br>");
    // 조회수 업데이트
    String viewUpdate   = "UPDATE content SET view = view + 1 WHERE idx=" + idx;
    board.Excute(viewUpdate);
%>
<html>
<head>
    <jsp:include page="include/common_head.jsp">
        <jsp:param name="title" value="<%= title %>"/>
        <jsp:param name="filename" value="content"/>
    </jsp:include>
</head>
<body> 
    <div class="container">
        <div class="row" style="margin: 0;">
            <jsp:include page="/include/common_logo.jsp"/>
            
            <jsp:include page="/include/content_infoTable.jsp">
                <jsp:param name="title" value="<%= title %>"/>
                <jsp:param name="Class" value="<%= Class %>"/>
                <jsp:param name="price" value="<%= price %>"/>
                <jsp:param name="name"  value="<%= name %>"/>
                <jsp:param name="phone" value="<%= phone %>"/>
            </jsp:include>

            <div class="contents col s12" style="margin-top: 2rem; border-bottom: 1px solid lightgray;">
                <div class="row">
                    
                <%  if (image_source != null) { %>
                
                        <div class="col s4">
                            <a href="<%= image_source %>"><img src="<%= image_source %>" alt=""></a>
                        </div>
                        <div class="col s8">
                            <p><%= content %></p>
                        </div>
                
                <%  } else { %>
                        
                        <div class="col s12">
                            <p><%= content %></p>
                        </div>

                <%  } %>
                </div>
            </div>

            <jsp:include page="include/content_button.jsp">
                <jsp:param name="id" value="<%=id%>"/>
                <jsp:param name="idx" value="<%=idx%>"/>
            </jsp:include>

            <jsp:include page="include/content_comment.jsp"/>
        </div> 
    </div>
</body>
</html>