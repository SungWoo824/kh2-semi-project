package semi.servlet.review;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.FilesDao;
import beans.FilesDto;
import beans.ReviewDao;
import beans.ReviewDto;

@WebServlet(urlPatterns = "/review/review_delete.do")
public class ReviewDeleteServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
				int review_no = Integer.parseInt(req.getParameter("review_no"));
				int hostel_no = Integer.parseInt(req.getParameter("hostel_no"));
				FilesDao fdao = new FilesDao();
				FilesDto fdto = fdao.ReviewGet(review_no);
				File file = new File("D:/upload/kh24/review/"+fdto.getSavename());
				if(file.exists()) {
					file.delete();
				}
				ReviewDao dao = new ReviewDao();
				dao.review_delete(review_no);
				
				resp.sendRedirect(req.getContextPath()+"hostel/hostel_content.jsp?hostel_no="+hostel_no);
		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
		}
	}
}
