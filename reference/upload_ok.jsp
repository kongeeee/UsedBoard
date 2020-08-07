<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.URLEncoder" %>
<%

//업로드를 위한 로컬 디렉토리명을 얻는다.
String uploadPath = request.getRealPath("/upload");
out.print(uploadPath);

//업로드가 가능한 최대 파일 크기를 지정한다.
int size = 10 * 1024 * 1024;

MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());

//업로드된 파일명을 얻는다.
Enumeration files = multi.getFileNames();
String fileid1 = (String) files.nextElement();
String filename1 = (String) multi.getFilesystemName(fileid1);
String fileid2 = (String) files.nextElement();
String filename2 = (String) multi.getFilesystemName(fileid2);
out.print("<br>");
out.print(fileid1);
out.print(":");
out.print(filename1);
out.print("<br>");
out.print(fileid2);
out.print(":");
out.print(filename2);
%>
<br>
<img src="/upload/<%= filename2 %>">
<br>
<a href="down.jsp?file=<%= URLEncoder.encode(filename1) %>"><%= filename1 %></a>


