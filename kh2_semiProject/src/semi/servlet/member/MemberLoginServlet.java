package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.MemberDao;
import beans.MemberDto;
@WebServlet(urlPatterns = "/member/login.do")
public class MemberLoginServlet extends HttpServlet{
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			try {
				req.setCharacterEncoding("UTF-8");
				
				String id = req.getParameter("member_id");
				String pw = req.getParameter("member_pw");
				
				MemberDao dao = new MemberDao();
				boolean result = dao.login(id, pw);
				
				if(result) {
				
					resp.sendRedirect(req.getContextPath());
				}else {
					resp.sendRedirect("login.jsp?error=");
				}
				
			} 
			catch (Exception e) {
				e.printStackTrace();
				resp.sendError(500);
			}
		}
}
			
			
					
