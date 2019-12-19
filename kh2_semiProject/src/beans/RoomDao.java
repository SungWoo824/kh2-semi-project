package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class RoomDao {
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
	
	
	
	//방번호로 방dto 구하기
	
	public RoomDto roomInfomation(int room_no) throws Exception {

		Connection con = this.getConnection();
		String sql = "select * from room_info where room_no = ?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, room_no);
		ResultSet rs = ps.executeQuery();


		RoomDto dto = new RoomDto();
		if(rs.next()) {
			
			dto.setRoom_no(rs.getInt("room_no"));
			dto.setHostel_no(rs.getInt("hostel_no"));
			dto.setRoom_price(rs.getInt("room_price"));
			dto.setRoom_standard_people(rs.getInt("room_standard_people"));
			dto.setRoom_max_people(rs.getInt("room_max_people"));
			dto.setRoom_bed(rs.getInt("room_bed"));
			dto.setRoom_bath(rs.getInt("room_bath"));
			dto.setRoom_spa(rs.getString("room_spa"));
			dto.setRoom_cook(rs.getString("room_cook"));
			dto.setRoom_content(rs.getString("room_content"));
			dto.setRoom_parking(rs.getString("room_parking"));
			dto.setRoom_pet(rs.getString("room_pet"));
			dto.setRoom_breakfast(rs.getString("room_breakfast"));
			dto.setRoom_basic(rs.getString("room_basic"));
			dto.setRoom_tv(rs.getString("room_tv"));
			dto.setRoom_dry(rs.getString("room_dry"));
			dto.setRoom_cool(rs.getString("room_cool"));
			dto.setRoom_hot(rs.getString("room_hot"));
			dto.setRoom_name(rs.getString("room_name"));
			
			
		}
		else {
			dto = null;
		}
		
		con.close();
		
		return dto;
	}

	
	///////id로 dto 뽑기
	public RoomDto get(String member_id) throws Exception {

		Connection con = this.getConnection();
		String sql = "select * from room_info where room_no=(select room_no from interest_room where member_no=(select member_no from member where member_id=?))";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, member_id);
		ResultSet rs = ps.executeQuery();


		RoomDto dto = new RoomDto();
		if(rs.next()) {
			
			dto.setRoom_no(rs.getInt("room_no"));
			dto.setHostel_no(rs.getInt("hostel_no"));
			dto.setRoom_price(rs.getInt("room_price"));
			dto.setRoom_standard_people(rs.getInt("room_standard_people"));
			dto.setRoom_max_people(rs.getInt("room_max_people"));
			dto.setRoom_bed(rs.getInt("room_bed"));
			dto.setRoom_bath(rs.getInt("room_bath"));
			dto.setRoom_spa(rs.getString("room_spa"));
			dto.setRoom_cook(rs.getString("room_cook"));
			dto.setRoom_content(rs.getString("room_content"));
			dto.setRoom_parking(rs.getString("room_parking"));
			dto.setRoom_pet(rs.getString("room_pet"));
			dto.setRoom_breakfast(rs.getString("room_breakfast"));
			dto.setRoom_basic(rs.getString("room_basic"));
			dto.setRoom_tv(rs.getString("room_tv"));
			dto.setRoom_dry(rs.getString("room_dry"));
			dto.setRoom_cool(rs.getString("room_cool"));
			dto.setRoom_hot(rs.getString("room_hot"));
			dto.setRoom_name(rs.getString("room_name"));
			
			
		}
		else {
			dto = null;
		}
		
		con.close();
		
		return dto;
	}

	
}
