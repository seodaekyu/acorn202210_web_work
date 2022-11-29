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
			<img src="https://img.icons8.com/carbon-copy/100/null/a.png"/" alt="" width="60" height="40" class="d-inline-block align-text-center">	
			Acorn
		</a>
		
	 	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
	    </button>
	    <!-- 화면이 좁으면 숨겨지는 요소들은 아래의 div안에 넣어두면 된다. -->
	    <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
	    	<ul class="navbar-nav">
	    		<li class="nav-item">
	    			<a class="nav-link <%= thisPage.equals("member") ? "active" : "" %>" href="${pageContext.request.contextPath }/private/study.jsp">공부방</a>
	    		</li>
	    		<li class="nav-item">
	    			<a class="nav-link" href="${pageContext.request.contextPath }/private/game.jsp">놀이방</a>
	    		</li>
	    		<li class="nav-item">
	    			<a class="nav-link" href="${pageContext.request.contextPath }/cafe/list.jsp">게시판</a>
	    		</li>
	    		<li class="nav-item">
	    			<a class="nav-link" href="${pageContext.request.contextPath }/file/list.jsp">자료실</a>
	    		</li>
	    	</ul>
    		<form class="d-flex" role="search">
		        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
		        <button class="btn btn-outline-success" type="submit">Search</button>
		    </form>
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