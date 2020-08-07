<%@ page contentType="text/html;charset=utf-8" %>
<div class="card horizontal" style="cursor : pointer;">
    <%  if (request.getAttribute("image") != null) { %>
    <div class="card-image">
        <img class="img" name="img" src="${image}"/>
    </div>
    <%  } %>
    <div class="card-stacked">
        <div class="card-content">
            <div class="card-title">
                <div class="chip">${Class}</div>${title}
            </div>
            <p>${content}</p>
        </div>
        <div class="card-action">
            <label class="writer">${writer}</label>
            <label class="view">${view}</label>
            <label class="date">${date}</label>
            <a class="right green-text" href="content.jsp?search=${param.search}&page=${param.page}&idx=${idx}">게시글 보기</a>
        </div>
    </div>
</div>