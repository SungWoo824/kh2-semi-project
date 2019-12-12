/*
 * package qa;
 * 
 * import java.io.File; import java.io.IOException;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.annotation.WebServlet; import javax.servlet.http.HttpServlet;
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse;
 * 
 * import com.oreilly.servlet.MultipartRequest; import
 * com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
 * 
 * import home.bean.FilesDao; import home.bean.FilesDto; import qa.been.QaDao;
 * import qa.been.QaDto;
 * 
 * @WebServlet(urlPatterns = "/qa/write.do") public class QaWriteServlet extends
 * HttpServlet{
 * 
 * @Override protected void service(HttpServletRequest req, HttpServletResponse
 * resp) throws ServletException, IOException {
 * 
 * try {
 * 
 * QaDao dao = new QaDao(); QaDto dto = new QaDto();
 * req.setCharacterEncoding("UTF-8"); int room_no =
 * Integer.parseInt(req.getParameter("room_no")); String qa_head =
 * req.getParameter("qa_head"); String qa_title = req.getParameter("qa_title");
 * int member_no = Integer.parseInt(req.getParameter("member_no")); String
 * qa_content = req.getParameter("qa_content");
 * 
 * dto.setRoom_no(room_no); dto.setQa_head(qa_head); dto.setQa_title(qa_title);
 * dto.setMember_no(member_no); dto.setQa_content(qa_content); dao.write(dto);
 * 
 * resp.sendRedirect(req.getContextPath()+"/board/content.jsp?no="+dto.getQa_no(
 * )); } catch (Exception e) { e.getStackTrace(); resp.sendError(500); }
 * 
 * } }
 */
