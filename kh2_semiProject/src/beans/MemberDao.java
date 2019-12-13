package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
				+ "member_no_seq.nextval,?,?,?,?,?,?,?)";
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
	public boolean login(String id, String pw)throws Exception{
		Connection con = getConnection();
		
		String sql = "select * from member where member_id = ? and member_pw = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, pw);
		ResultSet rs = ps.executeQuery();
		
		boolean result= rs.next();
		
		con.close();
		return result;
	}
	
}
		
		
		
		
		
		
		
		
	
