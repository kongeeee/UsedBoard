<%@ page contentType="text/html;charset=utf-8" %>

<jsp:include page="/include/common_loginCheck.jsp"/>
<jsp:include page="/include/write_proc.jsp"/>

<!DOCTYPE html>
<html>
<head>
    <jsp:include page="include/common_head.jsp">
        <jsp:param name="title" value="글쓰기"/>
        <jsp:param name="filename" value="write"/>
    </jsp:include>
</head>
<body>
    <div class="container">
        <%-- 로고 --%>
        <jsp:include page="/include/common_logo.jsp"/>
        
        <%-- 글쓰기 폼 --%>
        <jsp:include page="/include/write_form.jsp"/>
    </div>
</body>
</html>