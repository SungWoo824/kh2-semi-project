package qa.reply;

import java.io.IOException;	

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qa.been.QaDao;
import qa.been.QaReplyDao;
import qa.been.QaReplyDto;

@WebServlet(urlPatterns = "/qa/qa_reply_delete.do")
public class QaReplyDeleteServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int qa_reply_no = Integer.parseInt(req.getParameter("no"));
			
			QaReplyDao dao = new QaReplyDao();
			QaReplyDto dto = dao.get(qa_reply_no);
			int qa_no = dto.getQa_no();
			dao.delete(qa_reply_no);
			resp.sendRedirect(req.getContextPath()+"/qa/content.jsp?no="+qa_no);
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
