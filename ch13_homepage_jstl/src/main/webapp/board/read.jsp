<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<jsp:useBean id="bDao" class="board.BoardDao" />
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	
	bDao.upCount(num);
	Board board = bDao.getBoard(num);
	session.setAttribute("bean", board);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{width:550px; margin-top: 50px;}
	.c1 {background-color:#AEC184;}
	.c2 {background-color:#E4F7BA;}
	a {text-decoration:none; color:black; cursor:pointer;}
</style>
</head>
<body>
	<table align="center">
		<tr>
			<th colspan="4" bgcolor="#66793C" height="30"><font color="#fff">글 읽 기</font></th>
		</tr>
		<tr>
			<td width="15%" class="c1" align="center">성명</td>
			<td width="35%" class="c2"><%=board.getName() %></td>
			<td width="15%" class="c1" align="center">등록날짜</td>
			<td><%=board.getRegdate().substring(0, 10) %></td>
		</tr>
		<tr>
			<td class="c1" align="center">제목</td>
			<td colspan="3" class="c2"><%=board.getSubject() %></td>
		</tr>
		<tr>
			<td colspan="4"><br><pre><%=board.getContent() %></pre><br></td>
		</tr>
		<tr>
			<td colspan="4" align="right"><%=board.getIp() %>로 부터 글을 남기셨습니다 / 조회수 <%=board.getCount() %> </td>
		</tr>
		<tr>
			<td colspan="4" align="center">
			<hr/>
			[<a href="javascript:list();">리스트</a> |
			 <a href="update.jsp?num=<%=num%>&nowPage=<%=nowPage%>">수 정</a> |
			 <a href="reply.jsp?nowPage=<%=nowPage%>">답 변</a> |
			 <a href="delete.jsp?num=<%=num%>&nowPage=<%=nowPage%>">삭 제</a>
			]
			</td>
		</tr>	
	</table>
	<form name="listFrm" method="post" action="list.jsp">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<% if(!(keyWord == null || keyWord.equals(""))) {  %>
			<input type="hidden" name="keyField" value="<%=keyField%>">
			<input type="hidden" name="keyWord" value="<%=keyWord%>">
		<%}%>
	</form>
	<script>
		function list() {
			document.listFrm.submit();
		}
	</script>
</body>
</html>






