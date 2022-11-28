<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 삭제할 글의 번호를 읽어온다.
	int num = Integer.parseInt(request.getParameter("num"));
	
	//글의 작성자가 로그인된 아이디와 같은지 확인해보기
	String id = (String)session.getAttribute("id");
	String writer = CafeDao.getInstance().getData(num).getWriter();
	
	//글 작성자가 로그인된 아이디와 다르다면
	if(!writer.equals(id)){
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "타인의 글을 삭제할 수 없습니다.");
		return; //메소드를 여기서 끝내기
	}
	
	//2. DB에서 삭제한다.
	boolean isSuccess = CafeDao.getInstance().delete(num);

	//3. 응답
	String cPath = request.getContextPath();
	
	if(isSuccess){
		response.sendRedirect(cPath+"/cafe/list.jsp"); //파일 목록보기로 다시 리다이렉트로 이동시킨다.
	}
%>