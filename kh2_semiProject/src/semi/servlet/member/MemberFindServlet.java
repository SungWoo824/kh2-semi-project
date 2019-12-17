package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.MemberDao;
@WebServlet(urlPatterns = "/member/find.do")
public class MemberFindServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			
			String name = req.getParameter("member_name");
			String birthday = req.getParameter("member_birthday");
			String phone = req.getParameter("member_phone");
			
			MemberDao dao = new MemberDao();
			String result = dao.find(name, birthday, phone);
			
			if(result != null) {
				resp.sendRedirect("find_pw.jsp?id=" +result);
			}
			else {
				resp.sendRedirect("find_id.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
			
			
