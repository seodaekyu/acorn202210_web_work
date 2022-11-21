<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼 전송되는 아이디, 비밀번호, 이메일 주소를 읽어온다.
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	//2. UsersDto에 담는다.
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	//3. UsersDao를 이용해서 DB에 저장하고
	boolean isSuccess =  UsersDao.getInstance().insert(dto);
	//4. 결과를 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup.jsp</title>
</head>
<body>
	<div class="container">
		<%if(isSuccess) {%>
			<p>
				<strong><%=id %></strong> 님 가입 되었습니다.
				<a href="loginform.jsp">로그인 하러 가기</a>
			</p>
		<%}else{ %>
			<p>
				회원가입 실패!
				<a href="signup_form.jsp">다시 가입하러 가기</a>
			</p>
		<%} %>
	</div>
</body>
</html>