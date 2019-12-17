package beans;

import java.sql.Connection;		
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.sun.xml.internal.ws.wsdl.writer.document.Types;

public class QaDao {

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
	//글쓰기
	public boolean write(QaDto dto) throws Exception{
		
		boolean regist = false;
		Connection con = getConnection();
		String sql = "insert into qa VALUES(?,?,?,?,?,?,sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getQa_no());
		ps.setInt(2, dto.getRoom_no());
		ps.setInt(3, dto.getMember_no());
		ps.setString(4, dto.getQa_head());
		ps.setString(5, dto.getQa_title());
		ps.setString(6, dto.getQa_content());

		ps.execute();
//		int result = ps.getUpdateCount();
//		if(result>0) {
//			regist=true;
//		}
		con.close();
		return regist;
	}
//Q&A목록 가져오기
	public List<QaDto> list() throws Exception{
		
		List<QaDto> list = new ArrayList<>();
		Connection con = getConnection();
		String sql = "select * from qa";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			QaDto dto = new QaDto();
			dto.setQa_no(rs.getInt("qa_no"));
			dto.setRoom_no(rs.getInt("room_no"));
			dto.setMember_no(rs.getInt("member_no"));
			dto.setQa_head(rs.getString("qa_head"));
			dto.setQa_title(rs.getString("qa_title"));
			dto.setQa_content(rs.getString("qa_content"));
			dto.setQa_wdate(rs.getString("qa_wdate"));
			list.add(dto);
		}
		con.close();
		return list;	
	}
	//검색한 목록 가져오기
	public List<QaDto> search(String type,String keyword) throws Exception{
		
		List<QaDto> list = new ArrayList<>();
		Connection con = getConnection();
		String sql = "select * from qa where"+type+"= ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			QaDto dto = new QaDto();
			dto.setQa_no(rs.getInt("qa_no"));
			dto.setRoom_no(rs.getInt("room_no"));
			dto.setMember_no(rs.getInt("member_no"));
			dto.setQa_head(rs.getString("qa_head"));
			dto.setQa_title(rs.getString("qa_title"));
			dto.setQa_content(rs.getString("qa_content"));
			dto.setQa_wdate(rs.getString("qa_wdate"));
			list.add(dto);
		}
		con.close();
		return list;	
	}
	
	public int getSequence() throws Exception{
		Connection con = getConnection();
		String sql  = "select qa_no_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int seq = rs.getInt(1);
		con.close();
		
		return seq;
	}
	//QA_NO로 글가져오기
	public QaDto get(int qa_no) throws Exception{
		
		QaDto dto = new QaDto();
		Connection con = getConnection();
		String sql = "select * from qa where qa_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, qa_no);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			dto.setQa_no(rs.getInt("qa_no"));
			dto.setRoom_no(rs.getInt("room_no"));
			dto.setMember_no(rs.getInt("member_no"));
			dto.setQa_head(rs.getString("qa_head"));
			dto.setQa_title(rs.getString("qa_title"));
			dto.setQa_content(rs.getString("qa_content"));
			dto.setQa_wdate(rs.getString("qa_wdate"));
		}
		con.close();
		return dto;	
	}
	//글 수정하기
	public void Edit(QaDto dto) throws Exception {
		Connection con = getConnection();
		String sql = "update qa set room_no=? ,qa_head = ?,qa_title= ?,qa_content=? where qa_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getRoom_no());
		ps.setString(2, dto.getQa_head());
		ps.setString(3, dto.getQa_title());
		ps.setString(4, dto.getQa_content());
		ps.setInt(5, dto.getQa_no());
		ps.execute();
		con.close();
	}
	//글 삭제하기
	public void delete(int qa_no) throws Exception {
		Connection con = getConnection();
		String sql = "delete from qa where qa_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, qa_no);
		ps.execute();
		con.close();
	}
}
