package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import beans.RoomDto;

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
	
	
	
	//방번호로 방dto 리스트 구하기
	
	public List<RoomDto> roomInfomation(int room_no) throws Exception {

		Connection con = this.getConnection();
		String sql = "select * from room_info where room_no = ?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, room_no);
		ResultSet rs = ps.executeQuery();

		List<RoomDto> list = new ArrayList<>();
		
		
		while(rs.next()) {
			RoomDto rdto = new RoomDto();
			rdto.setRoom_no(rs.getInt("room_no"));
			rdto.setHostel_no(rs.getInt("hostel_no"));
			rdto.setRoom_price(rs.getInt("room_price"));
			rdto.setRoom_standard_people(rs.getInt("room_standard_people"));
			rdto.setRoom_max_people(rs.getInt("room_max_people"));
			rdto.setRoom_bed(rs.getInt("room_bed"));
			rdto.setRoom_bath(rs.getInt("room_bath"));
			rdto.setRoom_spa(rs.getString("room_spa"));
			rdto.setRoom_cook(rs.getString("room_cook"));
			rdto.setRoom_content(rs.getString("room_content"));
			rdto.setRoom_parking(rs.getString("room_parking"));
			rdto.setRoom_pet(rs.getString("room_pet"));
			rdto.setRoom_breakfast(rs.getString("room_breakfast"));
			rdto.setRoom_basic(rs.getString("room_basic"));
			rdto.setRoom_tv(rs.getString("room_tv"));
			rdto.setRoom_dry(rs.getString("room_dry"));
			rdto.setRoom_cool(rs.getString("room_cool"));
			rdto.setRoom_hot(rs.getString("room_hot"));
			rdto.setRoom_name(rs.getString("room_name"));
			
			list.add(rdto);
		}
		con.close();
		return list;
		
		
	
		
	
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

/////////////////////////////////////////////////////////////////
///	판매자 - room_info 등록 기능(이가영)		시작	///
///////////////////////////////////////////////////////////////	
	public void regist(RoomDto dto) throws Exception{
		Connection con = getConnection();

		String sql = "insert into room_info values(room_no_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, dto.getHostel_no());
		ps.setInt(2, dto.getRoom_price());
		ps.setInt(3, dto.getRoom_standard_people());
		ps.setInt(4, dto.getRoom_max_people());
		ps.setInt(5, dto.getRoom_bed());
		ps.setInt(6, dto.getRoom_bath());
		ps.setString(7, dto.getRoom_spa());
		ps.setString(8, dto.getRoom_cook());
		ps.setString(9, dto.getRoom_content());
		ps.setString(10, dto.getRoom_parking());
		ps.setString(11, dto.getRoom_pet());
		ps.setString(12, dto.getRoom_breakfast());
		ps.setString(13, dto.getRoom_basic());
		ps.setString(14, dto.getRoom_tv());
		ps.setString(15, dto.getRoom_dry());
		ps.setString(16, dto.getRoom_cool());
		ps.setString(17, dto.getRoom_hot());
		ps.setString(18, dto.getRoom_name());
		
		
		
		ps.execute();
		
		con.close();
	}

	// hostel_no 받아오는 메소드
	public int getHostelNo() throws Exception{
		
		Connection con = getConnection();
		String sql = "select hostel_no_seq.currval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
				
		ResultSet rs = ps.executeQuery();
			
		rs.next();
		int hostel_no = rs.getInt(1);
				
		con.close();
		return hostel_no;
	}
	
	
	// room_info에 날짜 등록하기
	
	
	
/////////////////////////////////////////////////////////////////
///	판매자 - room_info 등록 기능(이가영)		끝	   ///
///////////////////////////////////////////////////////////////




//방번호로 방이름 구하기

public String roomname(int room_no) throws Exception {

	Connection con = this.getConnection();
	String sql = "select room_name from room_info where room_no = ?";

	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, room_no);
	ResultSet rs = ps.executeQuery();

	String room_name = null;
	if(rs.next()) {
//		
		room_name=rs.getString("room_name"); //나오는 값이 1개니까
	}
	
	con.close();
	return room_name;

	
}

//방번호로 호스텔넘버 구하기

public int hostelNumber(int room_no) throws Exception {

	Connection con = this.getConnection();
	String sql = "select hostel_no from room_info where room_no = ?";

	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, room_no);
	ResultSet rs = ps.executeQuery();

	int hostel_no=0;
	if(rs.next()) {
		
	hostel_no =rs.getInt("hostel_no");
	}

	con.close();
	return hostel_no;

	
}


//방번호로 방가격 구하기
public int roomprice(int room_no) throws Exception {

	Connection con = this.getConnection();
	String sql = "select room_price from room_info where room_no = ?";

	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, room_no);
	ResultSet rs = ps.executeQuery();

	int room_price=0;
	if(rs.next()) {
		
	room_price =rs.getInt("room_price");
	}

	con.close();
	return room_price;

	
}



}
