<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="include/dbinfo.jsp" %>
<%@ include file="include/head.jsp" %>
<%@ include file="include/menu.jsp" %>
<%
//검색 파라메터를 분석한다.
String category = request.getParameter("category");
String key       = request.getParameter("key");
String pageno  = request.getParameter("pageno");
String no         = request.getParameter("no");
if(category == null || category.equals(""))
{
	category = "0";
}
if(key == null || key.equals(""))
{
	key = "";
}
if(pageno == null || pageno.equals(""))
{
	pageno = "1";
}

//게시물 정보를 가져온다.
myBoard.DBOpen();

String mSelectSQL = "";

mSelectSQL += "select no,title,contents,type,hit ";
mSelectSQL += "from board ";
mSelectSQL += "where no = '" + no + "' ";
//out.print(mSelectSQL);

myBoard.OpenQuery(mSelectSQL);
myBoard.ResultNext();
String board_no    =  myBoard.getString("no");
String board_title  =  myBoard.getString("title");
String board_body =  myBoard.getString("contents");
String board_type  =  myBoard.getString("type");
String board_hit    =  myBoard.getString("hit");
myBoard.CloseQuery();

//조회수를 +1 한다.
String mUpdateSQL = "update board set hit = hit + 1 where no = '" + no + "' ";
//out.print(mUpdateSQL);
myBoard.Excute(mUpdateSQL);	

//MySQL 접속을 종료한다.
myBoard.DBClose();
%>
<script language="javascript">

	function GoList()
	{
		document.location = "list.jsp?category=<%= category %>&key=<%= key %>&pageno=<%= pageno %>";
	}

</script>
<table border="1" cellpadding="0" cellspacing="0" bgcolor="#fffff0" width="100%">
	<tr>
		<td width="120px" align="center">분류</td>
		<td>
			<%
			if(board_type.equals("0"))
			{
				%>공지<%
			}else
			{
				%>자료<%
			}
			%>
		</td>
	</tr>
	<tr>
		<td align="center">조회수</td>
		<td><%= board_hit %></td>
	</tr>
	<tr>
		<td align="center">제목</td>
		<td><%= board_title %></td>
	</tr>
	<tr>
		<td align="center">내용</td>
		<td><%= board_body.replaceAll("\n","<br>\n") %></td>
	</tr>
	<tr>
		<td colspan="2" height="40" align="center">
			<input type="button" value="글수정" onclick="javascript:document.location='modify.jsp?category=<%= category %>&key=<%= key %>&pageno=<%= pageno %>&no=<%= no %>';">
			<input type="button" value="글삭제" onclick="javascript:document.location='delete.jsp?category=<%= category %>&key=<%= key %>&pageno=<%= pageno %>&no=<%= no %>';">
			<input type="button" value="목록으로" onclick="javascript:GoList();">
		</td>
	</tr>
</table>

<%@ include file="include/tail.jsp" %>