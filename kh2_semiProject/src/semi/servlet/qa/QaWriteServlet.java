package semi.servlet.qa;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.MemberDao;
import beans.MemberDto;
import beans.QaDao;
import beans.QaDto;

@WebServlet(urlPatterns = "/qa/qa_write.do")
public class QaWriteServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {		
			QaDao dao = new QaDao();
			QaDto dto = new QaDto();
			String member_id = (String) req.getSession().getAttribute("id");
			MemberDao mdao = new MemberDao();
			MemberDto mdto = mdao.get(member_id);
			req.setCharacterEncoding("UTF-8");
			int qa_no = dao.getSequence();
			
			int member_no = mdto.getNo();
			int room_no = Integer.parseInt(req.getParameter("room_no"));
			String qa_head = req.getParameter("qa_head");
			String qa_title = req.getParameter("qa_title");
			String qa_content = req.getParameter("qa_content");
			
			dto.setQa_no(qa_no);
			dto.setMember_no(member_no);
			dto.setRoom_no(room_no);
			dto.setQa_head(qa_head);
			dto.setQa_title(qa_title);
			dto.setMember_no(member_no);
			dto.setQa_content(qa_content);
			dao.write(dto);
			resp.sendRedirect(req.getContextPath()+"/mypage/board_list.jsp?qa_no="+qa_no);	
			
		} catch (Exception e) {
			e.getStackTrace();
			resp.sendError(500);
		}
		
	}
}
