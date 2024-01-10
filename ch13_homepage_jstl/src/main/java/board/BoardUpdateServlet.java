package board;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		Board upBoard = new Board();
		upBoard.setSubject(request.getParameter("subject"));
		upBoard.setContent(request.getParameter("content"));
		int num = Integer.parseInt(request.getParameter("num"));
		upBoard.setNum(num);
		
		String inputPass = request.getParameter("pass");
		
		HttpSession session = request.getSession();
		Board dbBoard = (Board)session.getAttribute("bean");
		PrintWriter out = response.getWriter();
		
		String nowPage = request.getParameter("nowPage"); 
		if(inputPass.equals(dbBoard.getPass())) {
			new BoardDao().updateBoard(upBoard);
			response.sendRedirect("read.jsp?num="+num+"&nowPage="+nowPage);
		} else {
			out.print("<script>");
			out.print("alert('비밀번호가 맞지 않습니다');");
			out.print("history.back();");
			out.print("</script>");
		}
	}

}






