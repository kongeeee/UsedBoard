<%@ page contentType="text/html;charset=utf-8" %>

<jsp:useBean id="board" class="ezen.Board" scope="page"/>
    <%
        String prevPage  = request.getParameter("prevPage");
        String idx       = request.getParameter("idx");
    %>

    <%
    board.DBOpen();

    String selectSQL = "SELECT * FROM content WHERE idx =";
    board.OpenQuery(selectSQL + idx);
    board.ResultNext();
    String title        = board.getString("title");
    String name         = board.getString("name");
    String image        = board.getString("image");
    String content      = board.getString("content");
    String price        = board.getString("price");
    String phone        = board.getString("phone");
    String Class        = board.getString("class");
    board.CloseQuery();
    
    board.DBClose();
    %>
<html>
<head>
    <jsp:include page="/include/common_head.jsp">
        <jsp:param name="title" value="글수정"/>
        <jsp:param name="filename" value="write"/>
    </jsp:include>
</head>
<body>
    <form id="modify" name="modify" enctype="multipart/form-data" method="post" action="modify_ok.jsp">
        <input type="hidden" id = "idx" name="idx" value="<%=idx%>"/>
        <input type="hidden" id = "prevPage" name="prevPage" vale="<%=prevPage%>"/>
        <div class="container">
            <div class="row">
                <jsp:include page="include/common_logo.jsp"/>
                <div class="col s12">
                    <div class="row">
                        <div class="mt2 input-field col s12">
                            <input type="text" id='title' name='title' value="<%=title%>">
                            <label for="title">제목</label>
                        </div>
                    </div>
                </div>
                <div class="col s12">
                    <ul class="tabs">
                        <input type="hidden" id="class" name="class" value="<%=Class%>"/>
                        <li class="tab line"><a class="black-text <%= (Class.equals("판매")) ? "active" : "" %>">판매</a></li>
                        <li class="tab line"><a class="black-text <%= (Class.equals("구매")) ? "active" : "" %>">구매</a></li>
                    </ul> 
                </div> <!--판매/구매-->

                <div class="col s12">
                    <div class="row">
                        <div class="mt2 input-field col s4">
                            <input type="text" id='price' name='price' value="<%=price%>">
                            <label for="price">가격</label>
                        </div>
                        <p class="col s1" style="margin-top: 3rem;">원</p>
                    </div><!--가격-->
                </div>

                <div class="col s12">
                    <div class="row linetop">
                        <p class="col s3">판매자 정보</p>
                        <p class="col s9"> <%=name%> / <%=phone%></p>
                    </div><!--판매자 정보-->
                </div>

                <div class="col s12">
                    <div class="row">
                        <div id="img_box">
                            <%-- <i class="large material-icons" onclick="$('#file_input').trigger('click')">add_a_photo</i>
                            <input id="file_input" type="file" style="display: none" accept="image/*" multiple onchange="fileInfo(this)" name="img[]" id="file"/> --%>
                            <i class="large material-icons" onclick="$('#file_input').trigger('click')">add_a_photo</i>
                            <input id="file_input" type="file" style="display: none" accept="image/*" onchange="fileInfo(this)" name="img" id="file"/>
                            <input type="hidden" id="image" name="image" value="<%= image %>"/>
                        </div>
                        <textarea name="content" id="content" rows="15" cols="60" placeholder="내용을 입력하시오"><%=content%></textarea>
                    </div><!--textarea-->
                </div>
                <div class="col s12">
                    <div class="row">
                        <div class="col s12 center">
                            <button class="btn waves-effect waves-light green lighten-1" onclick="check()">작성</button>
                            <button class="btn waves-effect waves-light green lighten-1" onclick="List(<%=idx%>)">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>