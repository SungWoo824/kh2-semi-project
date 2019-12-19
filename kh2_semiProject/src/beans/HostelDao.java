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
	
	public List<HostelDto> hostelList(int start, int finsh) throws Exception{
		Connection con = this.getConnection();
		
		String sql = "select * from( select rownum rn, M.* from "
				+ "(select H.*,R.region_name from hostel H inner join region R "
				+ "on H.region_no = R.region_no order by H.hostel_no desc)M )where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, start);
		ps.setInt(2, finsh);
		ResultSet rs = ps.executeQuery();
		
		List<HostelDto> list = new ArrayList<>();
		while(rs.next()) {
			HostelDto hdto = new HostelDto();
			hdto.setHostel_no(rs.getInt("hostel_no"));
			hdto.setOwner_no(rs.getInt("owner_no"));
			hdto.setRegion_name(rs.getString("region_name"));
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
	
	
	
	
	//
	
	////////////////호스텔 넘버로 호스텔 dto
	
	public HostelDto hostelinfomation(int hostel_no) throws Exception{
		Connection con = this.getConnection();
		String sql ="select * from hostel where hostel_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, hostel_no);
		ResultSet rs = ps.executeQuery();
		
		HostelDto dto;
		if(rs.next()) {
			dto = new HostelDto();
			
			dto.setHostel_no(rs.getInt("hostel_no"));
			dto.setOwner_no(rs.getInt("owner_no"));
			dto.setRegion_no(rs.getInt("region_no"));
			dto.setHostel_name(rs.getString("hostel_name"));
			dto.setHostel_phone(rs.getString("hostel_phone"));
			dto.setHostel_detail_addr(rs.getString("hostel_detail_addr"));
			dto.setHostel_latitude(rs.getString("hostel_latitude"));
			dto.setHostel_longitude(rs.getString("hostel_longitude"));
			dto.setHostel_content(rs.getString("hostel_content"));
			dto.setHostel_kind_name(rs.getString("hostel_kind_name"));
		
			
			
		
		}
		else {
			dto = null;
		}
		
		con.close();
		
		return dto;
	}
	
	
	
	
	
	public HostelDto hostelinfomation2(int room_no) throws Exception{
		Connection con = this.getConnection();
		String sql ="select * from hostel where hostel_no=(select hostel_no from room_info where room_no=?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, room_no);
		ResultSet rs = ps.executeQuery();
		
		HostelDto dto;
		if(rs.next()) {
			dto = new HostelDto();
			
			dto.setHostel_no(rs.getInt("hostel_no"));
			dto.setOwner_no(rs.getInt("owner_no"));
			dto.setRegion_no(rs.getInt("region_no"));
			dto.setHostel_name(rs.getString("hostel_name"));
			dto.setHostel_phone(rs.getString("hostel_phone"));
			dto.setHostel_detail_addr(rs.getString("hostel_detail_addr"));
			dto.setHostel_latitude(rs.getString("hostel_latitude"));
			dto.setHostel_longitude(rs.getString("hostel_longitude"));
			dto.setHostel_content(rs.getString("hostel_content"));
			dto.setHostel_kind_name(rs.getString("hostel_kind_name"));
		
			
			
		
		}
		else {
			dto = null;
		}
		
		con.close();
		
		return dto;
	}
////////////////////////////////////////////////////////////////
//						관리자 -	 호스텔 목록 검색					  //
////////////////////////////////////////////////////////////////
	public List<HostelDto> masterHostelSearch(String type, String keyword , int start,int finish) throws Exception{
		Connection con = this.getConnection();
		String sql =  "select * from( select rownum rn, M.* from "
				+ "(select H.*,R.region_name from hostel H inner join region R "
				+ "on H.region_no = R.region_no where "+type+" like '%'||?||'%'order by H.hostel_no desc)M )where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, start);
		ps.setInt(3, finish);
		ResultSet rs = ps.executeQuery();
		
		List<HostelDto> list = new ArrayList<>();
		while(rs.next()) {
			HostelDto hdto = new HostelDto();
			hdto.setHostel_no(rs.getInt("hostel_no"));
			hdto.setOwner_no(rs.getInt("owner_no"));
			hdto.setRegion_name(rs.getString("region_name"));
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
//					관리자 -	 등록 호스텔 수 조회					  //
////////////////////////////////////////////////////////////////
	
	public int hostelCount(String type, String keyword) throws Exception{
		Connection con = getConnection();
		String sql = "select count(*) from hostel";
		boolean isSearch = type!=null && keyword!=null;
		if(isSearch) {
			sql += " where "+type+" like '%'||?||'%'";
		} 
		PreparedStatement ps = con.prepareStatement(sql);
		if(isSearch) {
			ps.setString(1, keyword);
		}
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		return count;
	}
}
