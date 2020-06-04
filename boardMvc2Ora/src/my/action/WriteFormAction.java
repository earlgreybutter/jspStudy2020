package my.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteFormAction implements CommandAction{

	public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable{
		
		// 제목글과 답변글 구분
		int num = 0, ref = 1, re_step=0, re_level=0;
		
		try {
			if(req.getParameter("num")!=null) {
				num = Integer.parseInt(req.getParameter("num"));
				ref = Integer.parseInt(req.getParameter("ref"));
				re_step = Integer.parseInt(req.getParameter("re_step"));
				re_level = Integer.parseInt(req.getParameter("re_level"));
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		req.setAttribute("num", new Integer(num));
		req.setAttribute("ref", new Integer(ref));
		req.setAttribute("re_step", new Integer(re_step));
		req.setAttribute("re_level", new Integer(re_level));
		
		return "writeForm.jsp";
	}
}
