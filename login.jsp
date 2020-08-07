<%@ page contentType="text/html;charset=utf-8" %>
<jsp:include page="/include/login_proc.jsp"/>
<%-- <jsp:include page="/include/common_prevPage.jsp"/> --%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="include/common_head.jsp">
        <jsp:param name="title" value="로그인"/>
        <jsp:param name="filename" value="login"/>
    </jsp:include>
</head>
<body>
    <div class="container">
        <div class="row">
            <form class="col s6 offset-s3" id="login" name="login" method="POST" action="login.jsp">
                <h4 class="header-login center">로그인</h4>
                <div class="row">
                    <%  String[] icons    = { "account_circle", "lock_outline" };
                        String[] varnames = { "id", "password" };
                        String[] kornames = { "아이디", "비밀번호" };
                    %>
                    <%  for (int index = 0; index < icons.length; index++) { %>

                        <jsp:include page="include/common_inputField.jsp">
                            <jsp:param name="icon" value="<%= icons[index] %>"/>
                            <jsp:param name="varname" value="<%= varnames[index] %>"/>
                            <jsp:param name="korname" value="<%= kornames[index] %>"/>
                        </jsp:include>

                    <%  } %>
                    <div class="submit center col s12">
                        <button class="btn waves-effect waves-light green lighten-1" onclick="check()"><a class="white-text">로그인</a></button>
                        <button class="btn waves-effect waves-light green lighten-1" onclick="cancel('${prevPage}')"><a class="white-text">돌아가기</a></button>
                    </div>
                    <div class="col s12">
                        <p class="center" style="margin-top: 2.5rem">아이디가 없으신가요? <a href="/sign.jsp">가입하기</a></p>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>