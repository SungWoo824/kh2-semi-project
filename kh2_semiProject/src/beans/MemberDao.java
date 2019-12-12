package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
	
	public Connection getConnection() throws Exception{
		return source.getConnection();
	}
////////////////////////////////////////////////////////////////
//							회원가입							  //
////////////////////////////////////////////////////////////////	
	public void regist(MemberDto dto)throws Exception{
		Connection con = getConnection();
		
		String sql="insert into member values("
				+ "member_no_seq.nextval,?,?,?,'사용자',sysdate,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getPw());
		ps.setString(3, dto.getName());
		ps.setString(4, dto.getPhone());
		ps.setString(5, dto.getEmail());
		
		ps.execute();
		
		con.close();
	}
	public boolean idCheck(String id) throws Exception{
		Connection con = this.getConnection();
		int result;
		String sql = "select * from member where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, id);
		result = ps.executeUpdate();
		
		return result>0;
	}
	
////////////////////////////////////////////////////////////////
//						관리자 회원 목록 조회						  //
////////////////////////////////////////////////////////////////	
	public List<MemberDto> memberList() throws Exception{
		Connection con = this.getConnection();
		String sql = "select * from member";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<MemberDto> list = new ArrayList<>();
		
		while(rs.next()) {
			MemberDto dto = new MemberDto();
			dto.setNo(rs.getInt("member_no"));
			dto.setId(rs.getString("member_id"));
			dto.setName(rs.getString("member_name"));
			dto.setGrade(rs.getString("member_grade"));
			dto.setBirthday(rs.getString("member_birthday"));
			dto.setPhone(rs.getString("member_phone"));
			dto.setEmail(rs.getString("member_email"));
			
			list.add(dto);
		}
		return list;
	}
	
////////////////////////////////////////////////////////////////
//					관리자 회원 쿠폰 보유수 확인						  //
////////////////////////////////////////////////////////////////
	public int memberCouponNumber(int member_no) throws Exception{
		Connection con = this.getConnection();
		String sql = "select count(*) from havecoupon where member_no = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, member_no);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		int memberCouponNumber = rs.getInt(1);
		
		return memberCouponNumber;
	}
}
		
		
		
	
