<%@ page contentType="text/html;charset=utf-8" %>
<jsp:include page="/include/sign_proc.jsp"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="include/common_head.jsp">
        <jsp:param name="title" value="회원가입"/>
        <jsp:param name="filename" value="sign"/>
    </jsp:include>
</head>
<body>
    <div class="container">
        <div class="row">
            <form class="col s6 offset-s3" id="sign" name="sign" method="POST" action="sign.jsp">
                <h4 class="header-sign center">회 원 가 입</h4>
                <div class="row">
                    <%  String[] icons = {"face", "account_circle", "person", "lock_outline", "lock", "phone" };
                        String[] varnames = {"name", "id", "nickname", "password", "password2", "phone", };
                        String[] kornames = {"이름", "아이디", "닉네임", "비밀번호", "비밀번호 확인", "핸드폰번호", };
                    %>
                    <%  for (int index = 0; index < icons.length; index++) { %>

                    <jsp:include page="include/common_inputField.jsp">
                        <jsp:param name="icon" value="<%= icons[index] %>"/>
                        <jsp:param name="varname" value="<%= varnames[index] %>"/>
                        <jsp:param name="korname" value="<%= kornames[index] %>"/>
                    </jsp:include>

                    <%  } %>
                    <div class="submit center col s12">
                        <button class="btn waves-effect waves-light green lighten-1" onclick="check('login.jsp')"><a class="white-text">가입하기</a></button>
                        <button class="btn waves-effect waves-light green lighten-1" onclick="cancel('login.jsp')"><a class="white-text">돌아가기</a></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>