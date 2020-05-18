<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id="pMgr" class="poll.PollMgr"/>
    
    <jsp:useBean id="plBean" class="poll.PollListBean"/>
    <jsp:setProperty property="*" name="plBean"/>
    
    <jsp:useBean id="piBean" class="poll.PollItemBean"/>
    <jsp:setProperty property="*" name="piBean"/>
    
    <%
    String sdate = request.getParameter("sdateY")+"-"+
    				request.getParameter("sdateM")+"-"+
    				request.getParameter("sdateD");
    String edate = request.getParameter("edateY")+"-"+
					request.getParameter("edateM")+"-"+
					request.getParameter("edateD");
    
    plBean.setSdate(sdate);
    plBean.setEdate(edate);
    
    boolean flag = pMgr.insertPoll(plBean, piBean);
    String msg = "설문 추가에 실패하였습니다.";
    String url = "pollInsert.jsp";
    
    if(flag){
    	msg = "설문이 추가되었습니다.";
        url = "pollList.jsp";
    }
    %>
    <script>
    alert("<%=msg%>");
    location.href="<%=url%>";
    </script>
