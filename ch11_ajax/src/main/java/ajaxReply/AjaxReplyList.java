package ajaxReply;

import java.io.IOException;
import java.util.ArrayList;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AjaxReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNum = Integer.parseInt(request.getParameter("bnum"));
		/*
		ReplyDao replydao = new ReplyDao();
		replydao.getReplyList(boardNum);
		*/
		 ArrayList<Reply> alist = new ReplyDao().getReplyList(boardNum);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(alist, response.getWriter());		
	}
}