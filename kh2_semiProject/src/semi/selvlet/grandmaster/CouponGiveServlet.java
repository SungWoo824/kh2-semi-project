package semi.selvlet.grandmaster;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.CouponDao;
import beans.MemberDao;
import beans.MemberDto;

@WebServlet(urlPatterns = "/grandmaster/coupongive.do")
public class CouponGiveServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String type1 = req.getParameter("type1");
			String keyword1 = req.getParameter("keyword1");
			String keyword2 = req.getParameter("keyword2");
			int member_no;
			MemberDao mdao = new MemberDao();
			CouponDao cdao = new CouponDao();
			if(type1.equals("member_id")) {
				MemberDto dto = mdao.memberInfomation(keyword1);
				member_no = dto.getNo();
				cdao.couponGive(member_no, keyword2);
			}else {
				member_no=Integer.parseInt(keyword1);
				cdao.couponGive(member_no, keyword2);
			}
															
			resp.sendRedirect("coupon_member.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
