package ajaxPro1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AjaxIdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("checkId");
		boolean result = new MemberDao().checkId(id);
		if(result) {
			response.getWriter().print("idN");	// id가 있음 쓸수없음
		} else {
			response.getWriter().print("idY");	// 쓸수 있음
		}
	}
}