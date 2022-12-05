<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session scope에 id라는 키 값으로 저장된 값이 있는지 확인한다. (없으면 null)
	String id = (String)session.getAttribute("id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<style>
    .carousel-inner > .carousel-item > img{
      /* width: 640px;
      height: 720px; */
    }
  </style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<body>

	<%-- /include/navbar.jsp 포함시키기 --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>

	<div class="container visually-hidden">
		<%if(id!=null){ %>
			<p>
				<a href="${pageContext.request.contextPath }/users/private/info.jsp"><%=id %></a> 님 로그인 중..
				<a href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a>
			</p>
		<%}else{ %>
			<a href="${pageContext.request.contextPath }/users/loginform.jsp">로그인</a>
		<%} %>
	</div>
	<div class="container">	
		<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="false">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
	  </div>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="https://cdn.pixabay.com/photo/2016/11/22/21/26/notebook-1850613__340.jpg" class="d-block w-100" height="800px" alt="...">
	      <div class="carousel-caption d-none d-md-block">
	      </div>
	    </div>
	    <div class="carousel-item">
	      <img src="https://cdn.pixabay.com/photo/2016/11/29/07/21/book-1868068__340.jpg" class="d-block w-100" height="800px" alt="...">
	      <div class="carousel-caption d-none d-md-block">
	      </div>
	    </div>
	    <div class="carousel-item">
	      <img src="https://cdn.pixabay.com/photo/2016/11/29/08/17/bible-1868359__340.jpg" class="d-block w-100" height="800px" alt="...">
	      <div class="carousel-caption d-none d-md-block">
	      </div>
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
</div>	
	<%-- /include/footer.jsp 페이지를 포함 시켜서 이부분은 footer.jsp 페이지가 응답하도록 한다. --%>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>