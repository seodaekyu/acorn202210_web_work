<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//GET 방식 파라미터로 전달되는 삭제할 회원의 번호를 읽어와서 숫자로 바로 바꿔준다.
	int num = Integer.parseInt(request.getParameter("num"));
	//TodoDao 객체를 이용해서 삭제하기
	TodoDao.getInstance().delete(num);
	//redirect 응답하기(특정 경로로 다시 하라고 강요하는 응답)
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/todo/list.jsp");
%>
