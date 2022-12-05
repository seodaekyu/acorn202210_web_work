<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인된 아이디를 읽어온다.(로그인을 하지 않았으면 null 이다.)
	String id = (String)session.getAttribute("id");
	
	//한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT = 5;
	//하단 페이지를 몇개씩 표시 할 것인지
	final int PAGE_DISPLAY_COUNT = 5;

	//보여줄 페이지의 번호를 일단 1이라고 초기 값을 지정
	int pageNum = 1;
	
	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	String strPageNum = request.getParameter("pageNum");
	//만일 페이지 번호가 파라미터로 넘어 온다면
	if(strPageNum != null){
		//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		pageNum = Integer.parseInt(strPageNum);
	}
	
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum = 1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum = pageNum*PAGE_ROW_COUNT;
	
	//하단 시작 페이지 번호
	int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//하단 끝 페이지 번호
	int endPageNum = startPageNum+PAGE_DISPLAY_COUNT-1;
	//전체 글의 갯수
	int totalRow = FileDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
	if(endPageNum > totalPageCount){
		endPageNum = totalPageCount; //보정해준다.
	}
	
	//FileDto 객체를 생성해서
	FileDto dto = new FileDto();
	
	//위에서 계산된 startRowNum, endRowNum을 담아서
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//파일 목록을 select 해 온다.
	List<FileDto> list = FileDao.getInstance().getList(dto);
	
	//응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.jsp</title>
<style>
	.icon-link{
		font-size: 24px;
		
	}
	/* transform 을 적용할때 0.4초 동안 변화되도록 적용해라 */
	.icon-link svg{
		transition: transform 0.4s ease-out;
	}
	/* 원본 크기의 1.2배로 확대해라 */
	.icon-link svg:hover{
		transform: scale(1.2);
	}
</style>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<body>
	<%-- /include/navbar.jsp 포함시키기 --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>

	<div class="container">
		<a class="icon-link" href="${pageContext.request.contextPath }/file/private/upload_form.jsp">
			<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-upload" viewBox="0 0 16 16">
			  <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
			  <path d="M7.646 1.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 2.707V11.5a.5.5 0 0 1-1 0V2.707L5.354 4.854a.5.5 0 1 1-.708-.708l3-3z"/>
			</svg>
			<span class="visually-hidden">업로드</span>
		</a>
		
		<h3>자료실 목록</h3>
		<table class="table table-striped">
			<thead class="table-dark">
				<tr>
					<th>번호</th>
					<th>글쓴이</th>
					<th>제목</th>
					<th>파일명</th>
					<th>등록일</th>
					<th>크기</th>
				</tr>
			</thead>
			<tbody>
			<%for(FileDto tmp:list) {%>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getWriter() %></td>
					<td>
						<a href="detail.jsp?num=<%=tmp.getNum() %>"><%=tmp.getTitle() %></a>
					</td>
					<td><%=tmp.getOrgFileName() %></td>
					<td><%=tmp.getRegdate() %></td>
					<td><%=tmp.getFileSize() %></td>
					
				</tr>
			<%} %>
			</tbody>
		</table>
		<nav>
			<ul class="pagination justify-content-center">
				<%--
					startPageNum이 1이 아닌 경우에만 Prev 링크를 제공한다.
				 --%>
				<%if(startPageNum != 1){%>
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1 %>">Prev</a>
					</li>
				<%} %>
				
				<%for(int i=startPageNum; i<=endPageNum; i++){ %>
					<li class="page-item <%=pageNum == i ? "active" : "" %>">
						<a class="page-link" href="list.jsp?pageNum=<%=i %>"><%=i %></a>
					</li>
				<%} %>
				
				<%--
					마지막 페이지 번호가 전체 페이지의 갯수보다 적으면 Next 링크를 제공한다.
				 --%>
				 <%if(endPageNum < totalPageCount){ %>
				 	<li class="page-item">
				 		<a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1 %>">Next</a>
				 	</li>
				 <%} %>
			</ul>
		</nav>
	</div>
	
	<%-- /include/footer.jsp 페이지를 포함 시켜서 이부분은 footer.jsp 페이지가 응답하도록 한다. --%>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>