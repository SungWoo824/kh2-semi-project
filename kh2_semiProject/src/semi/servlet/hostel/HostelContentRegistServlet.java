package semi.servlet.hostel;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.HostelDao;
import beans.HostelDto;
import beans.RoomDao;

@WebServlet("/hostel/hostel_content_regist.do")
public class HostelContentRegistServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	try {
	req.setCharacterEncoding("UTF-8");	
	
	HostelDto dto = new HostelDto();
	HostelDao dao = new HostelDao();

	
	
	
	
	} catch (Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}	
	}
	
}
