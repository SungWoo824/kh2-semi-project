package semi.servlet.room_info;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.KakaoPayDao;

@WebServlet(urlPatterns = "/hostel/room_reservation_error.do")
public class RoomReservationErrorServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String tid = (String) req.getSession().getAttribute("tid");
			KakaoPayDao kdao = new KakaoPayDao();
			kdao.kakaoPayCancel(tid);
			
			req.getSession().removeAttribute("roomReservationDto");
			req.getSession().removeAttribute("partner_order_id");
			req.getSession().removeAttribute("partner_user_id");
			resp.sendRedirect("room_reservation_error.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
