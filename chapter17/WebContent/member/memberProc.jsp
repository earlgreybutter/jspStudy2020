<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id="mgr" class="member.MemberMgr"/>
    <jsp:useBean id="bean" class="member.MemberBean"/>
    <jsp:setProperty property="*" name="bean"/>
    <%
    boolean result = mgr.insertMember(bean);
    String msg = "회원가입에 실패하였습니다.";
    String location = "../member/member.jsp";
    
    if(result){
    	msg = "회원가입을 하였습니다.";
    	location = "../member/login.jsp";
    }
    %>
    <script>
    alert("<%=msg%>");
    location.href="<%=location%>";
    </script>
