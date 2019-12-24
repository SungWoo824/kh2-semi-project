package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDao {

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
//							회원가입							  //
////////////////////////////////////////////////////////////////	
	public void regist(MemberDto dto) throws Exception {
		Connection con = getConnection();

		String sql = "insert into member values(member_no_seq.nextval,?,?,?,?,?,?,?,sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getPw());
		ps.setString(3, dto.getName());
		ps.setString(4, dto.getGrade());
		ps.setString(5, dto.getBirthday());
		ps.setString(6, dto.getPhone());
		ps.setString(7, dto.getEmail());

		ps.execute();

		con.close();
	}

////////////////////////////////////////////////////////////////
//							멤버로그인							  //
////////////////////////////////////////////////////////////////	
	public boolean login(String id, String pw) throws Exception {
		Connection con = getConnection();
		String sql = "select * from member where member_id = ? and member_pw = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, pw);
		ResultSet rs = ps.executeQuery();

		boolean result = rs.next();

		con.close();
		return result;
	}

	public boolean idCheck(String id) throws Exception {
		Connection con = this.getConnection();
		int result;
		String sql = "select * from member where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		result = ps.executeUpdate();
		con.close();
		return result > 0;

	}

////////////////////////////////////////////////////////////////
//						관리자 회원 목록 조회						  //
////////////////////////////////////////////////////////////////	
	public List<MemberDto> memberList(int start, int finish) throws Exception {
		Connection con = this.getConnection();
		String sql = "select * from( select rownum rn, M.* from (select * from member order by member_no )M )where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, start);
		ps.setInt(2, finish);
		ResultSet rs = ps.executeQuery();

		List<MemberDto> list = new ArrayList<>();

		while (rs.next()) {
			MemberDto dto = new MemberDto();
			dto.setNo(rs.getInt("member_no"));
			dto.setId(rs.getString("member_id"));
			dto.setName(rs.getString("member_name"));
			dto.setGrade(rs.getString("member_grade"));
			dto.setBirthday(rs.getString("member_birthday"));
			dto.setPhone(rs.getString("member_phone"));
			dto.setEmail(rs.getString("member_email"));
			dto.setJoindate(rs.getString("member_joindate"));

			list.add(dto);
		}
		con.close();
		return list;
	}

////////////////////////////////////////////////////////////////
//					관리자 회원 쿠폰 보유수 확인						  //
////////////////////////////////////////////////////////////////
	public int memberCouponNumber(int member_no) throws Exception {
		Connection con = this.getConnection();
		String sql = "select count(*) from havecoupon where member_no = ?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, member_no);
		ResultSet rs = ps.executeQuery();

		rs.next();
		int memberCouponNumber = rs.getInt(1);

		con.close();
		return memberCouponNumber;
	}

////////////////////////////////////////////////////////////////
//					관리자 회원 상세정보 확인						  //
////////////////////////////////////////////////////////////////
	public MemberDto memberInfomation(int member_no) throws Exception {
		Connection con = this.getConnection();
		String sql = "select * from member where member_no = ?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, member_no);
		ResultSet rs = ps.executeQuery();

		rs.next();
		MemberDto dto = new MemberDto();
		dto.setNo(rs.getInt("member_no"));
		dto.setId(rs.getString("member_id"));
		dto.setName(rs.getString("member_name"));
		dto.setGrade(rs.getString("member_grade"));
		dto.setBirthday(rs.getString("member_birthday"));
		dto.setPhone(rs.getString("member_phone"));
		dto.setEmail(rs.getString("member_email"));
		dto.setJoindate(rs.getString("member_joindate"));

		con.close();
		return dto;
	}

////////////////////////////////////////////////////////////////
//					회원 아이디 찾기						  		  //
////////////////////////////////////////////////////////////////
	public String find(String name, String birthday, String phone) throws Exception {
		Connection con = getConnection();
		String sql = "select member_id from member "
				+ "where member_name =? and member_birthday = ? and member_phone = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, birthday);
		ps.setString(3, phone);
		ResultSet rs = ps.executeQuery();

		String id = null;
		if (rs.next()) {
			id = rs.getString("member_id");
		}
		con.close();
		return id;
	}
	
////// 비밀번호 찾기 /////////////
	public boolean find_pw(String id, String name, String phone) throws Exception {
		Connection con = getConnection();
		String sql = "select * from member "
				+ "where member_id =? and member_name = ? and member_phone = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, name);
		ps.setString(3, phone);
		ResultSet rs = ps.executeQuery();
		boolean result = rs.next();

		con.close();
		return result;
	}
	
//아이디로 조회
	public MemberDto memberInfomation(String member_id) throws Exception {

		Connection con = this.getConnection();
		String sql = "select * from member where member_id = ?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, member_id);
		ResultSet rs = ps.executeQuery();

		rs.next();
		MemberDto dto = new MemberDto();
		dto.setNo(rs.getInt("member_no"));
		dto.setId(rs.getString("member_id"));
		dto.setName(rs.getString("member_name"));
		dto.setGrade(rs.getString("member_grade"));
		dto.setBirthday(rs.getString("member_birthday"));
		dto.setPhone(rs.getString("member_phone"));
		dto.setEmail(rs.getString("member_email"));
		dto.setJoindate(rs.getString("member_joindate"));

		con.close();
		return dto;
	}

/////////아이디를 이용해서 회원정보 모두 가져오기 /////////////
	public MemberDto get(String member_id) throws Exception {

		Connection con = this.getConnection();
		String sql = "select * from member where member_id = ?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, member_id);
		ResultSet rs = ps.executeQuery();
		MemberDto dto;
		if (rs.next()) {
			dto = new MemberDto();
			dto.setNo(rs.getInt("member_no"));
			dto.setId(rs.getString("member_id"));
			dto.setName(rs.getString("member_name"));
			dto.setGrade(rs.getString("member_grade"));
			dto.setBirthday(rs.getString("member_birthday"));
			dto.setPhone(rs.getString("member_phone"));
			dto.setEmail(rs.getString("member_email"));

		} else {
			dto = null;
		}

		con.close();

		return dto;
	}

////////////////////////////////////////////////////////////////
//					관리자 -	 사용자 가입일 조회					  //
////////////////////////////////////////////////////////////////
	public List<String[]> userJoindateSearch() throws Exception {
		Connection con = this.getConnection();

		String sql = "select DAY,count(*) from (select to_char(M.member_joindate, 'YYYY-MM-DD') DAY, M.* from member M) where member_grade = '사용자' group by DAY order by DAY desc";
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

////////////////////////////////////////////////////////////////
//					관리자 -	 판매자 가입일 조회					  //
////////////////////////////////////////////////////////////////
	public List<String[]> ownerJoindateSearch() throws Exception {
		Connection con = this.getConnection();

		String sql = "select DAY,count(*) from (select to_char(M.member_joindate, 'YYYY-MM-DD') DAY, M.* from member M) where member_grade = '판매자' group by DAY order by DAY desc";
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

////////////////////////////////////////////////////////////////
//						관리자 -	 회원 목록 검색					  //
////////////////////////////////////////////////////////////////
	public List<MemberDto> memberSearch(String type,String keyword,int start,int finish) throws Exception{
		Connection con = getConnection();
		String sql = "select * from(select rownum rn, M.* from(select * from member where "+type+" like '%'||?||'%' order by member_no)M ) where rs between ? and ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,keyword);
		ps.setInt(2, start);
		ps.setInt(3, finish);
		ResultSet rs = ps.executeQuery();
		
		List<MemberDto> list = new ArrayList<>();
		
		while (rs.next()) {
			MemberDto dto = new MemberDto();
			dto.setNo(rs.getInt("member_no"));
			dto.setId(rs.getString("member_id"));
			dto.setName(rs.getString("member_name"));
			dto.setGrade(rs.getString("member_grade"));
			dto.setBirthday(rs.getString("member_birthday"));
			dto.setPhone(rs.getString("member_phone"));
			dto.setEmail(rs.getString("member_email"));
			dto.setJoindate(rs.getString("member_joindate"));

			list.add(dto);
		}
		con.close();
		return list;
	}

	
////////////////////////////////////////////////////////////////
//					관리자 -	 회원 전체 수 검색					  //
////////////////////////////////////////////////////////////////
	public int memberCount(String type, String keyword) throws Exception{
		Connection con = getConnection();
		String sql = "select count(*) from member";
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
	
	
	///

	public void changeInfo(MemberDto dto) throws Exception {
		Connection con = getConnection();
		String sql = "update member set member_pw=?,member_phone=?,member_email=?,member_birthday=?   where member_id=? and member_pw=?";
		
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getPw());
		ps.setString(2, dto.getPhone());
		ps.setString(3, dto.getEmail());
		ps.setString(4, dto.getBirthday());
		ps.setString(5, dto.getId());
		ps.setString(6, dto.getPw());
		
		ps.execute();
		
		con.close();
	}
	
	//////회원정보수정
	public int ci(MemberDto dto , String newpw) throws Exception {
		Connection con = getConnection();
		String sql = "update member set member_pw=?,member_phone=?,member_email=?,member_birthday=?   where member_id=? and member_pw=?";
		
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, newpw);
		ps.setString(2, dto.getPhone());
		ps.setString(3, dto.getEmail());
		ps.setString(4, dto.getBirthday());
		ps.setString(5, dto.getId());
		ps.setString(6, dto.getPw());
		
		int result= ps.executeUpdate();
		
		
		con.close();
		return result;
	}

}
