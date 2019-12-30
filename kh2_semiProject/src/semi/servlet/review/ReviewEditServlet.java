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

@WebServlet(urlPatterns = "/review/review_edit.do")
public class ReviewEditServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			MultipartRequest mRequest = new MultipartRequest(req,"D:/upload/kh24/review",10*1024*1024,"UTF-8",new DefaultFileRenamePolicy());
			
			int review_no = Integer.parseInt(mRequest.getParameter("review_no"));
			String review_content=mRequest.getParameter("review_content");
			int star_point = Integer.parseInt(mRequest.getParameter("star_point"));
			ReviewDao dao = new ReviewDao();
			ReviewDto dto = dao.hostel_review_get(review_no);
			

			dto.setReview_no(review_no);
			dto.setReview_content(review_content);
			dto.setStar_point(star_point);
			
			dao.edit(dto);
			File file = mRequest.getFile("review_file");
			if(file!=null) {
				FilesDao fdao = new FilesDao();
				FilesDto fdto = fdao.ReviewGet(review_no);
				file = new File("D:/upload/review/"+fdto.getSavename());
				if(file.exists()) {
					file.delete();
				}
				file = mRequest.getFile("review_file");
				if(file != null) {
					fdto = new FilesDto();
					fdto.setUploadname(mRequest.getOriginalFileName("review_file"));
					fdto.setSavename(mRequest.getFilesystemName("review_file"));
					fdto.setFiletype(mRequest.getContentType("review_file"));
					fdto.setFilesize(file.length());
					fdto.setReview_no(review_no);
					fdao = new FilesDao();
					fdao.ReviewChange(fdto);
				}
			}
			
			resp.sendRedirect(req.getContextPath()+"/hostel/hostel_content.jsp?hostel_no="+dto.getHostel_no());
		} catch (Exception e) {
			e.getStackTrace();
			resp.sendError(500);
		}
		
	}
}
