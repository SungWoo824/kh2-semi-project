package semi.servlet.room_info;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.RoomDao;
import beans.RoomDto;

@WebServlet(urlPatterns = "/mypage/regist/only_room_info_regist.do")
public class OnlyRoomInfoRegistServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			req.setCharacterEncoding("UTF-8");
			
			RoomDto dto = new RoomDto();
			RoomDao dao = new RoomDao();
			
			
			int hostel_no = Integer.parseInt(req.getParameter("hostel_no"));
			
			dto.setHostel_no(hostel_no);
			dto.setRoom_price(Integer.parseInt(req.getParameter("room_price")));
			dto.setRoom_standard_people(Integer.parseInt(req.getParameter("room_standard_people")));
			dto.setRoom_max_people(Integer.parseInt(req.getParameter("room_max_people")));
			dto.setRoom_bed(Integer.parseInt(req.getParameter("room_bed")));
			dto.setRoom_bath(Integer.parseInt(req.getParameter("room_bath")));
			dto.setRoom_spa(req.getParameter("room_spa"));
			dto.setRoom_cook(req.getParameter("room_cook"));
			dto.setRoom_parking(req.getParameter("room_parking"));
			dto.setRoom_pet(req.getParameter("room_pet"));
			dto.setRoom_content(req.getParameter("room_content"));
			dto.setRoom_breakfast(req.getParameter("room_breakfast"));
			dto.setRoom_basic(req.getParameter("room_basic"));
			dto.setRoom_tv(req.getParameter("room_tv"));
			dto.setRoom_dry(req.getParameter("room_dry"));
			dto.setRoom_cool(req.getParameter("room_cool"));
			dto.setRoom_hot(req.getParameter("room_hot"));
			dto.setRoom_name(req.getParameter("room_name"));
			dto.setStart_hosting(req.getParameter("start_hosting"));
			dto.setFinish_hosting(req.getParameter("finish_hosting"));
			
			dao.regist(dto);
			
			
//			[3] 출력(이동)			
			resp.sendRedirect(req.getContextPath()+"/mypage/regist/list.jsp");
			
		}
		
		catch(Exception e) {
			e.getStackTrace();
			resp.sendError(500);
		}
	}

}
