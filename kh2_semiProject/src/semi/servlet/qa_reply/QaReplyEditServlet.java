package semi.servlet.qa_reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.QaReplyDao;
import beans.QaReplyDto;

@WebServlet(urlPatterns = "/qa/qa_reply_edit.do")
public class QaReplyEditServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String qa_reply_content = req.getParameter("qa_reply_content");
			int qa_reply_no = Integer.parseInt(req.getParameter("qa_reply_no"));
			QaReplyDao dao = new QaReplyDao();
			QaReplyDto dto = dao.get(qa_reply_no);
			System.out.println("안녕1");
			dao.update(qa_reply_no, qa_reply_content);
			System.out.println("안녕2");
			resp.sendRedirect(req.getContextPath()+"/qa/content.jsp?pno=&no="+dto.getQa_no());
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
