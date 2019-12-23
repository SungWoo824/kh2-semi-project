package semi.servlet.review;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

import beans.FilesDao;
import beans.FilesDto;

@WebServlet(urlPatterns = "/review/review_download.do")
public class ReviewDownloadServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int no = Integer.parseInt(req.getParameter("review_no"));
			FilesDao fdao = new FilesDao();
			FilesDto fdto = (FilesDto) fdao.ReviewGet(no);
			File target = new File("D:/upload/review",fdto.getSavename());
			System.out.println("target:"+target);
			byte[] data = FileUtils.readFileToByteArray(target);
			System.out.println("data:"+data);
//			application/octet-stream
//			resp.setContentType("application/octet=stream; charset=UTF-8"); 
			resp.setHeader("Content-Type", "application/octet-stream; charset=UTF-8");
			resp.setHeader("Content-Disposition", "attachment; filename=\""+URLEncoder.encode(fdto.getUploadname(),"UTF-8")+"\"");
			resp.setHeader("Content-Length",String.valueOf(fdto.getFilesize()));
			
			resp.getOutputStream().write(data);
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
