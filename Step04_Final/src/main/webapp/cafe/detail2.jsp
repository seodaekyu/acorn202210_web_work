<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//자세히 보여줄 글의 번호를 읽어온다.
	int num = Integer.parseInt(request.getParameter("num"));
	//DB 에서 해당 글의 정보를 얻어와서
	CafeDto dto = CafeDao.getInstance().getData(num);
	//응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/detail.jsp</title>
</head>
<body>
	<div class="container">
		<h3>글 상세 보기</h3>
		<table>
			<tr>
				<th>글번호</th>
				<td><%=dto.getNum() %></td>
			</tr>
			<tr>
				<th>작성자</th>
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
			<tr>
				<th>내용</th>
				<td><textarea rows="10" readonly><%=dto.getContent() %></textarea></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><pre><%=dto.getContent() %></pre></td>
			</tr>
		</table>
	</div>
</body>
</html>