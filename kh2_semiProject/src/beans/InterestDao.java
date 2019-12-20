package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class InterestDao {

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
	
	public InterestDto interestinfo(String member_id) throws Exception {

		Connection con = this.getConnection();
		String sql = "select * from interest_room where member_no = (select member_no from member where member_id=? )";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, member_id);
		
		ResultSet rs = ps.executeQuery();


		InterestDto dto;
		if(rs.next()) {
			dto=new InterestDto();
			dto.setMember_no(rs.getInt("member_no"));
			dto.setRoom_no(rs.getInt("room_no"));
			
		}
		else {
			dto = null;
		}
		
		con.close();
		
		return dto;
	}

	
	////멤버로 dto
	public InterestDto interestinfo2(int member_no) throws Exception {

		Connection con = this.getConnection();
		String sql = "select * from interest_room where member_no =? ";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, member_no);
		
		ResultSet rs = ps.executeQuery();


		InterestDto dto;
		if(rs.next()) {
			dto=new InterestDto();
			dto.setMember_no(rs.getInt("member_no"));
			dto.setRoom_no(rs.getInt("room_no"));
			
		}
		else {
			dto = null;
		}
		
		con.close();
		
		return dto;
	}

	
	
	
}