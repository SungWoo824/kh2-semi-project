package semi.servlet.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ReviewDao;
import beans.ReviewDto;

@WebServlet(urlPatterns = "/review/review_write.do")
public class ReviewWriteServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			ReviewDao dao = new ReviewDao();
			ReviewDto dto = new ReviewDto();
			
			int review_no = dao.getSequence();
			int reservation_no =  Integer.parseInt(req.getParameter("reservation_no"));
			int customer_no = 1;//reservation_no로 가져옴
			int hostel_no = Integer.parseInt(req.getParameter("hostel_no"));
			String review_content = req.getParameter("review_content");
			int star_point = Integer.parseInt(req.getParameter("star_point"));
			
			
			dto.setReview_no(review_no);
			dto.setReservation_no(reservation_no);
			dto.setCustomer_no(customer_no);
			dto.setHostel_no(hostel_no);
			dto.setReview_content(review_content);
			dto.setStar_point(star_point);
			
			dao.write(dto);
			
			resp.sendRedirect(req.getContextPath()+"/index.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
