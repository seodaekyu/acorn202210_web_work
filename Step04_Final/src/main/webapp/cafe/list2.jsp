<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	int totalRow = CafeDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//끝 페이지 번호가 이미 전체 페이지 개수보다 크게 계산되었다면 잘못된 값이다.
	if(endPageNum > totalPageCount){
		endPageNum = totalPageCount; //보정해준다
	}
	
	//CafeDto 객체를 생성해서
	CafeDto dto = new CafeDto();
	
	//위에서 계산된 startRowNum, endRowNum 을 담아서
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//CafeDto 를 인자로 전달해서 글 목록을 얻어오기
	List<CafeDto> list = CafeDao.getInstance().getList(dto);
	
	// JSTL + EL 을 테스트 하기 위해서 필요한 값을 request 영역에 담기
	// list 라는 키 값으로 request scope에 담기
	request.setAttribute("list", list);
	// 페이징 처리에 필요한 값을 request scope에 담기
	request.setAttribute("pageNum", pageNum);
	request.setAttribute("startPageNum", startPageNum);
	request.setAttribute("endPageNum", endPageNum);
	request.setAttribute("totalPageCount", totalPageCount);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list2.jsp</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<body>
	<div class="container">
		<a class="badge bg-secondary" href="${pageContext.request.contextPath }/cafe/private/insertform.jsp">새 글 작성</a>
		<a class="badge bg-secondary" href="${pageContext.request.contextPath }/index.jsp">돌아가기</a>
		<h3>카페 글 목록</h3>
		<table class="table table-striped">
			<thead class="table-dark">
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list }">
					<tr>
						<td>${tmp.getNum() }</td>
						<td>${tmp.writer }</td>
						<td>
							<a href="detail.jsp?num=${tmp.num }">${tmp.title }</a>
						</td>
						<td>${tmp.viewCount }</td>
						<td>${tmp.regdate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav>
			<ul class="pagination justify-content-center">
				<%--
					startPageNum이 1이 아닌 경우에만 Prev 링크를 제공한다.
				 --%>
				 <c:if test="${startPageNum ne 1 }">
				 	<li class="page-item">
						<a class="page-link" href="list2.jsp?pageNum=${startPageNum-1 }">Prev</a>
					</li>
				 </c:if>
				 <c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
				 	<li class="page-item ${pageNum == i ? 'active' : '' }">
						<a class="page-link" href="list2.jsp?pageNum=${i }">${i }</a>
					</li>	
				 </c:forEach>
				<%--
					마지막 페이지 번호가 전체 페이지의 갯수보다 적으면 Next 링크를 제공한다.
				 --%>
				 <c:if test="${endPageNum lt totalPageCount }">
				 	<li class="page-item">
				 		<a class="page-link" href="list2.jsp?pageNum=${endPageNUm+1 }">Next</a>
				 	</li>
				 </c:if>
			</ul>
		</nav>
	</div>
</body>
</html>