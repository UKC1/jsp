<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="vDao" class="vote.VoteDao" />
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String[] itemnum = request.getParameterValues("itemnum");
	boolean result = vDao.updateCount(num, itemnum);
	String msg="투표가 등록되지 않았습니다";
	if(result) 
		msg= "투표가 정상적으로 등록되었습니다";
%>
<script type="text/javascript">
	alert("<%=msg %>");
	location.href="voteList.jsp?num=<%=num%>";
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>