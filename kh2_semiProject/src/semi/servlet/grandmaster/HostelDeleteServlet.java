package semi.servlet.grandmaster;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.HostelDao;

/*
 * 관리자 회원 조회 페이지 리스트 출력 서블릿
 */
@WebServlet(urlPatterns = "/grandmaster/master_hostel_delete.do")
public class HostelDeleteServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HostelDao hdao = new HostelDao();
			int hostel_no =Integer.parseInt(req.getParameter("hostel_no"));
			hdao.hostelDelete(hostel_no);
			
			resp.sendRedirect("master_hostel_list.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	
}
