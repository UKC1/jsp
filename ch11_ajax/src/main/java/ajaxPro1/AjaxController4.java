package ajaxPro1;

import java.io.IOException;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AjaxController4 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Member> alist = new MemberDao().getAllMember();
		
		// JSONArray [{key:value},{key:value},...]
		/*
		JSONArray jArr = new JSONArray();
		for(Member m : alist) {
			JSONObject jobj = new JSONObject();
			jobj.put("id", m.getId());
			jobj.put("name", m.getName());
			jobj.put("gaender", m.getGender());
			jobj.put("emil", m.getEmail());
			jArr.add(jobj);
		}
		
		response.setContentType("appliction/json; charset=UTF-8");
		response.getWriter().print(jArr);
		*/
		
		// GSON 사용시 2줄이면 됨
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(alist, response.getWriter());
	}
}