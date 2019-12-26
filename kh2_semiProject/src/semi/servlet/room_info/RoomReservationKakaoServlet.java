package semi.servlet.room_info;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


@WebServlet(urlPatterns = "/hostel/room_reservation_kakao.do")
public class RoomReservationKakaoServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			
			//카카오페이 api
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK 4f0ba4e9f70eafa42710fac2e2ec5692");
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
			conn.setDoInput(true);
			conn.setDoOutput(true);
			//보낼 값들 Map 형식으로 작성
			Map<String, String> params = new HashMap<>();
			params.put("cid", "TC0ONETIME");
			params.put("partner_order_id", req.getParameter("hostel_no"));
			params.put("partner_user_id", req.getParameter("cutomer_no"));
			params.put("item_name", req.getParameter("room_no"));
			params.put("quantity", req.getParameter("until"));
			params.put("total_amount", req.getParameter("total_price"));
			params.put("tax_free_amount", "0");
			params.put("approval_url", "http://localhost:8080/hostel/room_reservation.do");
			params.put("cancel_url", "http://localhost:8080/hostel/room_reservation_cancel.do");
			params.put("fail_url", "http://localhost:8080/hostel/room_reservation_error.do");
			
			String string_params = new String();
			for(Map.Entry<String, String> elem : params.entrySet()) {
				string_params +=(elem.getKey() +"="+elem.getValue()+"&");
			}
			
			conn.getOutputStream().write(string_params.getBytes());
			
			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject)parser.parse(in);
			
			String successUrl = (String)obj.get("next_redirect_pc_url");
			
			resp.sendRedirect(successUrl);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
