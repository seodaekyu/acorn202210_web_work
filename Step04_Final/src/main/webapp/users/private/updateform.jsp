<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //session scope 에 저장된 아이디를 이용해서 
   String id=(String)session.getAttribute("id");
   //수정할 회원의 정보를 얻어온다.
   UsersDto dto=UsersDao.getInstance().getData(id);
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/updateform.jsp</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<body>
   <div class="container">
      <h3>회원 가입 수정 폼 입니다.</h3>
      <form action="update.jsp" method="post">
         <div>
            <label class="form-label" for="id">아이디</label>
            <input class="form-control" type="text" id="id" value="<%=dto.getId() %>" disabled/>
         </div>
         <div>
            <label class="form-label" for="email">이메일</label>
            <input class="form-control" type="text" id="email" name="email" value="<%=dto.getEmail()%>"/>
         </div>
         <button class="btn btn-primary" type="submit">수정확인</button>
         <button class="btn btn-primary" type="reset">취소</button>
      </form>      
   </div>
</body>
</html>