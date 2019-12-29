package semi.servlet.hostel;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.HostelDao;
import beans.RoomDao;

@WebServlet(urlPatterns = "/hostel/hostel_delete.do")
public class HostelDeleteServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int hostel_no = Integer.parseInt(req.getParameter("hostel_no"));

			HostelDao hdao = new HostelDao();
			
			hdao.hostel_delete(hostel_no);

			resp.sendRedirect(req.getContextPath()+"/mypage/regist/list.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}