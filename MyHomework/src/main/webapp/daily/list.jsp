<%@page import="test.daily.dao.DailyDao"%>
<%@page import="test.daily.dto.DailyDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT = 5;
	//하단 페이지를 몇개씩 표시 할것인지
	final int PAGE_DISPLAY_COUNT = 5;
	
	//보여줄 페이지의 번호를 1이라고 초기 값 설정
	int pageNum = 1;
	
	//페이지 번호가 파라미터로 전달되는지 읽어와본다.
	String strPageNum = request.getParameter("pageNum");
	
	//만일 페이지 번호가 파라미터로 넘어온다면
	if(strPageNum != null){
		pageNum = Integer.parseInt(strPageNum);
	}
	
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum = 1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUN
	int endRowNum = pageNum*PAGE_ROW_COUNT;
	
	//하단 시작 페이지 번호
	int startPageNum = 1+ ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//하단 끝 페이지 번호
	int endPageNum = startPageNum+ PAGE_DISPLAY_COUNT-1;
	//전체 글의 갯수
	int totalRow = DailyDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//끝 페이지 번호가 이미 전체 페이지 개수보다 크게 계산되었다면 잘못된 값이다.
	if(endPageNum > totalPageCount){
		endPageNum = totalPageCount; //보정해준다
	}
	
	//DailyDto 객체를 생성해서
	DailyDto dto = new DailyDto();
	
	//위에서 계산된 startRowNum, endRowNum 을 담아서
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//DailyDto 를 인자로 전달해서 글 목록을 얻어오기
	List<DailyDto> list = DailyDao.getInstance().getList(dto);
	
	//응답하기
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/daily/list.jsp</title>
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
		<a class="icon-link" href="${pageContext.request.contextPath }/daily/private/insertform.jsp">
			<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-journal-plus" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M8 5.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V10a.5.5 0 0 1-1 0V8.5H6a.5.5 0 0 1 0-1h1.5V6a.5.5 0 0 1 .5-.5z"/>
			  <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"/>
			  <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"/>
			</svg>
			<span class="visually-hidden">업로드</span>
		</a>
		
		<h3>메모 목록</h3>
		<table class="table table-striped">
			<thead class="table-dark">
				<tr>
					<th>번호</th>
					<th>글쓴이</th>
					<th>제목</th>
					<th>등록일</th>
					<th>조회수</th>
					<th>추천수</th>
				</tr>
			</thead>
			<tbody>
			<%for(DailyDto tmp:list) {%>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getWriter() %></td>
					<td>
						<a href="detail.jsp?num=<%=tmp.getNum() %>"><%=tmp.getTitle() %></a>
					</td>
					<td><%=tmp.getRegdate() %></td>
					<td><%=tmp.getViewCount() %></td>
					<td><%=tmp.getLikeCount() %></td>
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