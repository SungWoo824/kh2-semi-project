package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTML;

import beans.InterestDao;
import beans.InterestDto;
import beans.MemberDao;
import beans.MemberDto;
import beans.RoomDao;
@WebServlet(urlPatterns = "/mypage/wish_list.do")
public class MemberDeletewishlistServlet extends HttpServlet{

	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			req.setCharacterEncoding("UTF-8");
			
			String id = (String)req.getSession().getAttribute("id");
			
			
			
			InterestDao idao = new InterestDao();
			

			InterestDto idto = idao.interestinfo(id);
int room_no=idto.getRoom_no();

int room_no2=Integer.parseInt(req.getParameter("room_no"));

idao.delete(room_no2);

resp.sendRedirect("../mypage/wish_list.jsp");
			
		} catch (Exception e) {
			
			
			e.printStackTrace();
		resp.sendError(500);
	
			
			
		}
	}
	
	
	
	
	
}