package my.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.board.BoardDBBean;

public class DeleteProAction implements CommandAction {
	
	public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
		
		req.setCharacterEncoding("UTF-8");
		
		int num = Integer.parseInt(req.getParameter("num"));
		String pageNum = req.getParameter("pageNum");
		String passwd = req.getParameter("passwd");
		
		BoardDBBean dbPro = BoardDBBean.getInstance();
		int check = dbPro.deleteArticle(num, passwd);
		
		req.setAttribute("pageNum", new Integer(pageNum));
		req.setAttribute("check", new Integer(check));
		
		return "deletePro.jsp";
	}
}
