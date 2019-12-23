package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ReviewDao {
	
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
	
	public void write(ReviewDto dto) throws Exception {
		
		Connection con = getConnection();
		String sql = "insert into review VALUES(?,?,?,?,?,?,sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getReview_no());
		ps.setInt(2, dto.getReservation_no());
		ps.setInt(3, dto.getCustomer_no());
		ps.setInt(4, dto.getHostel_no());
		ps.setString(5, dto.getReview_content());
		ps.setInt(6, dto.getStar_point());
		ps.execute();
		con.close();
	}
	
	public int getSequence() throws Exception{
		Connection con = getConnection();
		String sql  = "select review_no_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int seq = rs.getInt(1);
		con.close();
		
		return seq;
	}
	
	public void edit(ReviewDto dto) throws Exception{
		Connection con = getConnection();
		String sql = "update review set review_content=?,star_point=?,review_date=sysdate where review_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, dto.getReview_content());
		ps.setInt(2, dto.getStar_point());
		ps.setInt(3, dto.getReview_no());
		
		ps.execute();
		
		con.close();
	}
}
