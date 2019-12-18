package semi.servlet.hostel;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import beans.HostelDao;
import beans.HostelDto;

@WebServlet(urlPatterns = "/hostel/hostel_regist.do")

public class HostelRegistServlet extends HttpServlet {

	@Override

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			req.setCharacterEncoding("UTF-8");

			HostelDto dto = new HostelDto();

			dto.setHostel_name(req.getParameter("hostel_name"));
			dto.setHostel_phone(req.getParameter("hostel_phone"));
			dto.setHostel_detail_addr(req.getParameter("hostel_detail_addr"));
			dto.setHostel_latitude(req.getParameter("hostel_latitude"));
			dto.setHostel_longitude(req.getParameter("hostel_longitude"));
			dto.setHostel_content(req.getParameter("hostel_content"));
			dto.setHostel_kind_name(req.getParameter("hostel_kind_name"));

			HostelDao dao = new HostelDao();
			dao.regist(dto);

//			[3] 출력(이동)
			resp.sendRedirect("2regist_room_info.jsp");

		}

		catch (Exception e) {
			e.getStackTrace();
			resp.sendError(500);

		}
	}
}