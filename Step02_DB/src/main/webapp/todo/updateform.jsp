
<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. GET 방식 파라미터로 전달되는 수정할 회원의 번호(primary key)를 읽어온다.
	int num = Integer.parseInt(request.getParameter("num"));
	//2. TodoDao 객체를 이용해서 회원 한명의 정보를 얻어온다.
	TodoDto dto = TodoDao.getInstance().getData(num);
	//3. 수정 할 회원의 정보를 수정 폼에 출력해서 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/updateform.jsp</title>
</head>
<body>
	<div class="container">
		<h1>할일 수정 폼</h1>
		<form action="update.jsp" method="post">
			<div>
				<label for="num">번호</label>
				<input type="text" name="num" id=num value="<%=dto.getNum() %>" readonly />
			</div>
			<div>
				<label for="content">할일</label>
				<input type="text" name="content" id="content" value="<%=dto.getContent() %>"/>
			</div>
			<input type="hidden" name="regdate" value="<%=dto.getRegdate()%>"/>
			<div>
				<label for="regdate">날짜</label>
				<input type="text" name="regdate" id="regdate" value="<%=dto.getRegdate() %>" disabled />
			</div>
			<button type="submit">수정확인</button>
			<button type="reset">취소</button>
		</form>
	</div>
</body>
</html>