<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	FileDto dto = FileDao.getInstance().getData(num);
	FileDao.getInstance().addViewCount(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/detail.jsp</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<body>
	
	<%-- /include/navbar.jsp 포함시키기 --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>

	<div class="container">
		<h3>글 상세 보기</h3>
		<table>
			<tr>
				<th>번호</th>
				<td><%=dto.getNum() %></td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td><%=dto.getWriter() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=dto.getTitle() %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=dto.getViewCount() %></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><%=dto.getRegdate() %></td>
			</tr>
			<%--
				textarea 를 이용해서 문자열을 입력 받으면 tab 기호, 공백, 개행기호도 같이 입력 받는다.
				해당 기호를 재현하는 세가지 방법
				1. textarea 에 출력하기
				2. <pre></pre> 요소 안에 출력하기
				3. 개행 기호를 찾아서 <br> 로 대체하기
			 --%>
			
		</table>
		<%
			//로그인된 아이디가 있으면 읽어온다.(null일 수도 있다.)
			String id = (String)session.getAttribute("id");
		%>
		<%-- 만일 글 작성자가 로그인된 아이디와 같다면 수정, 삭제 링크를 제공한다. --%>
        <%if(dto.getWriter().equals(id)){ %>
	         <a href="private/updateform.jsp?num=<%=dto.getNum()%>">수정</a>
	         <a href="javascript:" onclick="deleteConfirm()">삭제</a>
	         <a href="list.jsp">목록보기</a>
	         <script>
	            function deleteConfirm(){
	               const isDelete=confirm("이 글을 삭제 하겠습니까?");
	               if(isDelete){
	                  location.href="delete.jsp?num=<%=dto.getNum()%>";
	               }
	            }
         	</script>
      	<%} %>
	
	<%-- /include/footer.jsp 페이지를 포함 시켜서 이부분은 footer.jsp 페이지가 응답하도록 한다. --%>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	
</body>
</html>