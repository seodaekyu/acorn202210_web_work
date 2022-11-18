<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//GET 방식 파라미터로 전달되는 삭제할 회원의 번호를 읽어와서 숫자로 바로 바꿔준다. 
	int num=Integer.parseInt(request.getParameter("num"));
	//MemberDao 객체를 이용해서 삭제하기
	MemberDao.getInstance().delete(num);
	//2. 응답하기 ( 무슨응답을 하면 적절할까? )
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/delete2.jsp</title>
</head>
<body>
	<script>
		alert("<%=num%> 번 회원을 삭제 했습니다.");
		//javascript를 활용한 페이지 이동(웹브라우저가 새로운 경로로 요청을 다시 하도록 한다.)
		location.href="${pageContext.request.contextPath }/member/list.jsp";
	</script>
</body>
</html>