

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetServlet
 */
@WebServlet("/GetServlet")
public class GetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String msg = request.getParameter("msg");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter().append("Served at: ").append(request.getContextPath());
		
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>Get Servlet방식</h1>");
		out.println("<h2>msg : "+msg+"</h2>");
		out.println("</body>");
		out.println("</html>");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// super.doPost(req, resp);
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		// 한글 encoding과  setting을 가장 먼저하자
		String msg = request.getParameter("msg");
		
		PrintWriter out = response.getWriter().append("Served at: ").append(request.getContextPath());
		
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>Get Servlet방식</h1>");
		out.println("<h2>msg : "+msg+"</h2>");
		out.println("</body>");
		out.println("</html>");
		
	}
}
