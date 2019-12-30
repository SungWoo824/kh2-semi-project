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

	public Connection getConnection() throws Exception {
		return source.getConnection();
	}

	////////////////////////////////////////////////////////////////
	// 예약 목록 조회 //
	////////////////////////////////////////////////////////////////
	public List<ReservationDto> list(int member_no) throws Exception {

		Connection con = this.getConnection();
		String sql = "select * from reservation_list  where customer_no=? order by reservation_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, member_no);
		ResultSet rs = ps.executeQuery();

		List<ReservationDto> list = new ArrayList<>();

		while (rs.next()) {
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

	public ReservationDto get() throws Exception {

		Connection con = this.getConnection();
		String sql = "select * from reservation_list";

		PreparedStatement ps = con.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();

		ReservationDto rdto = new ReservationDto();
		if (rs.next()) {
			rdto.setReservation_no(rs.getInt("reservation_no"));
			rdto.setRoom_no(rs.getInt("room_no"));
			rdto.setCustomer_no(rs.getInt("customer_no"));
			rdto.setCustomer_count(rs.getInt("customer_count"));
			rdto.setCustomer_request(rs.getString("customer_request"));
			rdto.setReservation_start_date(rs.getString("reservation_start_date"));
			rdto.setReservation_until(rs.getInt("reservation_until"));
		} else {
			rdto = null;
		}

		con.close();

		return rdto;
	}

	public ReservationDto getRoomname(int room_no) throws Exception {

		Connection con = this.getConnection();
		String sql = "select * from reservation_list ";

		PreparedStatement ps = con.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();

		ReservationDto rdto = new ReservationDto();
		if (rs.next()) {
			rdto.setReservation_no(rs.getInt("reservation_no"));
			rdto.setRoom_no(rs.getInt("room_no"));
			rdto.setCustomer_no(rs.getInt("customer_no"));
			rdto.setCustomer_count(rs.getInt("customer_count"));
			rdto.setCustomer_request(rs.getString("customer_request"));
			rdto.setReservation_start_date(rs.getString("reservation_start_date"));
			rdto.setReservation_until(rs.getInt("reservation_until"));
		} else {
			rdto = null;
		}

		con.close();

		return rdto;
	}

////////////////////////////////////////////////////////////////
//예약 목록 조회						  //
////////////////////////////////////////////////////////////////

	public List<ReservationDto> list(int member_no, int startblock, int finishblock) throws Exception {
		Connection con = this.getConnection();
		String sql = "select * from(select ROWNUM rn, A.* from (select * from reservation_list  where customer_no=?)A order by reservation_no desc) where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, member_no);
		ps.setInt(2, startblock);
		ps.setInt(3, finishblock);
		ResultSet rs = ps.executeQuery();

		List<ReservationDto> list = new ArrayList<>();

		while (rs.next()) {
			ReservationDto dto = new ReservationDto();

			dto.setReservation_no(rs.getInt("reservation_no"));
			dto.setRoom_no(rs.getInt("room_no"));
			dto.setCustomer_no(rs.getInt("customer_no"));
			dto.setCustomer_count(rs.getInt("customer_count"));
			dto.setCustomer_request(rs.getString("customer_request"));
			dto.setReservation_start_date(rs.getString("reservation_start_date"));
			dto.setReservation_finish_date(rs.getString("reservation_finish_date"));
dto.setHostel_no(rs.getInt("hostel_no"));
			list.add(dto);
			
		}
		con.close();
		return list;
	}

//회원별 예약개수 구하기
	public int Count(int member_no) throws Exception {
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

////////////////////////////////////////////////////////////////
//								예약 하기						  //
////////////////////////////////////////////////////////////////

	public void roomReservation(ReservationDto rdto) throws Exception {
		Connection con = getConnection();

		String sql = "insert into reservation_list values" + "(reservation_no_seq.nextval,?,?,?,?,?,?,?)";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, rdto.getRoom_no());
		ps.setInt(2, rdto.getCustomer_no());
		ps.setInt(3, rdto.getCustomer_count());
		ps.setString(4, rdto.getCustomer_request());
		ps.setString(5, rdto.getReservation_start_date());
		ps.setInt(6, rdto.getHostel_no());
		ps.setString(7, rdto.getReservation_finish_date());

		ps.execute();

		con.close();

	}
////////////////////////////////////////////////////////////////
//						관리자 예약전체 조회						  //
////////////////////////////////////////////////////////////////

	public List<ReservationDto> masterReservationList(int start, int finish) throws Exception {
		Connection con = getConnection();
		String sql = "select * from(select rownum rn, RL.* from(select * from reservation_list order by reservation_no desc)RL) where rn between ? and ?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, start);
		ps.setInt(2, finish);
		ResultSet rs = ps.executeQuery();

		List<ReservationDto> list = new ArrayList<>();
		while (rs.next()) {
			ReservationDto rdto = new ReservationDto();

			rdto.setReservation_no(rs.getInt("reservation_no"));
			rdto.setRoom_no(rs.getInt("room_no"));
			rdto.setCustomer_no(rs.getInt("customer_no"));
			rdto.setCustomer_count(rs.getInt("customer_count"));
			rdto.setCustomer_request(rs.getString("customer_request"));
			rdto.setReservation_start_date(rs.getString("reservation_start_date"));
			rdto.setReservation_finish_date(rs.getString("reservation_finish_date"));

			list.add(rdto);
		}
		con.close();

		return list;
	}

////////////////////////////////////////////////////////////////
//						관리자 예약목록 검색						  //
////////////////////////////////////////////////////////////////
	public List<ReservationDto> masterReservationSearch(String type, String keyword, int start, int finish)
			throws Exception {
		Connection con = getConnection();
		String sql = "select * from(select rownum rn, RS.* form(select * from reservation_list where " + type
				+ " like '%'||?||'%' order by reservation_no desc)RL) where rn between ? and ?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, start);
		ps.setInt(3, finish);

		ResultSet rs = ps.executeQuery();
		List<ReservationDto> list = new ArrayList<>();

		while (rs.next()) {
			ReservationDto rdto = new ReservationDto();

			rdto.setReservation_no(rs.getInt("reservation_no"));
			rdto.setRoom_no(rs.getInt("room_no"));
			rdto.setCustomer_no(rs.getInt("customer_no"));
			rdto.setCustomer_count(rs.getInt("customer_count"));
			rdto.setCustomer_request(rs.getString("customer_request"));
			rdto.setReservation_start_date(rs.getString("reservation_start_date"));
			rdto.setReservation_until(rs.getInt("reservation_until"));

			list.add(rdto);
		}
		con.close();

		return list;
	}

	public int masterReservationCount(String type, String keyword) throws Exception {
		Connection con = getConnection();
		String sql = "select count(*) from reservation_list";
		boolean isSearch = type != null && keyword != null;

		if (isSearch) {
			sql += "where " + type + " like '%'||?||'%'";
		}
		PreparedStatement ps = con.prepareStatement(sql);
		if (isSearch) {
			ps.setString(1, keyword);
		}
		ResultSet rs = ps.executeQuery();
		rs.next();

		int count = rs.getInt(1);

		con.close();

		return count;
	}
	
/////////////////////////////////////////////////////////////////
///							숙박 일 계산							  //
///////////////////////////////////////////////////////////////
	public int until(String start_date, String finish_date) throws Exception{
		Connection con = this.getConnection();
		String sql = "SELECT to_date(?,'YY/MM/DD') - TO_DATE(?, 'YY/MM/DD') FROM DUAL";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(2, start_date);
		ps.setString(1, finish_date);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		int until = rs.getInt(1);
		
		con.close();
		return until;
	}
	
/////////////////////////////////////////////////////////////////
///							최신예약 시퀀스번호 받기					  //
///////////////////////////////////////////////////////////////
	public int searchSeq() throws Exception{
		Connection con = this.getConnection();
		String sql = "select reservation_no_seq.currval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		int seq = rs.getInt(1);
		
		con.close();
		return seq;
		
	}

	
}
