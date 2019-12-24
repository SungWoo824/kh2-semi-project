package semi.servlet.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ReviewDao;
import beans.ReviewDto;

@WebServlet(urlPatterns = "/review/review_edit.do")
public class ReviewEditServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			ReviewDao dao = new ReviewDao();
			ReviewDto dto = new ReviewDto();
			
			int review_no = Integer.parseInt(req.getParameter("review_no"));
			String review_content=req.getParameter("review_content");
			int star_point = Integer.parseInt(req.getParameter("star_point"));
			
			dto.setReview_no(review_no);
			dto.setReview_content(review_content);
			dto.setStar_point(star_point);
			
			dao.edit(dto);
			
			
			resp.sendRedirect(req.getContextPath()+"/index.jsp");
		} catch (Exception e) {
			e.getStackTrace();
			resp.sendError(500);
		}
	}
}
