<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String msg = request.getParameter("msg"); 

System.out.println("msg:"+msg);

%>
    
<html>
<head>
<meta charset="UTF-8">
<title>메세지 전송 결과 페이지</title>
</head>
<body>
	<p>메세지 잘 받았어 클라이언트야!</p>
</body>
</html>