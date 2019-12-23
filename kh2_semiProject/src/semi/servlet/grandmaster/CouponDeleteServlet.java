package semi.servlet.grandmaster;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.CouponDao;

@WebServlet(urlPatterns = "/grandmaster/coupondelete.do")
public class CouponDeleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			
			int coupon_no = Integer.parseInt(req.getParameter("coupon_no"));
			
			CouponDao dao = new CouponDao();
			dao.delete(coupon_no);
			
			resp.sendRedirect("coupon_itself.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
