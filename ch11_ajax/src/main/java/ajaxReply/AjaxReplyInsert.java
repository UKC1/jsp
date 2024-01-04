package ajaxReply;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AjaxReplyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNum = Integer.parseInt(request.getParameter("bnum")); 	// 부모글 번호
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		
		Reply bean = new Reply();
		bean.setRef(boardNum);
		bean.setName(name);
		bean.setContent(content);
		
		int result = new ReplyDao().insertReply(bean);
		
		response.getWriter().print(result);
	}
}