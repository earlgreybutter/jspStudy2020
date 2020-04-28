

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
		
		// 1. request ���ڵ�
		request.setCharacterEncoding("UTF-8");
		
		// 2. data ������
		// 3. data ó��
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		
		// 4. response ���ڵ�
		response.setContentType("text/html; charset=UTF-8");
		// 5. ���� �޼��� �ۼ� 
		PrintWriter out = response.getWriter().append("Served at: ").append(request.getContextPath());
		
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>Post Servlet ���</h1>");
		out.println("<h3>id : "+id+"</h3>");
		out.println("<h3>pwd : "+pwd+"</h3>");
		out.println("<h3>email : "+email+"</h3>");
		out.println("</body>");
		out.println("</html>");
	}

}
