<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼 전송되는 수정 할 회원의 정보를 읽어온다.
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String content = request.getParameter("content");
	String regdate = request.getParameter("regdate");
	//회원 한명의 정보를 TodoDto 객체에 담는다.
	TodoDto dto = new TodoDto(num, content, regdate);
	//2. TOdoDao 객체를 이용해서 DB에 저장한다.
	boolean isSuccess = TodoDao.getInstance().update(dto);
	//3. 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/update.jsp</title>
</head>
<body>
	<%if(isSuccess){%>
		<script>
			alert("<%=num %> 번 회원의 정보를 수정했습니다.");
			location.href="list.jsp";
		</script>
	<%}else {%> 
		<script>
			alert("수정 실패!")
			location.href="updateform.jsp?num=<%=num %>";
		</script>
	<%}%>
</body>
</html>