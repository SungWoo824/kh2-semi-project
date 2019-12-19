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
	public List<CouponDto> search(String type,String keyword,int start, int finish) throws Exception{
		Connection con = getConnection();
		
		String sql;
		
		if(type.equals("coupon_name")) {
			sql = "select * from( "
					+ "select rownum rn, A.* from( "
					+ "select * from couponlist "
					+ "where "+type+" like '%'||?||'%' "
					+ "order by coupon_no asc "
					+ ")A "
					+ ") where rn between ? and ?";			
		}else if(type.equals("coupon_no")){
			sql = "select * from( "
					+ "select rownum rn, A.* from( "
					+ "select * from couponlist "
					+ "where "+type+" =? "
					+ "order by coupon_no asc "
					+ ")A "
					+ ") where rn between ? and ?";
		}else {
			sql = "select * from("
					+ "select rownum rn, A.* from( "
					+ "select * from couponlist "
					+ "where "+type+" >= ? "
					+ "order by coupon_no asc "
					+ ")A "
					+ ") where rn between ? and ?";
		}
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, start);
		ps.setInt(3, finish);
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
	
	//목록
	public List<CouponDto> getList(int start, int finish) throws Exception{
		Connection con = getConnection();
		
		String sql = "select * from( "
				+ "select rownum rn, A.* from ( "
				+ "select * from couponlist order by coupon_no asc "
				+ ")A "
				+ ")where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, start);
		ps.setInt(2, finish);
		ResultSet rs = ps.executeQuery();
		
		List<CouponDto> list = new ArrayList<>();
		
		while(rs.next()) {
			int rn = rs.getInt("rn");
			int coupon_no = rs.getInt("coupon_no");
			String coupon_name = rs.getString("coupon_name");
			int coupon_rate = rs.getInt("coupon_rate");
			String coupon_date = rs.getString("coupon_date");
			String coupon_explain = rs.getString("coupon_explain");
			
			CouponDto dto = new CouponDto(rn, coupon_no, coupon_name, coupon_rate, coupon_date, coupon_explain);
			list.add(dto);
		}
		con.close();
		
		return list;
	}
	
	//보유쿠폰목록
		public List<CouponDto> getCouponList(int start, int finish) throws Exception{
			Connection con = getConnection();
			
			String sql = "select * from( "
					+ "select rownum rn, A.* from ( "
					+ "select * from coupon "
					+ "order by havecoupon_no "
					+ ")A "
					+ ")where rn between ? and ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, finish);
			ResultSet rs = ps.executeQuery();
			
			List<CouponDto> list = new ArrayList<>();
			
			while(rs.next()) {
				int rn = rs.getInt("rn");
				int havecoupon_no = rs.getInt("havecoupon_no");
				String member_id = rs.getString("member_id");
				String member_name = rs.getString("member_name");
				String member_phone = rs.getString("member_phone");
				int coupon_no = rs.getInt("coupon_no");
				String coupon_name = rs.getString("coupon_name");
				int coupon_rate = rs.getInt("coupon_rate");
				String coupon_date = rs.getString("coupon_date");
				
				CouponDto dto = new CouponDto(rn, coupon_no, coupon_name, coupon_rate, coupon_date, havecoupon_no, member_id, member_name, member_phone);
				
				list.add(dto);
			}
			con.close();
			
			return list;
		}
	
	//쿠폰 개수 구하기
	public int getCount(String type, String keyword) throws Exception{
		Connection con = getConnection();
		
		boolean isSearch = type!=null && keyword!=null;
		
		String sql = "select count(*) from couponlist";
		if(isSearch) {
			if(type.equals("coupon_name")) {
				sql +=" where "+type+" like '%'||?||'%'";
			}else if(type.equals("coupon_no")) {
				sql +=" where "+type+" = ?";
			}
			else {
				sql +=" where "+type+" >= ?";
			}
		}
		PreparedStatement ps = con.prepareStatement(sql);
		if(isSearch) {
			ps.setString(1, keyword);
		}
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt("count(*)");
		
		con.close();
		return count;
	}
	//쿠폰 삭제
	public void delete(int coupon_no) throws Exception{
		Connection con = getConnection();
		
		String sql = "delete couponlist where coupon_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, coupon_no);
		ps.execute();
		
		con.close();
	}
	//쿠폰 등록
	public void regist(CouponDto dto) throws Exception{
		Connection con = getConnection();
		
		String sql = "insert into couponlist "
				+ "values(coupon_no_seq.nextval, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getCoupon_name());
		ps.setInt(2, dto.getCoupon_rate());
		ps.setString(3, dto.getCoupon_date());
		ps.setString(4, dto.getCoupon_explain());
		
		ps.execute();
		
		con.close();
	}
	
	//쿠폰 단일조회
	public CouponDto get(int coupon_no) throws Exception{
		Connection con = getConnection();
		
		String sql = "select * from couponlist where coupon_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, coupon_no);
		ResultSet rs = ps.executeQuery();
		
		CouponDto dto;
		if(rs.next()) {
			int coupon_no2 = rs.getInt("coupon_no");
			String coupon_name = rs.getString("coupon_name");
			int coupon_rate = rs.getInt("coupon_rate");
			String coupon_date = rs.getString("coupon_date");
			String coupon_explain = rs.getString("coupon_explain");
			
			dto = new CouponDto(
					coupon_no, coupon_name, coupon_rate, coupon_date, coupon_explain);
			
		}
		else {
			dto = null;
		}
		
		con.close();
		return dto;
	}

	//쿠폰 정보수정
	public void couponChange(CouponDto dto) throws Exception{
		Connection con = getConnection();
		
		String sql = "update couponlist set coupon_name=? , coupon_rate=?, coupon_date=?, coupon_explain=? where coupon_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getCoupon_name());
		ps.setInt(2, dto.getCoupon_rate());
		ps.setString(3, dto.getCoupon_date());
		ps.setString(4, dto.getCoupon_explain());
		ps.setInt(5, dto.getCoupon_no());
		
		ps.execute();
		
		con.close();
	}
	
