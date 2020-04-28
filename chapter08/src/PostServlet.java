

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PostServlet
 */
@WebServlet("/PostServlet")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 1. request 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 2. data 꺼내기
		// 3. data 처리
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		
		// 4. response 인코딩
		response.setContentType("text/html; charset=UTF-8");
		// 5. 응답 메세지 작성 
		PrintWriter out = response.getWriter().append("Served at: ").append(request.getContextPath());
		
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>Post Servlet 방식</h1>");
		out.println("<h3>id : "+id+"</h3>");
		out.println("<h3>pwd : "+pwd+"</h3>");
		out.println("<h3>email : "+email+"</h3>");
		out.println("</body>");
		out.println("</html>");
	}

}
