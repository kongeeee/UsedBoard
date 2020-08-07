<%@ page contentType="text/html; charset=utf8" %>
<div class="col s12">
    
    <table class="highlight">
        <tbody>
            <tr>
                <td><h5>제목</h5></td>
                <td><h5>${param.title}</h5></td>
            </tr>
            <tr>
                <td>분류</td>
                <td>${param.Class}</td>
            </tr>
            <tr>
                <td>가격</td>
                <td>${param.price}</td>
            </tr>
            <tr>
                <td>판매자</td>
                <td>${param.name} / ${param.phone}</td>
            </tr>
        </tbody>
    </table>
</div>