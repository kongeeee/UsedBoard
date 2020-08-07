<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="include/head.jsp" %>
<%@ include file="include/menu.jsp" %>
<%
//========== list.jsp 에서 보내준 정보를 분석한다.
//목록에서 넘겨준 파라메터를 분석한다.
String category = request.getParameter("category");
String key        = request.getParameter("key");
String pageno   = request.getParameter("pageno");
%>
<script language="javascript">

	function GoList()
	{
		if(confirm("글쓰기를 취소하고 목록으로 이동하시겠습니까?") != 1)
		{
			return;
		}
		document.location = "list.jsp";
	}

	//저장하기를 누르면 호출되는 함수
	function FormCheck()
	{
		if(write_form.title.value == "")
		{
			alert("제목을 입력하세요.");
			write_form.title.focus();
			return;
		}
		if(write_form.contents.value == "")
		{
			alert("내용을 입력하세요.");
			write_form.contents.focus();
			return;
		}
		write_form.submit();
	}

</script>
<form id="write_form" name="write_form" method="post" action="write_ok.jsp">
	<input type="hidden" id="category" name="category" value="<%= category %>">
	<input type="hidden" id="key" name="key" value="<%= key %>">
	<input type="hidden" id="pageno" name="pageno" value="<%= pageno %>">
	<table border="1" cellpadding="0" cellspacing="0" bgcolor="#fffff0" width="100%">
		<tr>
			<td width="120px" align="center">분류</td>
			<td>
				<select id="type" name="type">
					<option value="0" selected>공지</option>
					<option value="1">자료</option>
				</select>
			</td>
		</tr>
		<tr>
			<td align="center">제목 (<font color="#ff6600">*</font>)</td>
			<td><input type="text" id="title" name="title" style="width:100%"></td>
		</tr>
		<tr>
			<td align="center">내용(<font color="#ff6600">*</font>)</td>
			<td>
				<textarea  style="width:100%" rows="10" id="contents" name="contents"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="40" align="center">
				<input type="button" value="저장하기" onclick="javascript:FormCheck();">
				<input type="button" value="목록으로" onclick="javascript:GoList();">
			</td>
		</tr>
	</table>
</form>
<%@ include file="include/tail.jsp" %>