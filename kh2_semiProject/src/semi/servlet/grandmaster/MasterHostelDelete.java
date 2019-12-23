package semi.servlet.grandmaster;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.HostelDao;

@WebServlet(urlPatterns = "/grandmaster/master_hostel_delete.do")
public class MasterHostelDelete extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int hostel_no= Integer.parseInt(req.getParameter("hostel_no"));
			HostelDao hdao = new HostelDao();
			hdao.hostelDelete(hostel_no);
			
			resp.sendRedirect("master_hostel_list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
