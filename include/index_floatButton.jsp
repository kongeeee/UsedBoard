<%@ page contentType="text.html; charset=utf8" %>

<div class="fixed-action-btn">
    <a class="btn-floating btn-large green darken-2" data-position="left" data-tooltip="글쓰기">
        <i class="material-icons">add</i>
    </a>
    <ul>
    <%  if (session.getAttribute("name") != null) { %>
        <li><a class="btn-floating green darken-1 tooltipped" href="/write.jsp" data-position="left" data-tooltip="글쓰기"><i class="material-icons">mode_edit</i></a></li>
        <li><a class="btn-floating green darken-2 tooltipped" href="/logout.jsp" data-position="left" data-tooltip="로그아웃"><i class="material-icons">vpn_key</i></a></li>
    <%  } else { %>
        <li><a class="btn-floating green darken-1 tooltipped" href="/login.jsp" data-position="left" data-tooltip="로그인"><i class="material-icons">vpn_key</i></a></li>
        <li><a class="btn-floating green darken-2 tooltipped" href="/sign.jsp" data-position="left" data-tooltip="회원가입"><i class="material-icons">person</i></a></li>
    <%  } %>
    </ul>
</div>