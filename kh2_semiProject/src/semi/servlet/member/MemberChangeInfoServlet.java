package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTML;

import beans.MemberDao;
import beans.MemberDto;
@WebServlet(urlPatterns = "/member/info.do")
public class MemberChangeInfoServlet extends HttpServlet{

	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String id = (String)req.getSession().getAttribute("id");
			
			req.setCharacterEncoding("UTF-8");
			
			
			MemberDto dto = new MemberDto();
			String newpw=req.getParameter("newpw");
		dto.setId(id);
			dto.setPw(req.getParameter("member_pw"));
			
		
			dto.setBirthday(req.getParameter("member_birthday"));
			dto.setPhone(req.getParameter("member_phone"));
			dto.setEmail(req.getParameter("member_email"));
			
			MemberDao dao = new MemberDao();
			dao.ci(dto,newpw);
			resp.sendRedirect("regist_success.jsp");
			
		} catch (Exception e) {
			
			
			e.printStackTrace();
			resp.sendRedirect("regist_fail.jsp");
			
			
		}
	}
	
	
	
	
	
}
