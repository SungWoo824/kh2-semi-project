package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
	
	public boolean regist(MemberDto dto) throws Exception {
		Connection con = this.getConnection();
		int result=0;
		String sql = "insert into member values(member_no_seq.nexval,?,?,?,?,?,?,?)";
		
		if(idCheck(dto.getId())) {
			result = 0;
		} else {
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getPw());
		ps.setString(3, dto.getName());
		ps.setString(4, dto.getGrade());
		ps.setString(5, dto.getBirthday());
		ps.setString(6, dto.getPhone());
		ps.setString(7, dto.getEmail());
		result = ps.executeUpdate();
		
		con.close();
		}
		return result>0;
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
}
