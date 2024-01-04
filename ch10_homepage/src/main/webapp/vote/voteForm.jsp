<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vote.*, java.util.*" %>
<jsp:useBean id="vDao" class="vote.VoteDao" />
<%
	int num = 0;
	if(!(request.getParameter("num") == null || request.getParameter("num").equals(""))) {
		num = Integer.parseInt(request.getParameter("num"));
	}
	
	VoteList vlist = vDao.getOneVote(num);
	ArrayList<String> vItem = vDao.getItem(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<style>
	*{margin:0 auto;}
	.voteForm {width:500px;}
	table {width:500px;}
	.mLeft {margin-left: 320px;}
	a {text-decoration:none; color:black; cursor:pointer;}
</style>
</head>
<body>
	<div class="voteForm">
		<form action="voteFormProc.jsp" method="post">
			<table class="table">
				<tr>
					<th>Q : <%=vlist.getQuestion() %></th>
				</tr>
				<tr>
					<td>
					<%
					for(int i=0; i<vItem.size(); i++) {
						String itemList = vItem.get(i);
						if(vlist.getType() == 1) {
							out.print("<input type='checkbox' name='itemnum' value='"+ i +"'>"+ itemList);
						} else {
							out.print("<input type='radio' name='itemnum' value='"+ i +"'>"+ itemList);
						}
						out.print("<br>");
					}
					%>
					</td>	
				</tr>
				<tr>
					<td>
					<%
					if(vlist.getActive() == 1) {
						out.print("<input type='submit' value='  투표  '>");
					} else {
						out.print("투표");
					}
					%>
					<input class="mLeft" type="button" value="  결과  " onclick="window.open('voteView.jsp?num=<%=num %>','VoteView', 'width=500, height=400')">
					</td>
				</tr>
			</table>
			<input type="hidden" name="num" value="<%=num %>">
		</form>
	</div>
</body>
</html>









