package ch15;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardPostServlet
 */

// 서블릿은 webcontent 아래 문서가 아니므로 /chapter15의 영향이 없다 
// java파일과 jsp파일은  mapping할 때 servlet하고는 다름 
@WebServlet("/boardPost")
public class BoardPostServlet extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		BoardMgr bMgr = new BoardMgr();
		bMgr.insertBoard(request);
		response.sendRedirect("list.jsp");
	}

}
