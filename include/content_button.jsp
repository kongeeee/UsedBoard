<%@ page contentType="text/html;charset=utf-8" %>
<%  String id  = request.getParameter("id");
    String idx = request.getParameter("idx");
    String userid = (String)session.getAttribute("id");
%>
<div class="submit col s12">
    <button class="m1 right btn waves-effect waves-light green lighten-1" onclick="location.href ='/index.jsp?search=${param.search}&page=${param.page}'">목록</button>
    <%  if(id.equals(userid)) { %>
        <button class="m1 right btn waves-effect waves-light green lighten-1" onclick='del("<%=idx%>")'>삭제</button>
        <button class="m1 right btn waves-effect waves-light green lighten-1" onclick="location.href = 'modify.jsp?idx=<%=idx%>'">수정</button>
    <%  } %>
</div>