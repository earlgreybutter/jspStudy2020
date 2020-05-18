package board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

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
		ServletOutputStream out = response.getOutputStream();
		out.print("<script>");
		out.print("parent.content.location.href='/chapter17/board/list.jsp'");
		out.print("</script>");
	}

}
