package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.MemberDao;
@WebServlet(urlPatterns = "/member/findpw.do")
public class MemberFindPwServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			
			String id = req.getParameter("member_id");
			String name = req.getParameter("member_name");
			String phone = req.getParameter("member_phone");
			
			MemberDao dao = new MemberDao();
			boolean result_pw = dao.find_pw(id, name, phone);
			
			if(result_pw) {
				resp.sendRedirect("change_info.jsp?id=" +id);
			}
			else {
				resp.sendRedirect("find_pw.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
