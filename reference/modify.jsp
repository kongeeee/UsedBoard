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

//MySQL 접속을 종료한다.
myBoard.DBClose();
%>
<script language="javascript">

	function GoList()
	{
		if(confirm("글쓰기를 취소하고 글보기로 이동하시겠습니까?") != 1)
		{
			return;
		}
		document.location = "view.jsp?category=<%= category %>&key=<%= key %>&pageno=<%= pageno %>&no=<%= no %>";
	}

</script>
<form id="modify_form" name="modify_form" method="post" action="modify_ok.jsp">
	<input type="hidden" id="category" name="category" value="<%= category %>">
	<input type="hidden" id="key" name="key" value="<%= key %>">
	<input type="hidden" id="pageno" name="pageno" value="<%= pageno %>">
	<input type="hidden" id="no" name="no" value="<%= no %>">
	<table border="1" cellpadding="0" cellspacing="0" bgcolor="#fffff0" width="100%">
		<tr>
			<td width="120px" align="center">분류</td>
			<td>
				<select id="type" name="type">
					<%
					if(board_type.equals("0"))
					{
						%><option value="0" selected>공지</option><%
					}else
					{
						%><option value="0">공지</option><%
					}
					%>					
					<%
					if(board_type.equals("1"))
					{
						%><option value="1" selected>자료</option><%
					}else
					{
						%><option value="1">자료</option><%
					}
					%>					
				</select>
			</td>
		</tr>
		<tr>
			<td align="center">제목</td>
			<td><input type="text" id="title" name="title" style="width:100%" value="<%= board_title %>"></td>
		</tr>
		<tr>
			<td align="center">내용</td>
			<td>
				<textarea  style="width:100%" rows="10" id="contents" name="contents"><%= board_body %></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="40" align="center">
				<input type="submit" value="저장하기">
				<input type="button" value="작성취소" onclick="javascript:GoList();">
			</td>
		</tr>
	</table>
</form>
<%@ include file="include/tail.jsp" %>