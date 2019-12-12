package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class HostelDao {
	
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
	
	
////////////////////////////////////////////////////////////////
//					등록된 숙소 전체 조회							  //
////////////////////////////////////////////////////////////////
	
	public List<HostelDto> hostelList() throws Exception{
		Connection con = this.getConnection();
		
		String sql = "select * from hostel";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<HostelDto> list = new ArrayList<>();
		while(rs.next()) {
			HostelDto hdto = new HostelDto();
			hdto.setHostel_no(rs.getInt("hostel_no"));
			hdto.setOwner_no(rs.getInt("owner_no"));
			hdto.setRegion_no(rs.getInt("region_no"));
			hdto.setHostel_name(rs.getString("hostel_name"));
			hdto.setHostel_phone(rs.getString("hostel_phone"));
			hdto.setHostel_detail_addr(rs.getString("hostel_detail_addr"));
			hdto.setHostel_latitude(rs.getString("hostel_latitude"));
			hdto.setHostel_longitude(rs.getString("hostel_longitude"));
			hdto.setHostel_content(rs.getString("hostel_content"));
			hdto.setHostel_kind_name(rs.getString("hostel_kind_name"));
			
			list.add(hdto);
		}
		con.close();
		return list;
	}
	
////////////////////////////////////////////////////////////////
//						등록된 숙소 삭제							  //
////////////////////////////////////////////////////////////////
	public void hostelDelete(int hostel_no) throws Exception{
		Connection con = this.getConnection();
		String sql = "delete from hostel where hostel_no = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, hostel_no);
		ps.execute();
		
		con.close();
	}
	
}
