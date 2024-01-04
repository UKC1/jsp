package ajaxPro1;

import java.io.IOException;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AjaxController3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Member bean = new MemberDao().getMember(id);
		
		// 1. 하나의 문자열로 반환
		System.out.println(bean);	// 주소가 아닌 문자가 출력되는것은 toString()을 오버라이딩 했기 때문
		// response.getWriter().print(bean);
		
		// 2. JSONObject로 반환
		/*
		JSONObject jobj = new JSONObject();
		jobj.put("userId", bean.getId());
		jobj.put("userName", bean.getName());
		jobj.put("gender", bean.getGender());
		jobj.put("email", bean.getEmail());
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jobj);
		*/
		
		// 3. GSON(Google json)
		/*
		 위의 JSONObject의 과정을 알아서 해주는 라이브러리
	    */ 
		/*
		 Gson gson = new Gson();  // 객체생성
		 gson.toJson();  		  // gson객체.toJson(응답할자바객체, 응답할스트림);
		 2줄을 아래 1줄로 바꾸어서 사용(47줄)
		*/ 
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(bean, response.getWriter());
		
		// gson이용하여 bean객체 하나만 응답시 JSONObject {key:value, key:value,...} 형태로 만들어져서 응답
		//										  key = 해당 bean객체의 필드명을 알아서 세팅
		
		// 자바배열 또는 ArrayList응답시 JSONArray [value, value, ...] 형태로 만들어져서 응답
	}
}