<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<%
	String nowPage = request.getParameter("nowPage");
	Board board = (Board)session.getAttribute("bean");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{width:550px; margin-top: 50px;}
</style>
</head>
<body>
	<form action="boardReply" method="post">
		<table align="center" >
			<tr>
				<th colspan="2" bgcolor="#FAE0D4" height="30">댓 글 등 록</th>
			</tr>
			<tr>
				<td width="15%">성명</td>
				<td><input name="name"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input name="subject" value="답변 : <%=board.getSubject() %>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content" rows="10" cols="50">
<%=board.getContent() %>
========== 댓글을 작성하세요 =========
					</textarea>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2"><hr></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="답변등록">&emsp;
					<input type="reset" value="다시쓰기">&emsp;
					<input type="button" value="뒤로" onclick="history.back();">
				</td>
			</tr>
		</table>
		<!-- 나의 정보 -->
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
		<!-- 상세읽기에서 넘어온 정보 -->
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<!-- 부모들의 정보 -->
		<input type="hidden" name="ref" value="<%=board.getRef() %>">
		<input type="hidden" name="pos" value="<%=board.getPos() %>">
		<input type="hidden" name="depth" value="<%=board.getDepth() %>">
	</form>
</body>
</html>