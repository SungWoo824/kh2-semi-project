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
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException{
			try {
			req.setCharacterEncoding("UTF-8");
			MemberDto dto = new MemberDto();
			
			dto.setId(req.getParameter("member_id"));
			dto.setPw(req.getParameter("member_pw"));
			dto.setName(req.getParameter("member_name"));
			dto.setPhone(req.getParameter("member_phone"));
			dto.setEmail(req.getParameter("member_email"));
			
			MemberDao dao = new MemberDao();
			dao.regist(dto);
			resp.sendRedirect("regist_success.jsp");
			
			} catch (Exception e) {
				e.printStackTrace();
				resp.sendError(500);
			}	
	}
}
			
			
			
			
			
				
				

