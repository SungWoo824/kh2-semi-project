package semi.servlet.qa;

import java.io.IOException;			

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.QaDao;

@WebServlet(urlPatterns = "/qa/delete.do")
public class QaDeleteServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int qa_delete_no = Integer.parseInt(req.getParameter("qa_delete_no"));
			QaDao dao = new QaDao();
			dao.delete(qa_delete_no);
			resp.sendRedirect(req.getContextPath()+"/qa/list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
