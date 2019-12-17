package semi.selvlet.grandmaster;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.CouponDao;

@WebServlet(urlPatterns = "/grandmaster/couponremove.do")
public class CouponRemoveServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int havecoupon_no = Integer.parseInt(req.getParameter("havecoupon_no"));
			
			CouponDao dao = new CouponDao();
			dao.couponDelete(havecoupon_no);
			
			resp.sendRedirect("coupon_member.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	
}
