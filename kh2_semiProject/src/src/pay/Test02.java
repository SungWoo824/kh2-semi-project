package src.pay;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
public class Test02 {
	public static void main(String[] args) throws IOException {
//		결제를 하기 위해 반드시 알아야 하는 내용
//		 -> 서버에서 서버로 통신을 보낸 수 있어야함
//		 -> 우리 서버에서 PG사 서버로 통신을 보내서 처리해야하므로
//		 -> Spring에서는 RestTemplate을 사용
//		 -> JSP에서는 그게 없어서 HttpConnection 사용
		
//		ex : 다음 메인페이지를 긁어오는 프로그램
		URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
		
		URLConnection urlConnection = url.openConnection();
		HttpURLConnection httpConnection = (HttpURLConnection)urlConnection;

		//신호 보내기 전 설정
		httpConnection.setRequestMethod("POST");
		httpConnection.setRequestProperty("Authorization", "KakaoAK 35fa20f25ea37935f657e69b289db050");
		httpConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		httpConnection.setRequestProperty("Accept", "application/json;charset=UTF-8");
		
		//파라미터 추가
		httpConnection.setDoOutput(true);//내보내기 허용
		OutputStream out = httpConnection.getOutputStream();
		String body = 
				"cid=TC0ONETIME" + 
				"&partner_order_id=1000" + 
				"&partner_user_id=kh" + 
				"&item_name=초코파이" + 
				"&quantity=1" + 
				"&total_amount=2200" + 
				"&vat_amount=200" + 
				"&tax_free_amount=0" + 
				"&approval_url=https://developers.kakao.com/success" + 
				"&fail_url=https://developers.kakao.com/fail" + 
				"&cancel_url=https://developers.kakao.com/cancel";
		out.write(body.getBytes("UTF-8"));
		
		//신호 결과를 받는 코드
		int responseCode = httpConnection.getResponseCode();
		String responseMessage = httpConnection.getResponseMessage();
		
		System.out.println("responseCode = "+responseCode);
		System.out.println("responseMessage = "+responseMessage);
		
		//실제 읽어온 내용
		InputStream in = httpConnection.getInputStream();
		
		StringBuffer buffer = new StringBuffer();//String 합성도구
		byte[] by = new byte[1024];
		while(true) {
			int size = in.read(by);
			if(size == -1) break;
			buffer.append(new String(by, 0, size));
		}
		
		httpConnection.disconnect();
		
		System.out.println("---------------------------");
		
		System.out.println(buffer.toString());
	}
}
