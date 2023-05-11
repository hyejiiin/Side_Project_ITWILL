<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%@ include file="auth.jsp" %>
	<%@ include file="ssi.jsp" %>
	
	<%@ include file="../header.jsp" %>  
	
        <div class=content style="text-align: center">
		<!-- 본문 시작 loginForm.jsp-->
		
		<h3>L O G I N</h3>
		<br>
		<% if(s_mid.equals("guest") || s_mlevel.equals("F1") || s_passwd.equals("guest") || s_mlevel.equals("guest")) {
			//ID저장 쿠키 확인/////////////////////////////////////////////////////
			Cookie[] cookies=request.getCookies();//사용자 PC에 저장된 모든 쿠키값 가져오기
			String c_mid="";
			if(cookies!=null){//쿠키값들이 존재하는지?
				for(int i=0; i<cookies.length; i++){//모든 쿠키값들 검색
					Cookie cookie=cookies[i];//쿠키 하나씩 가져오기
					if(cookie.getName().equals("c_mid")==true){
						c_mid=cookie.getValue();//쿠키변수값 가져오기				
					}//if end			
				}//for end
			}//if end
			
			//ID저장 쿠키 확인 끝/////////////////////////////////////////////////////
		%>
		<form name="loginfrm" id="loginfrm" method="post" action="loginProc.jsp" onsubmit="return loginCheck()"><!-- myscript.js -->
				<div class="form-field">
					<input type="text" name="mid" id="mid" value="<%=c_mid %>" placeholder="아이디" maxlength="10" required>
				</div>
				<div class="form-field">
					<input type="password" name="passwd" id="passwd" placeholder="비밀번호" maxlength="10" required>
				</div>
		
			<br>
				<label><input type="checkbox" name="c_mid" value="SAVE">&nbsp;&nbsp;ID저장</label>
			<br>
				&nbsp;&nbsp;&nbsp;
				<a href="agreement.jsp">회원가입</a>
				&nbsp;&nbsp;&nbsp;
				<a href="findID.jsp">아이디/비밀번호 찾기</a>
				
			<br>
			<br>
				<input type="submit" value="login" class="btn btn-primary">
		</form>
		<%
		}else{
			//로그인 성공했다면	
			out.println("<strong>"+ s_mid + "</strong>님");
			out.println("<br>");
			out.println("좋은하루 보내세용");
			out.println("<br><br>");
		%>
			<input type='button' value='logout' class='btn btn-warning' onclick="location.href='logout.jsp'">
		
			<br><br>
			<a href='memberModify.jsp?mid=<%=s_mid%>'>[회원정보수정]</a>
			&nbsp;&nbsp;
			<a href='memberWithdraw.jsp?mid=<%=s_mid%>'>[회원탈퇴]</a>
		<%
		}//if end
		%>
        <!-- 본문 끝 -->
        </div>
        
    <%@ include file="../footer.jsp" %>
