package semi.servlet.hostel;

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

@WebServlet(urlPatterns = "/hostel/hostel_download.do")
public class HostelDownloadServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int no = Integer.parseInt(req.getParameter("hostel_no"));
			FilesDao fdao = new FilesDao();
			FilesDto fdto = (FilesDto) fdao.HostelGet(no);
			File target = new File("D:/upload/kh24/hostel",fdto.getSavename());
			byte[] data = FileUtils.readFileToByteArray(target);  
			System.out.println(fdto);
			System.out.println(target);
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
