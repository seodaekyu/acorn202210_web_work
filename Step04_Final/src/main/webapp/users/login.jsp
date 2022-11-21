<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   // 1. 폼 전송되는 아이디, 비밀번호 읽어오기
   request.setCharacterEncoding("utf-8");
   String id = request.getParameter("id");
   String pwd = request.getParameter("pwd");

   UsersDto dto = new UsersDto();
   dto.setId(id);
   dto.setPwd(pwd);
   // 2. DB에 실제로 존재하는 맞는 정보인지 확인한다.(맞는 정보이면 로그인처리 한다.)
   boolean isValid= UsersDao.getInstance().isValid(dto);
   if(isValid){
	  //session scope에 id라는 키 값으로 id 저장
      session.setAttribute("id", id);
   }
   
   // 3. 응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
   <div class="container">
      <%if(isValid) {%>
         <p class="alert alert-success">
            <strong><%=dto.getId() %></strong> 님 로그인되었습니다.
            <a href="${pageContext.request.contextPath }/index.jsp">홈으로 가기</a>
         </p>
      <%}else{ %>
         <p class="alert alert-danger">
            로그인 실패
            <a href="loginform.jsp">다시 로그인 하기</a>            
         </p>
      <%} %>
   </div>
</body>
</html>