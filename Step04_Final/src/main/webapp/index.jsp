<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>

	<%-- 페이지를 include 시킬때는 WEB-INF 폴더에 있는 페이지도 include 가능하다. --%>
	<jsp:include page="/WEB-INF/include/navbar.jsp"/>
	
	<div class="container">
		<%--
			1. sessinScope.id != null
			2. id != null
			3. id ne null
			4. not empty id
			
			el 에서 1, 2, 3, 4 는 모두 같은 결과이다.
		 --%>
		
		<c:choose>
			<c:when test="${ !empty id }">
				<p>
					<a href="${pageContext.request.contextPath }/users/private/info.jsp">${id }</a> 님 로그인 중..
					<a href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a>
				</p>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath }/users/loginform.jsp">로그인</a>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div class="container">	
		<h1>인덱스 페이지입니다.</h1>
		<ul>
			<li><a href="my_app/index.html">React 테스트</a></li>
		</ul>
		
	</div>
	
	
<%-- /include/footer.jsp 페이지를 포함 시켜서 이부분은 footer.jsp 페이지가 응답하도록 한다. --%>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>