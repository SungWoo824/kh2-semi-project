package semi.selvlet.grandmaster;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.CouponDao;
import beans.CouponDto;

@WebServlet(urlPatterns = "/grandmaster/couponchange.do")
public class CouponChangeServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			CouponDto dto = new CouponDto();
			dto.setCoupon_no(Integer.parseInt(req.getParameter("coupon_no")));
			dto.setCoupon_name(req.getParameter("coupon_name"));
			dto.setCoupon_rate(Integer.parseInt(req.getParameter("coupon_rate")));
			dto.setCoupon_date(req.getParameter("coupon_date"));
			dto.setCoupon_explain(req.getParameter("coupon_explain"));
			
			CouponDao dao = new CouponDao();
			dao.couponChange(dto);
			
			resp.sendRedirect("coupon_itself.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
