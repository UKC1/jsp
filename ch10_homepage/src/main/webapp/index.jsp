<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HomePage</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="resources/css/homepage.css" rel="stylesheet"/>
<script src="resources/js/jQueryUser.js"></script>
</head>
<body>
    <header>
        <div class="logo">
          <img src="https://addinedu.com/theme/basic/img/logo.png" alt="addinedu 로고" id="logo">
        </div>
        <nav>
          <ul class="nav">
            <li><a href="vote/voteList.jsp">투표하기</a></li>
            <li><a href="board/list.jsp">게시판</a></li>
		<%if(id==null) { %>
            <li><a href="member/login.jsp">로그인</a></li>
        <%} else { %> 
            <li><a href="member/logout.jsp">로그아웃</a></li>
        <%} %>
          </ul>
        </nav>
        <div id="login">
        	<%if(id != null) { %>
        	<p>[ <%=id %>님 로그인 상태 ]</p>
        	<%} %>
        </div>
      </header>
      <article id="content">
        <section id="imgslide">
          <img src="resources/img/slide1.jpg" alt="크리스마스">
          <img src="resources/img/slide2.jpg" alt="새해사진">
          <img src="resources/img/slide3.jpg" alt="겨울1">
          <img src="resources/img/slide4.jpg" alt="겨울2">
        </section>
        <section class="notice">
          <h2>공지사항</h2>
          <table class="table">
            <tr>
              <th>내용</th>
              <th>날짜</th>
            </tr>
            <tr>
              <td><a href="#">다도해 풍광을 한눈에...해남 땅끝 해안누리길 여행하기</a></td>
              <td>2023-04-03</td>
            </tr>
            <tr>
              <td><a href="#">국토순례 기차여행에 참가하는 학교, 청소년단체 등...</a></td>
              <td>2023-03-20</td>
            </tr>
            <tr>
              <td><a href="#">설악산 1월초 설경 절정, 기차 여행 상품이 출시되었..</a></td>
              <td>2023-03-11</td>
            </tr>
            <tr>
              <td><a href="#">여행가이드가 추천하는 국내 겨울여행지 & 관광열차</a></td>
              <td>2023-01-03</td>
            </tr>
            <tr>
              <td><a href="#">신나는 겨울여행 대관령 눈꽃축제, 고니골 빛축제로..</a></td>
              <td>2022-12-20</td>
            </tr>
          </table>
        </section>
      
        <section class="partner">
          <h2>정보나눔</h2>
          <div class="partner_info">
            <img src="resources/img/info.png" alt="여행정보">
          </div>
        </section>
    
        <section class="icon">
          <div class="imgbtn">
            <img src="resources/img/새소식.png" alt="no"><br>
            <button>새 소 식</button>
          </div>
          <div class="imgbtn">
            <img src="resources/img/여행음악.png" alt="no"><br>
            <button>여행음악</button>
          </div>
          <div class="imgbtn">
            <img src="resources/img/여행매뉴얼.png" alt="no"><br>
            <button>여행매뉴얼</button>
          </div>
        </section>
      </article>
      <footer> 
        <ul>
            <li><a href="#">법적고지</a></li>
            <li><a href="#">개인정보취급방침</a></li>
            <li><a href="#">개인정보처리방침</a></li>
        </ul>
        <p>
          <b>AddInEdu</b><br><br>
          서울특별시 금천구 가산디지털2로 115, 308호(가산동, 대륭테크노타운3차) | 대표자  박보연 | 사업자번호  847-87-01961 | 고객센터 02-552-8565<br>
          서울특별시 금천구 가산디지털2로 108, 212~213호(가산동, 뉴T캐슬)<br>
          Copyright ⓒ 애드인에듀 KOREA All rights reserved.
        </p> 
      </footer>
</body>
</html>