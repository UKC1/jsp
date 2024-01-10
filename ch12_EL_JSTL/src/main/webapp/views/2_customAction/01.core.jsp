<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, el_jstl.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL Core Library</h1>
	
	<h3>1. 변수(속성==attribute)</h3>
	
	<pre>
		* 변수 선언과 동시에 초기화 (c:set var="" value="" [scope=""])
		- 변수 선언하고 초기값을 대입해두는 기능을 제공
		- 해당 변수를 어떤 scope에 담을것인지 지정가능(생략시 기본적으로 pageScope에 담김)
		=> 즉, 해당 scope에 setAttribute를 통해 key-value형태로 데이터를 담아놓는 거라고 생각하면 됨
		=> c:set으로 선언된 변수는 EL로 접근하여 사용해야 함(스크립팅원소로는 접근 불가)
	</pre>
	
	<c:set var="num1" value="20" />  				 <!-- pageContext.setAttribute("num1","20"); -->
	<c:set var="num2" value="10" scope="request" />  <!-- request.setAttribute("num2","20"); -->
	
	num1 변수값 : ${ num1 }<br>
	num2 변수값 : ${ num2 }<br>
	<%-- <%=num1 %> 접근불가 --%>
	
	<%-- <c:set var="result" value="num1 + num2" scope="session" /> 이렇게 넣으면 string --%>
	<c:set var="result" value="${ num1 + num2 }" scope="session" />
	
	result : ${ result }<br><br>
	
	pageScope.num1 : ${ pageScope.num1 }<br>
	requestScope.num2 : ${ requestScope.num2 }<br>
	sessionScope.result : ${ sessionScope.result }<br>
	requestScope.result : ${ requestScope.result }<br><br>
	
	<!-- value속성 대신 시작태그와 종료태그 사이에 초기값 넣을수 있음 -->
	<c:set var="result" scope="request">
		777
	</c:set>
	
	requestScope.result : ${ requestScope.result }<br>
	
	<hr>
	
	<pre>
		* 변수 삭제 (c:remove var="제거하고자하는 변수명" [scope=""])
		- 해당 scope영역에서 해당 변수를 찾아서 제거하는 태그
		- scope 지정 생략시 모든 scope에서 해당 변수를 모두 찾아서 제거함
		=> 즉 해당 scope에 .removeAttribute를 통해 제거하는것과 같다
	</pre>
	
	삭제전 result : ${ result }<br><br>
	
	1) 특정 scope 지정해서 삭제<br>
	<c:remove var="result" scope="request" />
	
	requestScope의 result 삭제 후 : ${ result }<br><br>
	
	2) 모든 scope에서 삭제<br>
	<c:remove var="result" />
	모두 삭제 후 result : ${ result }<br><br>
	
	<hr>
	
	<pre>
		* 변수의 데이터 출력 (c:out value="출력하고자는 값" [default="기본값"] [escapeXml="true|false"])
		  데이터를 출력하고자 할 때 사용하는 태그
	</pre>
	
	<c:out value="${ result }" /><br>
	<c:out value="${ result }" default="없음" /><br><br>
	
	<c:set var="outTest" value="<b>출력테스트</b>" />
	
	<c:out value="${ outTest }" /><br> <!-- escapeXml을 생략하면 기본값 true == 태그 해석안함(문자열로 취급) -->
	<c:out value="${ outTest }" escapeXml="false"/><br>
	
	<hr>
	
	<h3>2. 조건문 - if(c:if test="조건식")</h3>
	<pre>
		- JAVA의 if문과 비슷한 역할을 하는 태그
		- 조건식은 test속성에 작성(단, EL구문으로 작성)
	</pre>
	
	<c:if test="${ num1 gt num2}">
		<b>num1이 num2보다 크다</b>
	</c:if>
	
	<c:if test="${ num1 le num2 }">
		<b>num1이 num2보다 작거나 같다</b>
	</c:if>
	
	<br>
	
	<c:set var="str" value="안녕" />
	
	<c:if test="${ str eq '안녕' }">
		<h4>Hello JSP</h4>
	</c:if>
	
	<c:if test="${ str ne '안녕' }">
		<h4>Bye JSP</h4>
	</c:if>
	
	<hr>
	
	<h3>3. Choose - (c:choose, c:when, c:otherwise)</h3>
	<pre>
		-JAVA의 if-else, if-else if 문과 비슷한 역할을 하는 태그
		- 각 조건들을 c:choose의 하위요소로 c:when(if의 역할)을 통해 작성하고, c:otherwise(else)의 역할
	</pre>
	
	<c:choose>
		<c:when test="${ num1 gt 30 }">
			<b>num1은 30보다 큰 수</b>
		</c:when>
		<c:when test="${ num1 ge 20 }">
			<b>num1은 20보다 크거나 같은 수</b>
		</c:when>
		<c:otherwise>
			<b>num1은 20보다 작은 수</b>
		</c:otherwise>
	</c:choose>
	
	<hr>
	
	<h3>4. 반복문 - (forEach) </h3>
	<pre>
		for loop문 - (c:forEach var="변수명" begin="초기값" end="끝값" [step="반복시증가값"])
		향상된 for문 - (c:forEach var="변수명" items="순차적으로 접근하고자하는 객체(배열|컬렉션)"
							 [varStatus="현재접근된요소의 상태값을 보관할 변수명"])
		var 속성으로 선언된 변수에 접근하고자 할 때는 반드시 EL구문으로 접근
	</pre>
	
	<c:forEach var="i" begin="1" end="10" step="2">
		반복확인 : ${ i }<br>
	</c:forEach>
	
	<c:forEach var="i" begin="1" end="6">
		<h${i}>태그안에서도 적용가능</h${i}>
	</c:forEach>
	
	<c:set var="colors">
		red,yellow,green,pink
	</c:set>
	
	color 변수값 : ${ colors }<br>
	
	<ul>
		<c:forEach var="c" items="${ colors }">
			<li style="color:${c}">${c}</li>
		</c:forEach>
	</ul>
	
	<%
		ArrayList<Person> list = new ArrayList<Person>();
		list.add(new Person("유재석",43,"남자"));
		list.add(new Person("BTS",25,"남자"));
		list.add(new Person("이빛나",28,"여자"));
	%>
	
	<c:set var="pList" value="<%=list %>" scope="request" />
	
	<table border="1">
		<thead>
			<tr>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${ empty pList }">
					<tr>
						<td colspan="3">조회된 사람이 없습니다</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="p" items="${pList}">
						<tr>
							<td>${p.name}</td>
							<td>${p.age}</td>
							<td>${p.gender}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	
	<br><br><br>
	
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${ empty pList }">
					<tr>
						<td colspan="3">조회된 사람이 없습니다</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="p" items="${pList}" varStatus="status">
						<tr>
							<!-- 
							   varStatus의 속성은 2가지 
								> index : 0부터 시작
								> count : 1부터 시작
							-->
							<td>${status.count}</td>
							<td>${p.name}</td>
							<td>${p.age}</td>
							<td>${p.gender}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	
	<hr>
	
	<h3>5. 반복문 - (forTokens) </h3>
	<pre>
		- 구분자를 통해 분리된 각각의 문자열에 순차적으로 접근하여 반복 수해
		  (c:forTokens var="변수명" items="분리시키고자하는 문자열" delims="구분자")
		- JAVA의 split("구분자")과 비슷한 기능
	</pre>
	
	<c:set var="device" value="컴퓨터,핸드폰,TV,에어컨/냉장고.세탁기" />
	
	<ol>
		<c:forTokens var="d" items="${ device }" delims=",./">
			<li>${d}</li>
		</c:forTokens>
	</ol>
	
	<hr>
	
	<h3>6. url, 쿼리 스트링 - url, param</h3>
	<pre>
		- url경로를 생성하고, 쿼리 스트링을 정의해 둘 수 있는 태그<br>
		
		(c:url var="변수명" value="요청할 url")
			(c:param name="키" value="전달할 값" /)
			(c:param name="키" value="전달할 값" /)
		(/c:url)
	</pre>
	
	<!-- 404오류는 당연히 뜸(파일이 없으므로) => 주소표시줄만 보면 됨 -->
	<a href="list.jsp?num=2&nowPage=3">기존방식</a><br>
	
	<c:url var="bo" value="list.do">
		<c:param name="num" value="2" />
		<c:param name="nowPage" value="3" />
	</c:url>	
	<a href="${bo}">c:url을 이용한 방식</a>
	
	</body>
</html>