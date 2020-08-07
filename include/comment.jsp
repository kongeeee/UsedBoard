<%@ page contentType="text/html;charset=utf-8" %>
<%  String nickname = request.getParameter("nickname");
    String comment  = request.getParameter("comment");
%>
<div class="comment-box row">
    <div class="col s2 comment-name"><%= nickname %></div>
    <div class="col s10 comment-content"><%= comment %></div>
</div>