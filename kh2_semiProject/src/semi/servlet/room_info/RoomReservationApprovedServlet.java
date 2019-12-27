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



@WebServlet(urlPatterns = "/hostel/room_reservation_Approved.do")
public class RoomReservationApprovedServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String tid = req.getParameter("tid");
			String pg_token = req.getParameter("pg_token");
			String partner_order_id = req.getParameter("partner_order_id");
			String partner_user_id = req.getParameter("partner_user_id");
			
			URL url = new URL("https://kapi.kakao.com/v1/payment/approve");
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "KakaoAK 4f0ba4e9f70eafa42710fac2e2ec5692");
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			con.setDoInput(true);
			con.setDoOutput(true);
			
			Map<String, String> params = new HashMap<>();
			params.put("cid", "TC0ONETIME");
			params.put("tid", tid);
			params.put("partner_order_id", partner_order_id);
			params.put("partner_user_id", partner_user_id);
			params.put("pg_token", pg_token);
			
			String string_params = new String();
			for(Map.Entry<String, String> elem : params.entrySet()) {
				string_params +=(elem.getKey()+"="+elem.getValue()+"&");
			}
			
			con.getOutputStream().write(string_params.getBytes());
			
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject)parser.parse(in);
			
			
			
//			cid	가맹점 코드. 10자.	O	String
//			cid_secret	가맹점 코드 인증키. 24자 숫자+영문 소문자	X	String
//			tid	결제 고유번호. 결제준비 API의 응답에서 얻을 수 있음	O	String
//			partner_order_id	가맹점 주문번호. 결제준비 API에서 요청한 값과 일치해야 함	O	String
//			partner_user_id	가맹점 회원 id. 결제준비 API에서 요청한 값과 일치해야 함	O	String
//			pg_token	결제승인 요청을 인증하는 토큰. 사용자가 결제수단 선택 완료시 approval_url로 redirection해줄 때 pg_token을 query string으로 넘겨줌	O	String
//			payload	해당 Request와 매핑해서 저장하고 싶은 값. 최대 200자	X	String
//			total_amount	상품총액. 결제준비 API에서 요청한 total_amount 값과 일치해야 함	X	Integer
			
		} catch (Exception e) {
			
		}
	}
	
}
