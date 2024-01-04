package ajaxPro1;

import java.io.IOException;

import org.json.simple.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AjaxController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		// v1. 응답 데이터가 하나의 문자열일 때
		/*
		String responseDate = "이름 : " + name + ", 나이 : "+ age;
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(responseDate);
		*/
		
		// v2. 응답 데이터가 여러개 일때
		/*
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(name);
		response.getWriter().print(age);
		*/
		
		// - 응답 데이터가 여러개 일때 json으로 넘겨줌
		/*
		 JSON(JavaScript Object Notation : 자바스크립트 객체 표기법)
		 - ajax 통신시 데이터 전송에 자주 사용되는 포맷형식 중 하나
		 
		  > [vlaue, value, value] => 자바스크립트에서의 배열 객체 => JSONArray
		  > {key:value, key:value} => 자바스크립트에서의 일반 객체 => JSONObject
		 */
		
		// v3. 배열 JSONArray
		/*
		JSONArray jArr = new JSONArray();
		jArr.add(name);
		jArr.add(age);
		
		// response.setContentType("text/html; charset=UTF-8");  // 하나의 문자열로 반환
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jArr);
		*/
		
		// v4. 객체 JSONObject
		JSONObject jObj = new JSONObject();
		jObj.put("name", name);
		jObj.put("age", age);
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jObj);
	}
}