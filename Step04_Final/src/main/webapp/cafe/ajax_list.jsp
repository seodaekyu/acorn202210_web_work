<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
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
	
	//응답하기
	
%>
[   
   <%for(int i=0;i<list.size(); i++){ 
      CafeDto tmp=list.get(i);%>
      {
         "num":<%=tmp.getNum() %>,
         "writer":"<%=tmp.getWriter()%>",
         "title":"<%=tmp.getTitle() %>",
         "viewCount":<%=tmp.getViewCount() %>,
         "regdate":"<%=tmp.getRegdate() %>"
      }
      <%if(i != list.size()-1){ %><%--배열의 마지막 인덱스만 아니면 , 찍기 --%>
      ,
      <%} %>
   <%} %>
]