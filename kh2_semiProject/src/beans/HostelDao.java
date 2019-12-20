package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
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
	
	/////////////////////////////////////////////////////////////////
	///	판매자 - 숙소 등록 기능(이가영)		시작					///
	///////////////////////////////////////////////////////////////
	
	public void regist(HostelDto dto) throws Exception {

		Connection con = getConnection();
		String sql = "insert into hostel values(hostel_no_seq.nextval,?,?,?,?,?,?,?,?,?,sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, dto.getOwner_no());
		ps.setInt(2, dto.getRegion_no());
		ps.setString(3, dto.getHostel_name());
		ps.setString(4, dto.getHostel_phone());
		ps.setString(5, dto.getHostel_detail_addr());
		ps.setString(6, dto.getHostel_latitude());
		ps.setString(7, dto.getHostel_longitude());
		ps.setString(8, dto.getHostel_content());
		ps.setString(9, dto.getHostel_kind_name());

		ps.execute();

		con.close();

	}

	// region_no 받아오는 메소드!!

	public int getRegionNo(String region_name, String city_name) throws Exception {
 
		Connection con = getConnection();
		String sql = "select * from region where region_name = ? and city_name = ?";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, region_name);
		ps.setString(2, city_name);

		ResultSet rs = ps.executeQuery();

		int region_no = 0;

		if (rs.next()) {
			region_no = rs.getInt("region_no");
		}

		con.close();

		return region_no;
	}
	
	// owner_no(member_no) 받아오는 메소드
	public int getOwnerNo(String member_id) throws Exception{
		
		Connection con = getConnection();
		String sql = "select * from member where member_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, member_id);
		
		ResultSet rs = ps.executeQuery();
		
		int owner_no = 0;
		
		if (rs.next()) {
			owner_no = rs.getInt("member_no");
		}
		
		con.close();
		return owner_no;
	}	
	/////////////////////////////////////////////////////////////////
	///	판매자 - 숙소 등록 기능(이가영)		끝					///
	///////////////////////////////////////////////////////////////
	
/////////////////////////////////////////////////////////////////
///						관리자   -   숙소 등록 수 조회				///
///////////////////////////////////////////////////////////////
	public List<String[]> hostelRegistDateSearch() throws Exception {
		Connection con = this.getConnection();

		String sql = "select DAY,count(*) from (select to_char(H.regist_date, 'YYYY-MM-DD') DAY, H.* from hostel H) group by DAY order by DAY desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<String[]> list = new ArrayList<>();

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();
		String todayFormat = formatter.format(today);
		Calendar yesterday = Calendar.getInstance();
		yesterday.add(Calendar.DATE, -1);
		Date yest = yesterday.getTime();
		String yesterdayFormat = formatter.format(yest);

		String[] arr;

		if (rs.next() && !rs.getString("DAY").equals(todayFormat)) {
			arr = new String[2];
			arr[0] = todayFormat;
			arr[1] = "0";
			list.add(arr);
			
			if (!rs.getString("DAY").equals(yesterdayFormat)) {
				arr = new String[2];
				arr[0] = yesterdayFormat;
				arr[1] = "0";
			} else {
				arr = new String[2];
				arr[0] = rs.getString("DAY");
				arr[1] = String.valueOf(rs.getInt("count(*)"));
			}
			list.add(arr);

		} else {
			
			arr = new String[2];
			arr[0] = rs.getString("DAY");
			arr[1] = String.valueOf(rs.getInt("count(*)"));
			list.add(arr);
			rs.next();
			if (!rs.getString("DAY").equals(yesterdayFormat)) {
				arr = new String[2];
				arr[0] = yesterdayFormat;
				arr[1] = "0";
			} else {
				arr = new String[2];
				arr[0] = rs.getString("DAY");
				arr[1] = String.valueOf(rs.getInt("count(*)"));
			}
			list.add(arr);
		}
		con.close();
		return list;
	}

	
}
