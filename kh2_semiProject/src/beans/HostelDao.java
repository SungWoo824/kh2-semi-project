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
	///	판매자 - 숙소 등록 기능(이가영)		시작			///
	///////////////////////////////////////////////////////////////
	
	public void regist(HostelDto dto) throws Exception {

		Connection con = getConnection();
		String sql = "insert into hostel values(?,?,?,?,?,?,?,?,?,?,sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, dto.getHostel_no());
		ps.setInt(2, dto.getOwner_no());
		ps.setInt(3, dto.getRegion_no());
		ps.setString(4, dto.getHostel_name());
		ps.setString(5, dto.getHostel_phone());
		ps.setString(6, dto.getHostel_detail_addr());
		ps.setString(7, dto.getHostel_latitude());
		ps.setString(8, dto.getHostel_longitude());
		ps.setString(9, dto.getHostel_content());
		ps.setString(10, dto.getHostel_kind_name());

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
	
	// hostel_no 받아오는 메소드(files에 저장할 hostel_no)
		public int getHostelNo() throws Exception{
			
			Connection con = getConnection();
			String sql = "select hostel_no_seq.nextval from dual";
			PreparedStatement ps = con.prepareStatement(sql);
					
			ResultSet rs = ps.executeQuery();
				
			rs.next();
			int hostel_no = rs.getInt(1);
					
			con.close();
			return hostel_no;
		}
	/////////////////////////////////////////////////////////////////
	///	판매자 - 숙소 등록 기능(이가영)		끝				///
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

//////////////////////////////////////////////////////////////////////////////////////////
///	판매자 - 숙소 설명(hostel_content) 등록 기능(이가영)		시작			///
/////////////////////////////////////////////////////////////////////////////////////////

	//regist_hostel로 합쳤습니다.//

//////////////////////////////////////////////////////////////////////////////////////////
///	판매자 - 숙소 설명(hostel_content) 등록 기능(이가영)		끝			///
/////////////////////////////////////////////////////////////////////////////////////////

	
//호스텔 번호로 호스텔이름 구하기

		public String hostelname(int hostel_no) throws Exception {

			Connection con = this.getConnection();
			String sql = "select hostel_name from hostel where hostel_no = ?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, hostel_no);
			ResultSet rs = ps.executeQuery();

			String hostel_name = null;
			if(rs.next()) {
//				
				hostel_name=rs.getString("hostel_name"); //나오는 값이 1개니까
			}
			
			con.close();
			return hostel_name;
		
			
		}
/////////////////////////////////////////////////////////////////
///						사용자 호스텔 검색						   ///
///////////////////////////////////////////////////////////////
		public List<HostelDto> userSearchHostel(String check_in, String check_out, String location, int people) throws Exception{
			Connection con = this.getConnection();
//			check_in = start_day
//			check_out = finish_day
//			location = 목적지 (region_name + city_name)
//			people = 성인 + (아동/2+1);

//			[1]check_in [2]check_out [3]people [4]region_name [5]city_name
			String sql = 
					"SELECT DISTINCT * FROM hostel H " +
						"INNER JOIN ( "	+
							"SELECT hostel_no FROM room_info RI "+
								"WHERE RI.room_no NOT IN " +
									"(SELECT room_no FROM reservation_list " + 
										"WHERE ( " +
											"(to_date(?) between to_char(reservation_start_date, 'YY/MM/DD') " +
												"and to_char(reservation_finish_date, 'YY/MM/DD')) " +
											"or (to_date(?) between to_char(reservation_start_date, 'YY/MM/DD') " +
												"and to_char(reservation_finish_date, 'YY/MM/DD')) " +
									")) and ? <= room_max_people) HN " +
						"ON H.hostel_no = HN.hostel_no " +
						"INNER JOIN " +
							"(SELECT R.region_no FROM region R ";	

//			포맷 변경
			String[] str = location.split(" ");
			String region_name = str[0];
			String city_name = "";
			
			PreparedStatement ps;
	
		
			if(str.length<=1) {
				sql += "WHERE R.region_name LIKE '%'||?||'%') RN " +
						"ON H.region_no = RN.region_no ";
				ps = con.prepareStatement(sql);
				ps.setString(1, check_in);
				ps.setString(2, check_out);
				ps.setInt(3, people);
				ps.setString(4, region_name);
//				System.out.println("1번실행");
			} else{
				city_name = str[1];
				sql += "WHERE R.region_name LIKE '%'||?||'%' and R.city_name LIKE '%'||?||'%') RN " +
						"ON H.region_no = RN.region_no ";
				ps = con.prepareStatement(sql);
				ps.setString(1, check_in);
				ps.setString(2, check_out);
				ps.setInt(3, people);
				ps.setString(4, region_name);
				ps.setString(5, city_name);
//				System.out.println("2번실행");
			}
			
//			System.out.println("region : " + region_name);
//			System.out.println("city : " + city_name);
			
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

}
