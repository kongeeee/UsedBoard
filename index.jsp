<%@ page contentType="text/html;charset=utf-8" %>

<%-- <jsp:include page="/include/common_prevPage.jsp" /> --%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="/include/common_head.jsp">
        <jsp:param name="title"    value="중고거래 게시판"/>
        <jsp:param name="filename" value="index"/>
    </jsp:include>
</head>
<body>
    <div class="container">
        <%-- 로고 --%>
        <jsp:include page="/include/common_logo.jsp"/>
        
        <%-- 게시글 목록 --%>
        <jsp:include page="/include/index_list.jsp"/>
        
        <%-- 검색박스 --%>
        <jsp:include page="/include/index_search.jsp"/>

        <%-- 페이징버튼 --%>
        <jsp:include page="/include/index_pagination.jsp"/>

        <%-- 도구모음 --%>
        <jsp:include page="/include/index_floatButton.jsp"/>
    </div>
</body>
</html>