package beans;

public class CouponDto {
	//줄번호(rownum)을 저장하기 위한 변수 추가
	private int rn;
	private int coupon_no;
	private String coupon_name;
	private int coupon_rate;
	private String coupon_date;
	private String coupon_explain;
	//view : coupon 사용을 위한 변수
	private int havecoupon_no;
	private int member_no;
	private String member_id;
	private String member_name;
	private String member_phone;
	
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
	public CouponDto(int rn, int coupon_no, String coupon_name, int coupon_rate, String coupon_date,
			String coupon_explain) {
		super();
		this.rn = rn;
		this.coupon_no = coupon_no;
		this.coupon_name = coupon_name;
		this.coupon_rate = coupon_rate;
		this.coupon_date = coupon_date;
		this.coupon_explain = coupon_explain;
	}
	
//view : coupon 사용을 위한 생성자 	
	public CouponDto(int rn, int coupon_no, String coupon_name, int coupon_rate, String coupon_date,
			String member_id, String member_name, String member_phone) {
		super();
		this.rn = rn;
		this.coupon_no = coupon_no;
		this.coupon_name = coupon_name;
		this.coupon_rate = coupon_rate;
		this.coupon_date = coupon_date;
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_phone = member_phone;
	}
	
	

	public CouponDto(int rn, int coupon_no, String coupon_name, int coupon_rate, String coupon_date, int havecoupon_no,
			String member_id, String member_name, String member_phone) {
		super();
		this.rn = rn;
		this.coupon_no = coupon_no;
		this.coupon_name = coupon_name;
		this.coupon_rate = coupon_rate;
		this.coupon_date = coupon_date;
		this.havecoupon_no = havecoupon_no;
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_phone = member_phone;
	}
	

	public CouponDto(int rn, int coupon_no, String coupon_name, int coupon_rate, String coupon_date,
			String coupon_explain, int havecoupon_no, String member_id, String member_name, String member_phone) {
		super();
		this.rn = rn;
		this.coupon_no = coupon_no;
		this.coupon_name = coupon_name;
		this.coupon_rate = coupon_rate;
		this.coupon_date = coupon_date;
		this.coupon_explain = coupon_explain;
		this.havecoupon_no = havecoupon_no;
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_phone = member_phone;
	}

	
	public int getRn() {
		return rn;
	}
	public CouponDto(int coupon_no, int havecoupon_no, int member_no, String member_id) {
		super();
		this.coupon_no = coupon_no;
		this.havecoupon_no = havecoupon_no;
		this.member_no = member_no;
		this.member_id = member_id;
	}

	public void setRn(int rn) {
		this.rn = rn;
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

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public int getHavecoupon_no() {
		return havecoupon_no;
	}

	public void setHavecoupon_no(int havecoupon_no) {
		this.havecoupon_no = havecoupon_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	
	
	
	
}
