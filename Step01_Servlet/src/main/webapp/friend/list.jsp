<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		//친구 목록 (sample data) 이라고 가정하자
		List<String> names = new ArrayList<>();
		names.add("김구라");
		names.add("해골");
		names.add("원숭이");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/friend/list.jsp</title>
</head>
<body>
	<ul>
	<%
		for(String tmp:names){
			out.println("<li>"+tmp+"</li>");
		}
	%>
	</ul>
	
	<ul>
		<%for(String tmp:names){ %>
			<li><%=tmp %></li>
		<%} %>
	</ul>
</body>
</html>