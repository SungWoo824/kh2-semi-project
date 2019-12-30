package beans;

import java.sql.Connection;	
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class FilesDao {

	private static DataSource source;
	static {
		try {
			InitialContext ctx = new InitialContext();
			source = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
	}
	
//연결메소드	
	public Connection getConnection() throws Exception{
		return source.getConnection();
	}
	
	public void HostelUpload(FilesDto fdto) throws Exception{
		Connection con = getConnection();
		
		String sql = "insert into files("
							+ "file_no, hostel_no, uploadname, savename, filetype, filesize) "
							+ "values(files_no_seq.nextval, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, fdto.getHostel_no());
		ps.setString(2, fdto.getUploadname());
		ps.setString(3, fdto.getSavename());
		ps.setString(4, fdto.getFiletype());
		ps.setLong(5, fdto.getFilesize());
		ps.execute();
		
		con.close();
	}
//	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ아래는 운기자리 입니다.ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	public void ReviewUpload(FilesDto fdto)throws Exception{
		Connection con = getConnection();
		
		String sql = "insert into files(file_no, uploadname, savename, filetype, filesize, review_no) values(files_no_seq.nextval,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, fdto.getUploadname());
		ps.setString(2, fdto.getSavename());
		ps.setString(3, fdto.getFiletype());
		ps.setLong(4, fdto.getFilesize());
		ps.setInt(5, fdto.getReview_no());
		ps.execute();
		con.close();
	}
	
	public void ReviewChange(FilesDto fdto)throws Exception{
		Connection con = getConnection();
		
		String sql = "update files set uploadname=?,savename=?,filetype=?,filesize=? where review_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, fdto.getUploadname());
		ps.setString(2, fdto.getSavename());
		ps.setString(3, fdto.getFiletype());
		ps.setLong(4, fdto.getFilesize());
		ps.setInt(5, fdto.getReview_no());
		ps.execute();
		con.close();
	}
	
	public FilesDto ReviewGet(int review_no) throws Exception {
		Connection con = getConnection();
		
		String sql = "select * from files where review_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, review_no);
		ResultSet rs = ps.executeQuery();
		FilesDto fdto = new FilesDto();
		if(rs.next()) {
			
			fdto.setFlie_no(rs.getInt("File_no"));
			fdto.setUploadname(rs.getString("uploadname"));
			fdto.setSavename(rs.getString("savename"));
			fdto.setFiletype(rs.getString("filetype"));
			fdto.setFilesize(rs.getLong("filesize"));
			fdto.setReview_no(rs.getInt("review_no"));			
		}
		con.close();
		return fdto;
	}
	
	public FilesDto HostelGet(int hostel_no) throws Exception {
		Connection con = getConnection();
		
		String sql = "select * from files where hostel_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, hostel_no);
		ResultSet rs = ps.executeQuery();
		FilesDto fdto = new FilesDto();
		if(rs.next()) {
			
			fdto.setFlie_no(rs.getInt("File_no"));
			fdto.setHostel_no(rs.getInt("hostel_no"));
			fdto.setUploadname(rs.getString("uploadname"));
			fdto.setSavename(rs.getString("savename"));
			fdto.setFiletype(rs.getString("filetype"));
			fdto.setFilesize(rs.getLong("filesize"));		
		}
		con.close();
		return fdto;
	}
}
