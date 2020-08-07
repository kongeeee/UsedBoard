<%@ page contentType="text/html; charset=utf8" %>

<%  if (session.getAttribute("name") == null) { %>
    <script>
        alert("로그인 해 주시기 바랍니다.");
        location.href = "/login.jsp";
    </script>
<%  } %>