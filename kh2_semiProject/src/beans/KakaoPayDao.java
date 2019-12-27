package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class KakaoPayDao {
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
//						1차 결제정보 등록							  //
////////////////////////////////////////////////////////////////
	
	public void kakaoPayProceed(String tid,String cid,int total_amount,int tax_free_amount) throws Exception{
		Connection con = this.getConnection();
		String sql = "insert into kakaopay(kakaopay_no,kakaopay_tid,kakaopay_cid,kakaopay_total_amount,kakaopay_tax_free_amount) values(kakaopay_no_seq.nextval,?,?,?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, tid);
		ps.setString(2, cid);
		ps.setInt(3, total_amount);
		ps.setInt(4, tax_free_amount);
		ps.execute();
		
		con.close();
	}
	
////////////////////////////////////////////////////////////////
//						결제 완료 정보등록							  //
////////////////////////////////////////////////////////////////
	
	public void kakaoPayFinish(int reservation_no, String cid) throws Exception{
		Connection con = this.getConnection();
		String sql = "update kakaopay set kakaopay_reservation_no=? where kakaopay_cid = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, reservation_no);
		ps.setString(2, cid);
		ps.execute();
		
		con.close();
	}
	public void kakaoPayCancel(String tid) throws Exception{
		Connection con = this.getConnection();
		String sql = "delete from kakaopay where kakaopay_tid = ?";
		
		PreparedStatement ps =con.prepareStatement(sql);
		ps.setString(1, tid);
		ps.execute();
		
		con.close();
	}
}
