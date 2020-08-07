<%@ page contentType="text/html; charset=utf8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/include/common_head.jsp">
        <jsp:param name="title" value="없는 페이지" />
        <jsp:param name="filename" value="pageNotFound"/>
    </jsp:include>
    <style>
        html, body {
            height: 100%;
            /* background: #4caf50 ; */
        }
        .container { 
            display: flex; 
            flex-direction: column; 
            justify-content: center;
            align-items: center;
            height: 100%;
        }
    </style>
</head>
</body>
    <div class="container">
        <img style="height: 300px;" src="/favicon.svg" alt="">
        <h4 class="green-text">페이지를 찾을 수 없습니다.</h4>
        <a href="/index.jsp"><button class="green darken-1 btn">메인으로</button></a>
    </div>
</body>
</html>