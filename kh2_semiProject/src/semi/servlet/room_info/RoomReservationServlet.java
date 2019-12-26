package semi.servlet.room_info;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ReservationDao;
import beans.ReservationDto;

@WebServlet(urlPatterns = "/hostel/room_reservation.do")
public class RoomReservationServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			ReservationDao rdao = new ReservationDao();
			ReservationDto rdto = new ReservationDto();
			
			rdto.setRoom_no(Integer.parseInt(req.getParameter("room_no")));
			rdto.setCustomer_no(Integer.parseInt(req.getParameter("customer_no")));
			rdto.setCustomer_count(Integer.parseInt(req.getParameter("customer_count")));
			rdto.setCustomer_request(req.getParameter("customer_request"));
			rdto.setReservation_start_date(req.getParameter("reservation_start_date"));
			rdto.setReservation_finish_date(req.getParameter("reservation_finish_date"));
			rdto.setHostel_no(Integer.parseInt(req.getParameter("hostel_no")));
			
			rdao.roomReservation(rdto);
			
			resp.sendRedirect("room_reservation_finish.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
