<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청 파라미터 추출
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	//추출한 문자열을 콘솔 창에 출력
	System.out.println(name+" | "+addr);
	
	//응답
%>
{"isSuccess":true}