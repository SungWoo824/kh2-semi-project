package qa.been;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class QaReplyDao {


	private static DataSource source;

	static {
		try {
			InitialContext ctx = new InitialContext();//[1]
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");			
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
	}
	public Connection getConnection() throws Exception{
		return source.getConnection();
	}
	
	public void Insert(QaReplyDto dto) throws Exception{
		
		Connection con = getConnection();
		String sql = "insert INTO qa_reply values(qa_reply_no_seq.nextval,?,?,?,sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getQa_no());
		ps.setInt(2, dto.getMember_no());
		ps.setString(3, dto.getQa_reply_content());
		ps.execute();
		con.close();
	}
	
	public List<QaReplyDto> select(int qa_no)throws Exception{
		
		List<QaReplyDto> list = new ArrayList<>();
		Connection con = getConnection();
		String sql = "select * from qa_reply where qa_no=? order by qa_no";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, qa_no);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			QaReplyDto dto = new QaReplyDto();
			dto.setQa_reply_no(rs.getInt("qa_reply_no"));
			dto.setQa_no(rs.getInt("qa_no"));
			dto.setMember_no(rs.getInt("member_no"));
			dto.setQa_reply_content(rs.getString("qa_reply_content"));
			dto.setQa_reply_wdate(rs.getString("qa_reply_wdate"));
			list.add(dto);
		}
		con.close();
		
		return list;
	}
	
	public QaReplyDto get(int qa_reply_no)throws Exception{
		
		Connection con = getConnection();
		String sql = "select * from qa_reply where qa_reply_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, qa_reply_no);
		ResultSet rs = ps.executeQuery();
		QaReplyDto dto = new QaReplyDto();
		if(rs.next()) {

			dto.setQa_reply_no(rs.getInt("qa_reply_no"));
			dto.setQa_no(rs.getInt("qa_no"));
			dto.setMember_no(rs.getInt("member_no"));
			dto.setQa_reply_content(rs.getString("qa_reply_content"));
			dto.setQa_reply_wdate(rs.getString("qa_reply_wdate"));
		}
		con.close();
		
		return dto;
	}
	
	public void delete(int qa_no) throws Exception{
		
		Connection con = getConnection();
		String sql = "delete qa_reply where qa_reply_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, qa_no);
		ps.execute();
		con.close();
	}
}
