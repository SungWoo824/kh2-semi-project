package beans;

public class KakaoPayDto {
	private int kakaopay_no;
	private String kakaopay_cid;
	private String kakaopay_tid;
	private int kakaopay_amount;
	private int kakao_tax_free_amount;
	private int kakaopay_reservation_no;
	
	public int getKakaopay_no() {
		return kakaopay_no;
	}
	public void setKakaopay_no(int kakaopay_no) {
		this.kakaopay_no = kakaopay_no;
	}
	public String getKakaopay_cid() {
		return kakaopay_cid;
	}
	public void setKakaopay_cid(String kakaopay_cid) {
		this.kakaopay_cid = kakaopay_cid;
	}
	public String getKakaopay_tid() {
		return kakaopay_tid;
	}
	public void setKakaopay_tid(String kakaopay_tid) {
		this.kakaopay_tid = kakaopay_tid;
	}
	public int getKakaopay_amount() {
		return kakaopay_amount;
	}
	public void setKakaopay_amount(int kakaopay_amount) {
		this.kakaopay_amount = kakaopay_amount;
	}
	public int getKakao_tax_free_amount() {
		return kakao_tax_free_amount;
	}
	public void setKakao_tax_free_amount(int kakao_tax_free_amount) {
		this.kakao_tax_free_amount = kakao_tax_free_amount;
	}
	public int getKakaopay_reservation_no() {
		return kakaopay_reservation_no;
	}
	public void setKakaopay_reservation_no(int kakaopay_reservation_no) {
		this.kakaopay_reservation_no = kakaopay_reservation_no;
	}
	
	public KakaoPayDto() {
		super();
	}
	
}
