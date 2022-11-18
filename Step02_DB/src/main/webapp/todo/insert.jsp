<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송되는 할 일을 읽어와서
	request.setCharacterEncoding("utf-8");
	String content = request.getParameter("content");
	//TodoDto에 담고
	TodoDto dto = new TodoDto();
	dto.setContent(content);
	//DB에 저장하고
	boolean isSuccess = TodoDao.getInstance().insert(dto);
	//응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insert.jsp</title>
</head>
<body>
	<div class="container">
		<%if(isSuccess){ %>
			<p>
				<strong><%=content %></strong> 을 추가했습니다.
				<a href="list.jsp">확인</a>
			</p>
		<%}else{ %>
			<p>
				할일 추가 실패!
				<a href="insertform.jsp">다시하기</a>
			</p>
		<%} %>
	</div>
</body>
</html>