<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="include/dbinfo.jsp" %>
<%@ include file="include/head.jsp" %>
<%@ include file="include/menu.jsp" %>
<%
//검색 파라메터를 분석한다.
String category = request.getParameter("category");
String key       = request.getParameter("key");
String pageno  = request.getParameter("pageno");
int     perpage  = 5;
int     startPage = 0;
int     maxPage  = 0;

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

//현재 페이지 번호에 따른 시작 결과값 계산
int curpage = Integer.parseInt(pageno);
startPage = (curpage - 1) * perpage;
%>
<script language="javascript">

//검색을 수행하기 위한 함수
function DoSearch()
{
	document.search_form.submit();
}
</script>
<table border="1" cellpadding="0" cellspacing="0" bgcolor="#fffff0" width="100%">
	<tr>
		<td align="center" height="30px">
			<form id="search_form" name="search_form" method="get" action="list.jsp">
				<select id="category" name="category">
					<%
					if( category.equals("0") )
					{
						%><option value="0" selected>공지</option><%
					}else
					{
						%><option value="0">공지</option><%
					}
					%>
					<%
					if( category.equals("1") )
					{
						%><option value="1" selected>자료</option><%
					}else
					{
						%><option value="1">자료</option><%
					}
					%>
				</select>
				<input type="text" size="10" id="key" name="key" value="<%= key %>">
				<a href="javascript:DoSearch();"><img src="images/search.jpg" align="absmiddle"></a>
			</form>
		</td>
		<td align="right">
			[ <a href="write.jsp?category=<%= category %>&key=<%= key %>&pageno=<%= pageno %>">글쓰기</a> ]
		</td>
	</tr>
</table>
<%
	myBoard.DBOpen();

	//검색 조건을 생성한다.
	String mWhere = "";
	if(!category.equals(""))
	{
		mWhere  += "where type = '" + category + "' ";
	}
	if(!key.equals(""))
	{
		if(!mWhere.equals(""))
		{
			mWhere  += " and  ";
		}else
		{
			mWhere  += " where  ";
		}
		mWhere  += " title like '%" + key + "%' ";
	}

	//현재 게시판에서 총 게시물의 갯수를 얻는다.
	String mTotalSQL = "";
	mTotalSQL  += "select count(no) as totalrow ";
	mTotalSQL  += "from board ";
	mTotalSQL  += mWhere;
	//out.print(mTotalSQL);
	//out.print("<br>");

	myBoard.OpenQuery(mTotalSQL);
	myBoard.ResultNext();
	int totalRow = myBoard.getInt("totalrow");
	myBoard.CloseQuery();

	//최대 페이지 번호를 얻는다.
	maxPage = totalRow / perpage;
	if( totalRow % perpage != 0)
	{
		maxPage = maxPage + 1;
	}
%>
※ 총 <%= totalRow %>개의 게시물이 조회되었습니다.
<table border="1" cellpadding="0" cellspacing="0" bgcolor="#ffffff" width="100%">
	<tr>
		<td align="center" width="80px">번호</td>
		<td align="center">제목</td>
		<td align="center" width="100px">조회수</td>
	</tr>
	<%
	//등록된 게시물의 목록을 얻는다.
	String mSelectSQL = "";
	
	mSelectSQL += "select no,title,type,hit ";
	mSelectSQL += "from board ";
	mSelectSQL += mWhere;
	mSelectSQL += "order by no desc ";
	mSelectSQL += "limit " + startPage + "," + perpage;
	//out.print(mSelectSQL);
	myBoard.OpenQuery(mSelectSQL);


	//검색된 결과를 얻는다.
	while( myBoard.ResultNext() )
	{
		String no    =  myBoard.getString("no");
		String title  =  myBoard.getString("title");
		String type  =  myBoard.getString("type");
		String hit    =  myBoard.getString("hit");

		%>
		<tr>
			<td align="center"><%= no %></td>
			<td><a href="view.jsp?category=<%= category %>&key=<%= key %>&pageno=<%= pageno %>&no=<%= no %>"><%= title %></a></td>
			<td align="center"><%= hit %></td>
		</tr>
		<%
	}

	myBoard.DBClose();
	%>
	<tr>
		<td colspan="3" align="center">
			<%
			if(curpage <= 1)
			{
				%>
				[ <a href="javascript:alert('첫 번째 페이지입니다.');">이전페이지</a> ] 
				<%
			}else
			{
				%>
				[ <a href="list.jsp?category=<%= category %>&key=<%= key %>&pageno=<%= curpage - 1 %>">이전페이지</a> ] 
				<%
			}


			for(int i=1;i<=maxPage;i++)
			{
				if(i == curpage)
				{
					%>
					&nbsp;<a href="list.jsp?category=<%= category %>&key=<%= key %>&pageno=<%= i %>"><strong><font color="red"><%= i %></font></strong></a>&nbsp;
					<%
				}else
				{
					%>
					&nbsp;<a href="list.jsp?category=<%= category %>&key=<%= key %>&pageno=<%= i %>"><%= i %></a>&nbsp;
					<%
				}
			}
			
			if(curpage >= maxPage)
			{
				%>
				[ <a href="javascript:alert('마지막 페이지입니다.');">다음페이지</a> ]
				<%
			}else
			{
				%>
				[ <a href="list.jsp?category=<%= category %>&key=<%= key %>&pageno=<%= curpage + 1 %>">다음페이지</a> ]
				<%
			}
			%>
		</td>
	</tr>
</table>

<%@ include file="include/tail.jsp" %>