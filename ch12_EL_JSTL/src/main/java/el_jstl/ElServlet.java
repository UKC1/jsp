package el_jstl;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ElServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 데이터들을 담을 수 있는 jsp내장객체의 종류
		 1. ServletContext(application Scope)
		    한 애플리케이션당 단 1개 존재하는 객체
		    이 영역에 데이터를 담으면 애플리케이션 전역에서 사용가능
		    공유범위가 가장 큼(jsp/servlet/java)
		 2. HttpSession(session Scope)
		 	한 브라우저당 1개 존재하는 객체
		 	이 영역에 데이터를 담으면 jsp/servlet 단에서 사용가능
		 	공유범위가 2번째로 큼
		 3. HttpServletRequest(request Scope)
		 	요청 때마다 매번 생성되는 객체
		 	이 영역에 데이터를 담으면 해당 request객체를 포워딩 받는 응답 jsp에서만 사용가능
		 	공유범위가 응답jsp에서만 사용가능
		 4. PageContext(page Scope)
		 	jsp마다 존재하는 객체
		 	공유범위가 가장 작음(해당 페이지)
		 	
		 위의 4개의 객체들에	
		 데이터를 담을 때  :  .setAttribute("키",담고자하는 데이터)
		 데이터를 꺼내올 때 :  .getAttribute("키") => 데이터가 출력
		 데이터를 삭제할 때 :  .removeAttribute("키")
		 */
		
		// requestScope에 담기
		request.setAttribute("classRoom", "3강의장");
		request.setAttribute("student", new Person("김강민",23,"남자"));
		
		// sessionScope에담기
		HttpSession session = request.getSession();
		session.setAttribute("academy", "AddInEdu");
		session.setAttribute("teacher", new Person("김지원",35,"여자"));
		
		// requestScope와 sessionScope에 동일한 키값으로 데이터 담기
		request.setAttribute("scope", "request");
		session.setAttribute("scope", "session");
		
		// applicationScope에 담기
		ServletContext application = request.getServletContext();
		application.setAttribute("scope", "application");
		
		// 응답페이지를 지정하여 거기에 포워딩 되도록 설정
		request.getRequestDispatcher("views/1_EL/01.el.jsp").forward(request, response);
	}
}