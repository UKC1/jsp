package ajaxPro1;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AjaxController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str = request.getParameter("input");
		/*
		PrintWriter out = response.getWriter();
		out.print("<html>");
		*/
		String responseData = "입력된 값 : " + str + ", 길이" + str.length();
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(responseData);
	}
}