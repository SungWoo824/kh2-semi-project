package qa;

import java.io.IOException;	

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import qa.been.QaDao;

@WebServlet(urlPatterns = "/qa/delete.do")
public class QaDeleteServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int qa_no = Integer.parseInt(req.getParameter("no"));
			QaDao dao = new QaDao();
			dao.delete(qa_no);
			resp.sendRedirect(req.getContextPath()+"/qa/list.jsp");
		} catch (Exception e) {
			e.getStackTrace();
			resp.sendError(500);
		}
	}
}
