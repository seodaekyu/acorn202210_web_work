<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /include/navbar.jsp 페이지의 내용입니다. --%>
<%
	//navbar.jsp 페이지가 어디에 include 되었는지 읽어와보기
	String thisPage=request.getParameter("thisPage"); // "index" | "study" | "game"
	String id = (String)session.getAttribute("id");
%>
<nav class = "navbar navbar-expand-md navbar-dark" style="background-color:skyblue;">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/">
			<img src="https://cdn.pixabay.com/photo/2016/06/01/06/26/open-book-1428428__340.jpg" alt="" width="60" height="40" class="d-inline-block align-text-center">	
			나의 개발노트
		</a>
		
	 	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
	    </button>
	    <!-- 화면이 좁으면 숨겨지는 요소들은 아래의 div안에 넣어두면 된다. -->
	    <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
	    	<ul class="navbar-nav">
	    		<li class="nav-item">
	    			<a class="nav-link <%= thisPage.equals("member") ? "active" : "" %>" href="${pageContext.request.contextPath }/private/install.jsp">설치</a>
	    		</li>
				<li class="nav-item dropdown">
				    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">코딩</a>
				    <ul class="dropdown-menu">
				      	<li><a class="dropdown-item" href="${pageContext.request.contextPath }/daily/private/test.jsp">코딩예제</a></li>
				      	<li><a class="dropdown-item" href="${pageContext.request.contextPath }/daily/private/game.jsp">코딩게임</a></li>
				    </ul>
				</li>
	    		<li class="nav-item">
	    			<a class="nav-link" href="${pageContext.request.contextPath }/daily/list.jsp">메모장</a>
	    		</li>
	    		<li class="nav-item">
	    			<a class="nav-link" href="${pageContext.request.contextPath }/file/list.jsp">자료실</a>
	    		</li>
	    		
	    	</ul>
	    	<ul class="navbar-nav">
	    		<%if(id!=null){ %>
					<p>
						<a href="${pageContext.request.contextPath }/users/private/info.jsp"><%=id %></a> 님 로그인 중..
						<a href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a>
					</p>
				<%}else{ %>
		    		<li class="nav-item">
		    			<a class="nav-link" href="${pageContext.request.contextPath }/users/signup_form.jsp">회원가입</a>
		    		</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath }/users/loginform.jsp">로그인</a>
					</li>
				<%} %>
	    	</ul>
	    </div>
	</div>
</nav>