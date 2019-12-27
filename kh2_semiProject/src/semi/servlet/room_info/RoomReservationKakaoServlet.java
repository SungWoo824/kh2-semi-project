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

import beans.KakaoPayDao;
import beans.ReservationDto;


@WebServlet(urlPatterns = "/hostel/room_reservation_kakao.do")
public class RoomReservationKakaoServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			//reservationdto 세션에 저장
			ReservationDto roomReservationDto = new ReservationDto();
			roomReservationDto.setRoom_no(Integer.parseInt(req.getParameter("room_no")));
			roomReservationDto.setCustomer_no(Integer.parseInt(req.getParameter("customer_no")));		
			roomReservationDto.setReservation_start_date(req.getParameter("reservation_start_date"));
			roomReservationDto.setReservation_finish_date(req.getParameter("reservation_finish_date"));
			roomReservationDto.setCustomer_count(Integer.parseInt(req.getParameter("customer_count")));
			roomReservationDto.setCustomer_request(req.getParameter("customer_request"));
			roomReservationDto.setHostel_no(Integer.parseInt(req.getParameter("hostel_no")));
			
			////세션 dto 적용
			req.getSession().setAttribute("roomReservationDto", roomReservationDto);
			
			String partner_order_id = req.getParameter("hostel_no");
			String partner_user_id = req.getParameter("customer_no");
			
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
			params.put("partner_order_id", partner_order_id);
			params.put("partner_user_id", partner_user_id);
			params.put("item_name", req.getParameter("room_no"));
			params.put("quantity", req.getParameter("until"));
			params.put("total_amount", req.getParameter("total_price"));
			params.put("tax_free_amount", "0");
			params.put("approval_url", "http://localhost:8080/kh2_semiProject/hostel/room_reservation_approved.do");
			params.put("cancel_url", "http://localhost:8080/kh2_semiProject/hostel/room_reservation_cancel.do");
			params.put("fail_url", "http://localhost:8080/kh2_semiProject/hostel/room_reservation_error.do");
			
			String string_params = new String();
			for(Map.Entry<String, String> elem : params.entrySet()) {
				string_params +=(elem.getKey() +"="+elem.getValue()+"&");
			}
			
			conn.getOutputStream().write(string_params.getBytes());
			
			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject)parser.parse(in);
			
			String tid = (String) obj.get("tid");
			String cid = "TC0ONETIME";
			
			int total_amount = Integer.parseInt(req.getParameter("total_price"));
			int tax_free_amount = 0;
			
			
			KakaoPayDao kakaoPayDao = new KakaoPayDao();
			kakaoPayDao.kakaoPayProceed(tid, cid, total_amount, tax_free_amount);
			req.getSession().setAttribute("tid", tid);
			req.getSession().setAttribute("partner_order_id", partner_order_id);
			req.getSession().setAttribute("partner_user_id", partner_user_id);
			
			String successUrl = (String)obj.get("next_redirect_pc_url");
			resp.sendRedirect(successUrl);
//			+"&cid="+cid+"&tid="+tid+"&partner_order_id="+partner_order_id+"&partner_user_id="+partner_user_id+"&pg_token="+pg_token
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
