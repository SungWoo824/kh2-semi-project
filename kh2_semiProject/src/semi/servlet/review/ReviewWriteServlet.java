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
		
		ReviewDao dao = new ReviewDao();
		ReviewDto dto = new ReviewDto();
		
		int reservation =  Integer.parseInt(req.getParameter("reservation_no"));
		int hostel_no = Integer.parseInt(req.getParameter("hostel_no"));
		String review_content = req.getParameter("review_content");
		int star_point = Integer.parseInt(req.getParameter("star_point"));
		
		
	}
}
