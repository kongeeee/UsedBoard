<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.URLEncoder" %>

<jsp:useBean id="board" class="ezen.Board" scope="page"/>

    <%
    String filename = request.getParameter("image");
    String uploadPath = request.getRealPath("/images");
    int size = 10 * 1024 * 1024;
    DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
    MultipartRequest multi = null;
    try{
        multi = new MultipartRequest(request,uploadPath,size,"UTF-8",policy);
        
        Enumeration files = multi.getFileNames();
        String fileid1    = (String) files.nextElement();
        filename  = (String) multi.getFilesystemName(fileid1);

    }catch(Exception e){
        e.printStackTrace();
    }

    String title     = multi.getParameter("title");
    String image     = "NULL";
    String content   = multi.getParameter("content");
    String price     = multi.getParameter("price");
    String Class     = multi.getParameter("class");
    String id        = multi.getParameter("id");
    String idx       = multi.getParameter("idx");

    board.DBOpen();

    if (filename != null) image = "'images/" + filename + "'";

    // 수정하기
    String UpdateSQL = "";
    UpdateSQL = "UPDATE content SET title='"+ title +"', Class='"+ Class +"', price='"+ price +"', content = '"+ content +"',image="+ image +" where idx =" + idx;
    board.Excute(UpdateSQL);

    board.DBClose();
    %>
<html>
<head>
<title>글수정완료</title>
<script>
    //글 수정
    alert("게시물이 수정되었습니다.");
    location.href = '/content.jsp?idx=' + '<%= idx %>';
</script>