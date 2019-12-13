package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CouponDao {
	private static DataSource source;
	static {
		try {
			InitialContext ctx = new InitialContext();
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
	}
	
	public Connection getConnection() throws Exception{
		return source.getConnection();
	}
	
	public List<CouponDto> memberHasCoupon(int member_no) throws Exception{
		Connection con = this.getConnection();
		String sql = "select CL.coupon_no,CL.coupon_name,CL.coupon_rate,cl.coupon_date,CL.coupon_explain"
				+ " from couponlist CL inner join havecoupon HC on CL.coupon_no = HC.coupon_no where member_no = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, member_no);
		ResultSet rs = ps.executeQuery();
		
		List<CouponDto> list = new ArrayList<>();
		while(rs.next()) {
			CouponDto cdto = new CouponDto();
			cdto.setCoupon_no(rs.getInt("coupon_no"));
			cdto.setCoupon_name(rs.getString("coupon_name"));
			cdto.setCoupon_rate(rs.getInt("coupon_rate"));
			cdto.setCoupon_date(rs.getString("coupon_date"));
			cdto.setCoupon_explain(rs.getString("coupon_explain"));
			
			list.add(cdto);
		}
		
		con.close();
		return list;
	}
}
