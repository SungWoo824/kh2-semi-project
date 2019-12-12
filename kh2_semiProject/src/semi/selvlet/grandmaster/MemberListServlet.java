package semi.selvlet.grandmaster;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.MemberDao;
import beans.MemberDto;

/*
 * 관리자 회원 조회 페이지 리스트 출력 서블릿
 */
@WebServlet(urlPatterns = "/grandmaster/master_member_list.do")
public class MemberListServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			MemberDao mdao = new MemberDao();
			List<MemberDto> list = new ArrayList<>();
			list = mdao.memberList();
			
		} catch (Exception e) {
			
		}
	}
	
}
