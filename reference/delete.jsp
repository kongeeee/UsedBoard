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

//게시물 정보를 DBMS에 저장한다.
myBoard.DBOpen();

String mDeleteSQL = "delete from board where no = '" + no + "' ";
//out.print(mDeleteSQL);
myBoard.Excute(mDeleteSQL);

//MySQL 접속을 종료한다.
myBoard.DBClose();
%>
<script language="javascript">

	alert("게시글이 삭제되었습니다.");
	document.location = "list.jsp";

</script>
<%@ include file="include/tail.jsp" %>