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
	
//연결메소드	
	public Connection getConnection() throws Exception{
		return source.getConnection();
	}
	
//쿠폰보유 검색 <-회원번호
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
	
//쿠폰보유 검색 <-회원아이디	
	public List<CouponDto> memberHasCoupon(String member_id) throws Exception{
		Connection con = this.getConnection();
		String sql = "select CL.coupon_no,CL.coupon_name,CL.coupon_rate,cl.coupon_date,CL.coupon_explain"
				+ " from couponlist CL inner join havecoupon HC on CL.coupon_no = HC.coupon_no where member_id = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, member_id);
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
	
//쿠폰 검색결과 메소드
	public List<CouponDto> search(String type,String keyword) throws Exception{
		Connection con = getConnection();
		
		String sql;
		
		if(type.equals("coupon_no")||type.equals("coupon_name")) {
			sql = "select * from couponlist "
					+ "where "+type+" like '%'||?||'%' "
							+ "order by coupon_no asc";			
		}else {
			sql = "select * from couponlist "
					+ "where "+type+" coupon_rate >= ? "
							+ "order by coupon_no asc";
		}
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		List<CouponDto> list = new ArrayList<>();
		while(rs.next()) {
			CouponDto dto = new CouponDto();
			dto.setCoupon_no(rs.getInt("coupon_no"));
			dto.setCoupon_name(rs.getString("coupon_name"));
			dto.setCoupon_rate(rs.getInt("coupon_rate"));
			dto.setCoupon_date(rs.getString("coupon_date"));
			dto.setCoupon_explain(rs.getString("coupon_explain"));
			
			list.add(dto);
		}
		con.close();
		
		return list;
	}
}






















