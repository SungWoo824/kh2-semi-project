package semi.servlet.review;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import beans.FilesDao;
import beans.FilesDto;
import beans.ReviewDao;
import beans.ReviewDto;

@WebServlet(urlPatterns = "/review/review_write.do")
public class ReviewWriteServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			MultipartRequest mRequest = new MultipartRequest(req,"D:/upload/review",10*1024*1024,"UTF-8",new DefaultFileRenamePolicy());
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
			
			File file = mRequest.getFile("review_file");
			if(file != null) {
				FilesDto fdto = new FilesDto();
				fdto.setUploadname(mRequest.getOriginalFileName("file"));
				fdto.setSavename(mRequest.getFilesystemName("file"));
				fdto.setFiletype(mRequest.getContentType("file"));
				fdto.setFilesize(file.length());
				fdto.setReview_no(review_no);
				
				FilesDao fdao = new FilesDao();
			}
			
			resp.sendRedirect(req.getContextPath()+"/index.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}