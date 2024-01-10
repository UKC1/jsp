<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>1. formatNumber</h3>
	
	<p>
	숫자데이터의 포맷(형식) 지정<br>
	- 표현하고자 하는 숫자데이터의 형식을 통화기호, % 등 원하는 쓰임에 맞게 형식을 지정하는 태그<br><br>
	  (fmt:formatNumber value="출력할 값" [groupingUsed="true|false" type="percent|currency" currencySymbol="통화기호문자"])
	</p>
	
	<c:set var="num1" value="123456789" />
	<c:set var="num2" value="0.95" />
	<c:set var="num3" value="50000" />
	
	num1 출력 : ${num1}<br>
	세자리마다 구분하여 출력 : <fmt:formatNumber value="${num1}"/><br>
						<!-- groupingUsed 기본값 true == 구분자 있게 출력 -->
	숫자 그대로 출력 : <fmt:formatNumber value="${num1}" groupingUsed="false"/><br><br>
	
	percent : <fmt:formatNumber value="${num2}" type="percent"/><br>
	currency : <fmt:formatNumber value="${num3}" type="currency" groupingUsed="false"/><br>
	currency $ : <fmt:formatNumber value="${num3}" type="currency" currencySymbol="$" /><br>
	<!-- 
		type: 백분율(%), 통화기호 형식 지정
		currencySymbol : 통화기호 문자 지정
		
		- type="percent" : %로 출력
		- type="currency" : 현재 local지역의 화폐를 써줌
		- type="currency" urrencySymbol="$" : 화폐단위를 $로 출력해줌
	 -->
	 
	 <hr>
	 
	 <h3>2. formatDate</h3>
	 <p>
	 날짜 및 시간 데이터의 포맷 지정(단, java.util.Date 객체사용)<br>
	 </p>
	 
	 <c:set var="date" value="<%= new java.util.Date() %>" />
	 출력 : ${date}<br>
	 
	 
	 <ul>
	 	<li>현재 날짜 : <fmt:formatDate value="${date}" /></li>
	 	<li>현재 시간 : <fmt:formatDate value="${date}" type="time"/></li>
	 	<li>현재 날짜 시간 : <fmt:formatDate value="${date}" type="both"/></li>
	 	<li>현재 날짜 시간(Medium) : <fmt:formatDate value="${date}" type="both" dateStyle="medium" timeStyle="medium"/></li>
	 	<li>현재 날짜 시간(Long) : <fmt:formatDate value="${date}" type="both" dateStyle="Long" timeStyle="Long"/></li>
	 	<li>현재 날짜 시간(Full) : <fmt:formatDate value="${date}" type="both" dateStyle="full" timeStyle="full"/></li>
	 	<li>현재 날짜 시간(Short) : <fmt:formatDate value="${date}" type="both" dateStyle="short" timeStyle="short"/></li>
	 	<li>내 패턴 : <fmt:formatDate value="${date}" type="both" pattern ="yyyy-MM-dd(E) HH:mm:ss(a)" /></li>
	 </ul>
	 
	 <!-- 
	 	type="date" == 년월일(기본값)
	 	type="time" == 시간
	 	type="both" == 년월일 시간
	 		- dateStyle="medium" timeStyle="medium" == 2024. 1. 5. 오전 10:57:18(기본값)
	 		- dateStyle="Long" timeStyle="Long"     == 2024년 1월 5일 오전 10시 57분 18초 KST
	 		- dateStyle="full" timeStyle="full"     == 2024년 1월 5일 금요일 오전 10시 59분 6초 대한민국 표준시
	 		- dateStyle="short" timeStyle="short"   == 24. 1. 5. 오전 11:00
	 -->
</body>
</html>













