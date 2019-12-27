package beans;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ReviewDto {
	
	private int review_no;
	private int reservation_no;
	private int customer_no;
	private int hostel_no;
	private String review_content;
	private int star_point;
	private String review_date;
	private String member_name;

	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public int getReservation_no() {
		return reservation_no;
	}
	public void setReservation_no(int reservation_no) {
		this.reservation_no = reservation_no;
	}
	public int getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}
	public int getHostel_no() {
		return hostel_no;
	}
	public void setHostel_no(int hostel_no) {
		this.hostel_no = hostel_no;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getStar_point() {
		return star_point;
	}
	public void setStar_point(int star_point) {
		this.star_point = star_point;
	}
	
	public String getReview_wdateWithFormat() throws ParseException {
		String time=null;
		if (review_date!=null) {
		SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		Date date = read.parse(review_date);
		SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일");
		time = write.format(date);

			return time;
		}
		return "";
	}
	
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
}
