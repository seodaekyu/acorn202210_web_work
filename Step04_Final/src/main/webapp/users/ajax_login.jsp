<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	// 아이디, 비밀번호가 맞는 정보인지 확인한다.
	boolean isValid = UsersDao.getInstance().isValid(dto);
	
%>
{"isValid":<%=isValid %>}