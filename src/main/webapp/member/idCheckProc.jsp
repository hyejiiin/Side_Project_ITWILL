<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>idCheckProc.jsp</title>
</head>
<body>
	<div style="text-align: center">
		<h3>아이디 중복확인 결과</h3>
<%
	String mid=request.getParameter("mid").trim();
	int cnt=dao.duplecateID(mid);
	out.println("입력 ID : <strong>" + mid + "</strong>");
	
	if(cnt==0){
		out.println("<p>사용 가능한 아이디 입니다.</p>");
%>
	<!-- 사용 가능한 id를 부모창에 전달 -->
	<a href="javascript:apply('<%=mid%>')">[적용]</a>
	<script>
		function apply(mid) {
			//alert(id);
			opener.document.memfrm.mid.value=mid;
			window.close();
		}//apply() end
	</script>

<%
	}else{
		out.println("<p style='color:red'>해당 아이디는 사용할 수 없습니다.</p>");
	}//if end
%>
	<hr>
	<a href="javascript:history.back()">[다시검색]</a>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="javascript:window.close()">[창닫기]</a>
	
	</div>

</body>
</html>