package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class VisitDao {
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

	private static VisitDao instance;
	    
	  
	    private VisitDao(){}
	    public static VisitDao getInstance(){
	        if(instance==null)
	            instance=new VisitDao();
	        return instance;
	    }



	
	public void setVisitTotalCount() throws Exception {
		Connection con = getConnection();
		String sql = "INSERT INTO VISIT (V_DATE) VALUES (sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.executeUpdate();
		
		con.commit();
		con.close();
	}
	
	public int getVisitTotalCount() throws Exception{
		Connection con = getConnection();
		String sql = "select count(*) from visit";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		int visitor = rs.getInt("count(*)");
		System.out.println(visitor);
		con.close();
		return visitor;
	}
	
	public int getVisitTodayCount() throws Exception{
		Connection con = getConnection();
		String sql = "select count(*) from visit where substr(to_char(v_date), 1, 9) = to_date(sysdate, 'yy/MM/dd')";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		int todayVisitor = rs.getInt("count(*)");
		con.close();
		return todayVisitor;
	}

	
}
