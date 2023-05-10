<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./ssi.jsp" %>
    
<!-- 본문 시작 memberProc.jsp-->

<h3>아이디 찾기 결과</h3>
<br><br>
<% 
	String mname = request.getParameter("mname").trim();
	String email = request.getParameter("email").trim();

	dto.setMname(mname);
	dto.setEmail(email);

	boolean flag=dao.findID(dto);
	
	if(flag==false){
		out.println("<p>등록되어 있지 않은 회원입니다</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else{
		String message="";
		message += "아이디/임시 비밀번호가 이메일로 전송되었습니다\\n";
		message += "임시 비밀번호는 로그인 후 회원정보수정에서 수정하시기 바랍니다";
		out.println("<script>");
		out.println("	alert('" + message + "');");
		out.println("	location.href='loginForm.jsp'");
		out.println("</script>");

	}//if end	
%>
<!-- 본문 끝 -->