package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * @WebServlet("/test/save") 어노테이션 설정 대신에 /WEB-INF/web.xml 문서에 아래의 설정으로 대체가능
 * 
 * <!-- 서블릿이 어디 있는지 알리면서 이름 부여하기 (서블릿 정의) -->
 * <servlet>
 * 	<servlet-name>saveServlet</servlet-name>
 * 	<servlet-class>test.servlet.SaveServlet</servlet-class>
 * </servlet>
 * 
 * <!-- 어떤 이름의 서블릿이 어떤 패턴의 요청을 처리할지 지정하기 (서블릿 맵핑) -->
 * <servlet-mapping>
 * 	<servlet-name>saveServlet</servlet-name>
 * 	<url-pattern>/test/save</url-pattern>
 * </servlet-mapping>
 */
public class SaveServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//폼 전송되는 닉네임을 읽어와서
		req.setCharacterEncoding("utf-8");
		String nick = req.getParameter("nick");
		//session scope 에 "nick" 이라는 키 값으로 저장하기
		HttpSession session = req.getSession(); //HttpServletRequest 객체의 메소드를 이용해서 HttpSession 얻어내기
		session.setAttribute("nick", nick);
		session.setMaxInactiveInterval(60);
		
		//응답을 위임하기
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/test/save.jsp");
		rd.forward(req, resp);
	}
}
