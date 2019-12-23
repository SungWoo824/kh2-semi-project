package semi.servlet.grandmaster;

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
			req.setCharacterEncoding("UTF-8");
			
			int coupon_rate = Integer.parseInt(req.getParameter("coupon_rate"));
			int coupon_no = Integer.parseInt(req.getParameter("coupon_no"));
			
			if(coupon_rate<100&&coupon_rate>0) {
				CouponDto dto = new CouponDto();
				dto.setCoupon_no(Integer.parseInt(req.getParameter("coupon_no")));
				dto.setCoupon_name(req.getParameter("coupon_name"));
				dto.setCoupon_rate(Integer.parseInt(req.getParameter("coupon_rate")));
				dto.setCoupon_date(req.getParameter("coupon_date"));
				dto.setCoupon_explain(req.getParameter("coupon_explain"));
				
				CouponDao dao = new CouponDao();
				dao.couponChange(dto);
				
				resp.sendRedirect("coupon_itself.jsp");
			}else {
				resp.sendRedirect("coupon_change.jsp?coupon_no="+coupon_no+"&error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect("coupon_change.jsp?error");
		}
	}

}
