package semi.servlet.grandmaster;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.MemberDao;

@WebServlet(urlPatterns = "/grandmaster/master_member_grade_change.do")
public class MasterMemberGradeChange extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			MemberDao mdao = new MemberDao();
			String member_id =req.getParameter("member_id");
			String member_grade = req.getParameter("member_grade");
			
			mdao.memberGradeChange(member_id, member_grade);
			
			resp.sendRedirect("master_member_list");
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
