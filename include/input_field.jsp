<%@ page contentType="text/html; charset=utf8" %>

<%  String icon = request.getParameter("icon");
    String varname = request.getParameter("varname");
    String korname = request.getParameter("korname");
%>

<div class="input-field col s12">
    <i class="material-icons prefix"><%= icon %></i>
    <input id="<%= varname %>" name="<%= varname %>" type="text">
    <label for="<%= varname %>"><%= korname %></label>
</div>