//보유쿠폰 검색결과 메소드
	public List<CouponDto> couponSearch(String type,String keyword,int start, int finish) throws Exception{
		Connection con = getConnection();
		
		String sql;
		
		if(type.equals("coupon_name")||type.equals("member_name")||type.equals("member_id")) {
			sql = "select * from( "
					+ "select rownum rn, A.* from( "
					+ "select * from coupon "
					+ "where "+type+" like '%'||?||'%' "
					+ "order by havecoupon_no "
					+ ")A "
					+ ") where rn between ? and ?";			
		}else if(type.equals("coupon_no")){
			sql = "select * from( "
					+ "select rownum rn, A.* from( "
					+ "select * from coupon "
					+ "order by havecoupon_no "
					+ "where "+type+" =? "
					+ ")A "
					+ ") where rn between ? and ?";
		}else{
			sql = "select * from("
					+ "select rownum rn, A.* from( "
					+ "select * from coupon "
					+ "order by havecoupon_no "
					+ "where "+type+" >= ? "
					+ ")A "
					+ ") where rn between ? and ?";
		}
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, start);
		ps.setInt(3, finish);
		ResultSet rs = ps.executeQuery();
		
		List<CouponDto> list = new ArrayList<>();
		while(rs.next()) {
			CouponDto dto = new CouponDto();
			dto.setHavecoupon_no(rs.getInt("havecoupon_no"));
			dto.setMember_id(rs.getString("member_id"));
			dto.setMember_name(rs.getString("member_name"));
			dto.setMember_phone(rs.getString("member_phone"));
			dto.setCoupon_no(rs.getInt("coupon_no"));
			dto.setCoupon_name(rs.getString("coupon_name"));
			dto.setCoupon_rate(rs.getInt("coupon_rate"));
			dto.setCoupon_date(rs.getString("coupon_date"));
			
			list.add(dto);
		}
		con.close();
		
		return list;
	}
		
	//보유쿠폰 개수 구하기
		public int getCouponCount(String type, String keyword) throws Exception{
			Connection con = getConnection();
			
			boolean isSearch = type!=null && keyword!=null;
			
			String sql = "select count(*) from coupon";
			if(isSearch) {
				if(type.equals("coupon_name")||type.equals("member_name")||type.equals("member_id")) {
					sql +=" where "+type+" like '%'||?||'%'";
				}else if(type.equals("coupon_no")) {
					sql +=" where "+type+" = ?";
				}
				else {
					sql +=" where "+type+" >= ?";
				}
			}
			PreparedStatement ps = con.prepareStatement(sql);
			if(isSearch) {
				ps.setString(1, keyword);
			}
			ResultSet rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt("count(*)");
			
			con.close();
			return count;
		}
	
	//쿠폰 삭제
	public void couponDelete(int havecoupon_no) throws Exception{
		Connection con = getConnection();
		
		String sql = "delete coupon where havecoupon_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, havecoupon_no);
		ps.execute();
		
		con.close();
	}
	
	//쿠폰 수여
		public void couponGive(int member_no, String keyword2) throws Exception{
			Connection con = getConnection();
			
			String sql = "insert into havecoupon values(havecoupon_no_seq.nextval, ?, ?)";			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, keyword2);
			ps.setInt(2, member_no);
			ps.execute();
			
			con.close();
		}
		
		
		/////id로 쿠폰dto 검색
		
		public List<CouponDto> id_search(String keyword) throws Exception{
			
			List<CouponDto> list = new ArrayList<>();
			Connection con = getConnection();
			String sql = "select * from havecoupon where member_no=(select member_no from member where member_id=?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, keyword);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				CouponDto dto = new CouponDto();
				dto.setHavecoupon_no(rs.getInt("havecoupon_no"));
			dto.setMember_no(rs.getInt("member_no"));
				dto.setCoupon_no(rs.getInt("coupon_no"));
			
				
				list.add(dto);
			}
			con.close();
			return list;	
		}
		
}






















