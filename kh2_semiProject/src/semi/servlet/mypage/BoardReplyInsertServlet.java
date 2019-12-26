package semi.servlet.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.MemberDao;
import beans.MemberDto;
import beans.QaReplyDao;
import beans.QaReplyDto;
@WebServlet(urlPatterns = "/mypage/board_reply_insert.do")
public class BoardReplyInsertServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			req.setCharacterEncoding("UTF-8");
			int qa_no = Integer.parseInt(req.getParameter("qa_no"));
			String qa_reply_content = req.getParameter("qa_reply_content");
			String id = (String) req.getSession().getAttribute("id");
			QaReplyDao dao = new QaReplyDao();
			QaReplyDto dto = new QaReplyDto();
			MemberDao mdao = new MemberDao();
			MemberDto mdto = mdao.get(id);

			dto.setQa_no(qa_no);
			dto.setMember_no(mdto.getNo());
			dto.setQa_reply_content(qa_reply_content);
			dao.Insert(dto);
			resp.sendRedirect(req.getContextPath()+"/mypage/board_content.jsp?qa_no="+qa_no);
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
