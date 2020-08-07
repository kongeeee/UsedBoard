<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="include/dbinfo.jsp" %>
<%@ include file="include/head.jsp" %>
<%@ include file="include/menu.jsp" %>
<%
//DB저장시 한글 깨짐 방지용
request.setCharacterEncoding("utf-8");

//========== modify.jsp 에서 보내준 정보를 분석한다.
//목록에서 넘겨준 파라메터를 분석한다.
String category = request.getParameter("category");
String key        = request.getParameter("key");
String pageno   = request.getParameter("pageno");
String no         = request.getParameter("no");

//게시물 정보를 분석한다.
String type       = request.getParameter("type");
String title        = request.getParameter("title");
String contents  = request.getParameter("contents");

//out.print("type=" + type + "<br>");
//out.print("title=" + title + "<br>");
//out.print("contents=" + contents + "<br>");

//게시물 정보를 DBMS에 저장한다.
myBoard.DBOpen();

//게시물 정보를 MySQL 에 저장한다.
String mUpdateSQL = "";
mUpdateSQL += "update board ";
mUpdateSQL += "set type = '" + type + "', ";
mUpdateSQL += "title = '" + title + "', ";
mUpdateSQL += "contents = '" + contents + "'  ";
mUpdateSQL += "where no = '" + no + "' ";
//out.print(mUpdateSQL);

myBoard.Excute(mUpdateSQL);	

//MySQL 접속을 종료한다.
myBoard.DBClose();
%>
<br>
<table border="1" cellpadding="0" cellspacing="0" bgcolor="#fffff0" width="90%">
		<tr>
			<td height="50" align="center">게시물이 수정되었습니다.</td>
		</tr>
		<tr>
			<td align="center" height="30">
				[ <a href="list.jsp?category=<%= category %>&key=<%= key %>&pageno=<%= pageno %>">목록으로 이동</a> ]
				[ <a href="view.jsp?category=<%= category %>&key=<%= key %>&pageno=<%= pageno %>&no=<%= no %>">글내용 보기</a> ]
			</td>
		</tr>
</table>
<%@ include file="include/tail.jsp" %>