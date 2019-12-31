package semi.servlet.qa;

import java.io.IOException;		

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.QaDao;
import beans.QaDto;

@WebServlet(urlPatterns = "/qa/qa_edit.do")
public class QaEditServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			req.setCharacterEncoding("UTF-8");
			int room_no = Integer.parseInt(req.getParameter("room_no"));
			int qa_no = Integer.parseInt(req.getParameter("qa_no"));
			String qa_head = req.getParameter("qa_head");
			String qa_title = req.getParameter("qa_title");
			String qa_content = req.getParameter("qa_content");
			QaDao dao = new QaDao();
			QaDto dto = dao.get(qa_no);
			dto.setRoom_no(room_no);
			dto.setQa_head(qa_head);
			dto.setQa_title(qa_title);
			dto.setQa_content(qa_content);
			dao.Edit(dto);
			resp.sendRedirect(req.getContextPath()+"/mypage/board_content.jsp?qa_no="+dto.getQa_no());

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
