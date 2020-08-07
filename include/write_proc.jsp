<%@ page contentType="text/html charset=utf8" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.URLEncoder" %>

<jsp:useBean id="board" class="ezen.Board" scope="page"/>

<%  
    if (request.getMethod().equals("POST")) {
        
        String uploadPath = request.getRealPath("/images");
        int fileSize = 10 * 1024 * 1024;
        MultipartRequest multi = null;
        String filename = null;

        try { multi = new MultipartRequest(request, uploadPath, fileSize, "UTF-8", new DefaultFileRenamePolicy()); } 
        catch(Exception e) { e.printStackTrace(); }

        filename  = (String) multi.getFilesystemName((String)multi.getFileNames().nextElement());

        String title    = multi.getParameter("title");
        String Class    = multi.getParameter("class");
        String price    = multi.getParameter("price");
        String content  = multi.getParameter("content");
        String prevPage = multi.getParameter("prevPage");
        String nickname = (String)session.getAttribute("nickname");
        String name     = (String)session.getAttribute("name");
        String id       = (String)session.getAttribute("id");
        String phone    = (String)session.getAttribute("phone");
        String image    = null;

        if (price.equals("")) price = "0";
        if (filename != null) image = "'images/" + filename + "'";
        if (filename == null) image = "NULL";

        //글쓰기
        
        if (!title.equals("") && !content.equals("")) {
            board.DBOpen();
            String InsertSQL = "";
            InsertSQL  = "INSERT INTO content (title, content, nickname, view, date, class, price, name, phone, image, id) ";
            InsertSQL += "VALUES('"+ title +"','"+ content +"','"+ nickname +"', 0, now(),'"+ Class +"','"+ price +"','"+ name +"','"+ phone +"',"+ image +",'"+id+"')";
            board.Excute(InsertSQL);
            board.DBClose();
            %><script>alert("글이 작성되었습니다"); location.href = '/';</script><%
        }
        
    }
%>