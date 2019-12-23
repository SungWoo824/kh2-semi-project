package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

	public class ReservationDao {
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
	//예약 목록 조회						  //
	////////////////////////////////////////////////////////////////
	public List<ReservationDto> list(int member_no) throws Exception{

	Connection con = this.getConnection();
	String sql = "select * from reservation_list  where customer_no=? order by reservation_no desc";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, member_no);
	ResultSet rs = ps.executeQuery();
	
	List<ReservationDto> list = new ArrayList<>();
	
	while(rs.next()) {
	ReservationDto dto = new ReservationDto();
	
	dto.setReservation_no(rs.getInt("reservation_no"));
	dto.setRoom_no(rs.getInt("room_no"));
	dto.setCustomer_no(rs.getInt("customer_no"));
	dto.setCustomer_count(rs.getInt("customer_count"));
	dto.setCustomer_request(rs.getString("customer_request"));
	dto.setReservation_start_date(rs.getString("reservation_start_date"));
	dto.setReservation_until(rs.getInt("reservation_until"));
	
	list.add(dto);
	}
	con.close();
	return list;
	}
		
	
	
	
	public ReservationDto get() throws Exception{
	
		Connection con = this.getConnection();
		String sql ="select * from reservation_list";
		
		PreparedStatement ps = con.prepareStatement(sql);
	
		ResultSet rs = ps.executeQuery();
		
		ReservationDto rdto = new ReservationDto();
		if(rs.next()) {
			rdto.setReservation_no(rs.getInt("reservation_no"));
			rdto.setRoom_no(rs.getInt("room_no"));
			rdto.setCustomer_no(rs.getInt("customer_no"));
			rdto.setCustomer_count(rs.getInt("customer_count"));
			rdto.setCustomer_request(rs.getString("customer_request"));
			rdto.setReservation_start_date(rs.getString("reservation_start_date"));
			rdto.setReservation_until(rs.getInt("reservation_until"));
		}
		else {
			rdto = null;
		}
		
		con.close();
		
		return rdto;
	}
	
	public ReservationDto getRoomname(int room_no) throws Exception{
	
		Connection con = this.getConnection();
		String sql ="select * from reservation_list ";
		
		PreparedStatement ps = con.prepareStatement(sql);
	
		ResultSet rs = ps.executeQuery();
		
		ReservationDto rdto = new ReservationDto();
		if(rs.next()) {
			rdto.setReservation_no(rs.getInt("reservation_no"));
			rdto.setRoom_no(rs.getInt("room_no"));
			rdto.setCustomer_no(rs.getInt("customer_no"));
			rdto.setCustomer_count(rs.getInt("customer_count"));
			rdto.setCustomer_request(rs.getString("customer_request"));
			rdto.setReservation_start_date(rs.getString("reservation_start_date"));
			rdto.setReservation_until(rs.getInt("reservation_until"));
		}
		else {
			rdto = null;
		}
		
		con.close();
		
		return rdto;
	}
	
	
	
	
////////////////////////////////////////////////////////////////
//예약 목록 조회						  //
////////////////////////////////////////////////////////////////


public List<ReservationDto> list(int member_no,int startblock,int finishblock) throws Exception{
Connection con = this.getConnection();
String sql = "select * from(select ROWNUM rn, A.* from (select * from reservation_list  where customer_no=?)A order by reservation_no desc) where rn between ? and ?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setInt(1, member_no);
ps.setInt(2, startblock);
ps.setInt(3, finishblock);
ResultSet rs = ps.executeQuery();

List<ReservationDto> list = new ArrayList<>();

while(rs.next()) {
ReservationDto dto = new ReservationDto();

dto.setReservation_no(rs.getInt("reservation_no"));
dto.setRoom_no(rs.getInt("room_no"));
dto.setCustomer_no(rs.getInt("customer_no"));
dto.setCustomer_count(rs.getInt("customer_count"));
dto.setCustomer_request(rs.getString("customer_request"));
dto.setReservation_start_date(rs.getString("reservation_start_date"));
dto.setReservation_until(rs.getInt("reservation_until"));

list.add(dto);
}
con.close();
return list;
}


//회원별 예약개수 구하기
public int Count(int member_no) throws Exception{
Connection con = getConnection();

String sql = "select count(*) from reservation_list where customer_no=?";

PreparedStatement ps = con.prepareStatement(sql);
ps.setInt(1, member_no);
ResultSet rs = ps.executeQuery();
rs.next();
int count = rs.getInt(1);
con.close();
return count;
}




	
	
	}
