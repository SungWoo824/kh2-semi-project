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

			String region_name = req.getParameter("region_name");
			String city_name = req.getParameter("city_name");

			HostelDto dto = new HostelDto();
			HostelDao dao = new HostelDao();

			int region_no = dao.getRegionNo(region_name, city_name);
			
			String member_id = (String) req.getSession().getAttribute("id");
			int owner_no = dao.getOwnerNo(member_id);

			dto.setOwner_no(owner_no);
			dto.setRegion_no(region_no);
			dto.setHostel_name(req.getParameter("hostel_name"));
			dto.setHostel_phone(req.getParameter("hostel_phone"));
			dto.setHostel_detail_addr(req.getParameter("hostel_detail_addr"));
			dto.setHostel_latitude(req.getParameter("hostel_latitude"));
			dto.setHostel_longitude(req.getParameter("hostel_longitude"));
			dto.setHostel_content(req.getParameter("hostel_content"));
			dto.setHostel_kind_name(req.getParameter("hostel_kind_name"));

			dao.regist(dto);

//			[3] 출력(이동)
			req.getSession().setAttribute("hostel_name", dto.getHostel_name());
			resp.sendRedirect("2regist_room_info.jsp");
			
		}
		catch (Exception e) {

			e.getStackTrace();
			resp.sendError(500);

		}
	}
}