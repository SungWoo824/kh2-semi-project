package semi.servlet.qa_reply;

import java.io.IOException;	

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.QaDao;
import beans.QaDto;
import beans.QaReplyDao;
import beans.QaReplyDto;


@WebServlet(urlPatterns = "/qa/qa_reply_insert.do")
public class QaReplyInsertServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			req.setCharacterEncoding("UTF-8");
			int qa_no = Integer.parseInt(req.getParameter("qa_no"));
			String qa_reply_content = req.getParameter("qa_reply_content");
			QaReplyDao dao = new QaReplyDao();
			QaReplyDto dto = new QaReplyDto();
			QaDao Qdao = new QaDao();
			QaDto Qdto = Qdao.get(qa_no); 
//			Bdao.ru(origin);
			dto.setQa_no(qa_no);
			dto.setMember_no(24);
			dto.setQa_reply_content(qa_reply_content);
			dao.Insert(dto);
			resp.sendRedirect(req.getContextPath()+"/qa/content.jsp?no="+qa_no);
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}