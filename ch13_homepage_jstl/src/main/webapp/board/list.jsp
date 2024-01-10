<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*, java.util.*" %>
<jsp:useBean id="bDao" class="board.BoardDao" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<%
	// 페이징 처리 변수들
	int totalRecord = 0;		// 전체 레코드 수(DB의 행의 수)  53개
	int numPerPage = 10;		// 1페이지당 보여줄 레코드수
	int pagePerBlock = 5;		// 블록당 페이지수  [1][2][3][4][5]
			
	int totalPage = 0;			// 전체 페이지 수  ceil(53/10) = 6개 [1][2][3][4][5][6]
	int totalBlock = 0;			// 전체 블록수     2개
	
	int nowPage = 1;			// 현재 해당하는 페이지
	int nowBlock = 1;			// 현재 해당하는 블록
	
	int start = 0;				// DB테이블의 select시작번호(한페이지에 필요한 만큼 게시물만 가져오려고 함)
	int end = 0;				// 가져온 레코드중에서 10개씩 가져오기
	int listSize = 0;			// 현재 읽어온 게시물의 수
	
	String keyField = "", keyWord = "";
	if(request.getParameter("keyWord") != null) {
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
	}
	
	// [처음으로]를 누르면 keyField, keyWord를 지워줌
	if(request.getParameter("reload") != null && request.getParameter("reload").equals("true")) {
		keyField = "";
		keyWord = "";
	}
	
	// 다른페이지로 이동했다 다시 돌아왔을때와 [처음으로]를 눌렀을때
	if(request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	totalRecord = bDao.getTotalCount(keyField, keyWord);
	start = (nowPage*numPerPage)-numPerPage+1;		// 각 페이지당 시작 번호
	end = nowPage*numPerPage;
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);	// 전체 페이지수 =  6
	nowBlock = (int)Math.ceil((double)nowPage / pagePerBlock);		// 현재 블럭 계산
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);	// 전체 블럭 계산 = 2
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {margin: 0 auto;}
	div {width:700px;}
	h2{text-align:center; margin-top: 50px;}
	table {margin-top: 30px; width:700px;}
	table th {text-align:center;}
	a {text-decoration:none; color:black; cursor:pointer;}
	.textAlign{text-align: center;}
</style>
</style>
<script>
	function list() {
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();
	}
	function read(num) {
		document.readFrm.num.value = num;
		document.readFrm.action = "read.jsp";
		document.readFrm.submit();
	}
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
	function block(value) { // value = 이전블록 또는 다음블럭  블럭 2에서 prev, next
		document.readFrm.nowPage.value = <%=pagePerBlock %> * (value-1) + 1;
		document.readFrm.submit();
	}
</script>
</head>
<body>
	<div>
		<h2 align="center">게 시 판</h2>
		<table align="center" class="table">
			<tr>
				<td colspan="5">Total : <%=totalRecord %> Articles(<%=nowPage %> / <%=totalPage %> Pages)</td>
			</tr>
			<tr>
				<th>번 호</th>
				<th>제 목</th>
				<th>이 름</th>
				<th>날 짜</th>
				<th>조회수</th>
			</tr>
			
			<% // DB에서 조회한 결과 게시물 보여주기
			ArrayList<Board> alist = bDao.getBoardList(keyField, keyWord, start, end);
			listSize = alist.size();
			for(int i=0; i<end; i++) {
				if(i==listSize) {
					break;
				}
				Board board = alist.get(i);
				int num = board.getNum();
				String name = board.getName();
				String subject = board.getSubject();
				String regdate = board.getRegdate().substring(0,10);
				int count = board.getCount();
				int depth = board.getDepth();
			%>
			<tr>
				<td align="center"><%=totalRecord-((nowPage-1)*numPerPage)-i %></td>
				<td>
					<%
					if(depth > 0) {
						for(int j=0; j<depth; j++) {
							out.print("&emsp;");
						}
						out.print("↳");
					}
					%>
					<a href="javascript:read('<%=num %>');"><%=subject %></a>
				</td>
				<td align="center"><%=name %></td>
				<td align="center"><%=regdate %></td>
				<td align="center"><%=count %></td>
			</tr>
			<%	
			}		
			%>
		</table>
		
		<!-- 페이징 시작 -->
		<div class="textAlign">
			<%
				int pageStart = (nowBlock-1) * pagePerBlock + 1;  // 어느블록에 속하는지 그 블록에 따른 첫번째 페이지
				int pageEnd = pageStart+pagePerBlock < totalPage ? pageStart+pagePerBlock : totalPage+1;
				if(totalPage != 0) {
					if(nowBlock > 1) {%>
						<a href="javascript:block('<%=nowBlock-1 %>')">prev...</a>&nbsp;
					<%}
					for( ;pageStart<pageEnd; pageStart++) { %>
						<a href="javascript:pageing('<%=pageStart %>')">[<%=pageStart %>]</a>
					<%}
					out.print("&nbsp;");
					if(totalBlock > nowBlock) {%>
						<a href="javascript:block('<%=nowBlock+1 %>')">...next</a>&nbsp;
					<%}
				}
				%>			
		</div>
		
		<div align="right">
			<a href="post.jsp">[글쓰기]</a>&emsp;
			<a href="javascript:list();">[처음으로]</a>
			<a href="../index.jsp">[홈으로]</a>
		</div>
		<!-- 키워드 검색 -->
		<form method="get" action="list.jsp">
			<table align="center">
				<tr>
					<td align="center">
						<select name="keyField">
							<option value="name">이름</option>
							<option value="subject">제목</option>
							<option value="content">내용</option>
						</select>
						<input name="keyWord" required>
						<input type="submit" value="찾기">
					</td>
				</tr>
			</table>
		</form>
		
		<!-- [처음으로] 누르면 화면 reload -->
		<form method="post" name="listFrm">
			<input type="hidden" name="reload" value="true">
			<input type="hidden" name="nowPage" value="1">
		</form>
		
		<form method="get" name="readFrm">
			<input type="hidden" name="num">
			<input type="hidden" name="nowPage" value="<%=nowPage %>">
			<input type="hidden" name="keyField" value="<%=keyField %>">
			<input type="hidden" name="keyWord" value="<%=keyWord %>">
		</form>
	</div>
</body>
</html>