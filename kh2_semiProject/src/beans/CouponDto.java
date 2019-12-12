package beans;

public class CouponDto {
	private int coupon_no;
	private String coupon_name;
	private int coupon_rate;
	private String coupon_date;
	private String coupon_explain;
	
	public CouponDto() {
		super();
	}
	
	public CouponDto(int coupon_no, String coupon_name, int coupon_rate, String coupon_date, String coupon_explain) {
		super();
		this.coupon_no = coupon_no;
		this.coupon_name = coupon_name;
		this.coupon_rate = coupon_rate;
		this.coupon_date = coupon_date;
		this.coupon_explain = coupon_explain;
	}
	public int getCoupon_no() {
		return coupon_no;
	}
	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public int getCoupon_rate() {
		return coupon_rate;
	}
	public void setCoupon_rate(int coupon_rate) {
		this.coupon_rate = coupon_rate;
	}
	public String getCoupon_date() {
		return coupon_date;
	}
	public void setCoupon_date(String coupon_date) {
		this.coupon_date = coupon_date;
	}
	public String getCoupon_explain() {
		return coupon_explain;
	}
	public void setCoupon_explain(String coupon_explain) {
		this.coupon_explain = coupon_explain;
	}
	
	
	
}
