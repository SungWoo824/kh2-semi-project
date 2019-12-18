package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class RoomInfoDao {

//	무조건 연결 기능은 있어야 한다... 다른데 있는 기능을 쓸 수 없다(의존성)

	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection(
				"jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh24", "kh24");
		return con;

	}

	// 등록기능

	public void regist(RoomInfoDto dto) throws Exception {
		
		Connection con = getConnection();
		String sql = "insert into room_info values(room_no_seq.nextval,2,2,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, dto.getRoom_price());
		ps.setInt(2, dto.getRoom_standard_people());
		ps.setInt(3, dto.getRoom_max_people());
		ps.setInt(4, dto.getRoom_bed());
		ps.setInt(5, dto.getRoom_bath());
		ps.setString(6, dto.getRoom_spa());
		ps.setString(7, dto.getRoom_cook());
		ps.setString(8, dto.getRoom_content());
		ps.setString(9, dto.getRoom_parking());
		ps.setString(10, dto.getRoom_pet());
		ps.setString(11, dto.getRoom_breakfast());
		ps.setString(12, dto.getRoom_basic());
		ps.setString(13, dto.getRoom_tv());
		ps.setString(14, dto.getRoom_dry());
		ps.setString(15, dto.getRoom_cool());
		ps.setString(16, dto.getRoom_hot());

		ps.execute();

		con.close();

	}
}