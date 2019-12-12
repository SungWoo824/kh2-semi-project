package qa;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import qa.been.QaDao;
import qa.been.QaDto;

@WebServlet(urlPatterns = "/qa/write.do")
public class QaWriteServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {		
			System.out.println("시작");
			QaDao dao = new QaDao();
			QaDto dto = new QaDto();
			req.setCharacterEncoding("UTF-8");
			System.out.println("시작3");
			int qa_no = dao.getSequence();
			System.out.println("시작1");
			int member_no = 1;//나중에 세션으로 받음
			int room_no = Integer.parseInt(req.getParameter("room_no"));
			String qa_head = req.getParameter("qa_head");
			String qa_title = req.getParameter("qa_title");
			System.out.println("시작2");
			String qa_content = req.getParameter("qa_content");
			
			dto.setQa_no(qa_no);
			dto.setMember_no(member_no);
			dto.setRoom_no(room_no);
			dto.setQa_head(qa_head);
			dto.setQa_title(qa_title);
			dto.setMember_no(member_no);
			dto.setQa_content(qa_content);
			dao.write(dto);
			resp.sendRedirect(req.getContextPath()+"/qa/content.jsp?no="+qa_no);
		} catch (Exception e) {
			e.getStackTrace();
			resp.sendError(500);
		}
		
	}
}
