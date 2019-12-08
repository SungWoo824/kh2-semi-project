package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.MemberDao;
import beans.MemberDto;

@WebServlet (urlPatterns = "/member/regist.do")
public class MemberRegistServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			MemberDao dao = new MemberDao();
			MemberDto dto = new MemberDto();
			
			dto.setId(req.getParameter("id"));
			dto.setPw(req.getParameter("pw"));
			dto.setName(req.getParameter("name"));
			dto.setGrade(req.getParameter("grade"));
			dto.setBirthday(req.getParameter("birthday"));
			dto.setPhone(req.getParameter("phone"));
			dto.setEmail(req.getParameter("email"));
			
			boolean isCheck = dao.regist(dto);
			if(isCheck) {
				resp.sendRedirect("regist_success.jsp?grade="+dto.getGrade());
			} else {
				resp.sendRedirect("regist_fail.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
