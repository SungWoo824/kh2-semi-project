package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.MemberDao;

@WebServlet(urlPatterns = "/member/exit.do")
public class MemberExitServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			String id = (String) req.getAttribute("id");
			
			MemberDao dao = new MemberDao();
			
			session.removeAttribute("id");
			session.removeAttribute("grade");
			
			dao.exit(id);
			resp.sendRedirect(req.getContextPath()+ "index.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
