<%@page import="java.io.File"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 삭제 할 파일 번호를 읽어온다.
	int num = Integer.parseInt(request.getParameter("num"));	
	//2. 해당 파일의 정보를 DB에서 읽어온다.
	FileDto dto = FileDao.getInstance().getData(num);	
	
	//2-1. 삭제 작업을 하기전에 로그인된 id와 writer가 같은지 확인하여 같을 때만 삭제하도록 한다. 
	String id = (String)session.getAttribute("id");
	//2-2. 만일 글 작성자와 로그인된 id가 다르다면
	if(!dto.getWriter().equals(id)){
		//금지된 요청이라고 에러 페이지를 응답한다.
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "타인의 파일을 지울 수 없습니다.");
		return; //메소드를 여기서 종료하기(아래의 코드가 실행이 되지 않도록)
	}
	
	//3. 파일 시스템에서 삭제 한다. (webapp/upload 폴더에서 해당 파일을 삭제)
	String path = application.getRealPath("/upload")+File.separator+dto.getSaveFileName();
	//3-1. 삭제 할 파일의 전체 경로를 이용해서 File 객체 생성 후 해당 파일 삭제하기
	File f = new File(path);
	f.delete();
	//4. DB에서도 해당 파일의 정보를 삭제한다.
	FileDao.getInstance().delete(num);
	//5. 응답하기
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/file/list.jsp"); //파일 목록보기로 다시 리다이렉트로 이동시킨다.
%>
