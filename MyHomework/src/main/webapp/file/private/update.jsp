<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송되는 수정할 글의 정보를 얻오온다.
	int num = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	//FileDto 객체에 담고
	FileDto dto = new FileDto();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	//DB 에 수정반영
	boolean isSuccess = FileDao.getInstance().update(dto);
	//응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/update.jsp</title>
</head>
<body>
	<div class="container">
      <%if(isSuccess){ %>
         <p>
             수정 했습니다.
            <a href="${pageContext.request.contextPath }/file/detail.jsp?num=<%=num%>">확인</a>
         </p>
      <%}else{ %>
         <p>
            수정 실패했습니다.
            <a href="updateform.jsp?num=<%=dto.getNum() %>">다시 수정하러 가기</a>
         </p>
      <%} %>
   </div>
</body>
</html>