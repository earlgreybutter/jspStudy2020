<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id="mMgr" class="member.MemberMgr"/>
    <jsp:useBean id="mBean" class="member.MemberBean"/>
    <jsp:setProperty name="mBean" property="*"/>
    <%
    boolean result = mMgr.updateMember(mBean);
    if(result){
    %>
    <script>
    	alert("회원정보를 수정하였습니다.");
    	location.href="../template/main.jsp";
    </script>
    <%
    }else{
    %>
    <script>
    	alert("회원정보 수정에 실패하였습니다.");
    	history.back();
    </script>
    <%
    }
    %>
