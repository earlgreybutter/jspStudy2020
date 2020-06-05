package my.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.board.BoardDBBean;
import my.board.BoardDataBean;

public class UpdateProAction implements CommandAction{
	
	public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {

		req.setCharacterEncoding("UTF-8");
		String pageNum = req.getParameter("pageNum");
		
		BoardDataBean article = new BoardDataBean();
		article.setNum(Integer.parseInt(req.getParameter("num")));
		article.setWriter(req.getParameter("writer"));
		article.setEmail(req.getParameter("email"));
		article.setSubject(req.getParameter("subject"));
		article.setContent(req.getParameter("content"));
		article.setPasswd(req.getParameter("passwd"));
		
		BoardDBBean dbPro = BoardDBBean.getInstance();
		int check = dbPro.updateArticle(article);
		
		req.setAttribute("pageNum", new Integer(check));
		req.setAttribute("check", new Integer(check));
	
		return "updatePro.jsp";
	}	
}
