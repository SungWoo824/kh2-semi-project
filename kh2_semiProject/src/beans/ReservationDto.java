package beans;

public class ReservationDto {

	private int reservation_no;
	private int room_no;
	private int customer_no;
	private int customer_count;
	private String customer_request;
	private String reservation_start_date;
	private int reservation_until;
	private int hostel_no;
	public int getReservation_no() {
		return reservation_no;
	}
	public void setReservation_no(int reservation_no) {
		this.reservation_no = reservation_no;
	}
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public int getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}
	public int getCustomer_count() {
		return customer_count;
	}
	public void setCustomer_count(int customer_count) {
		this.customer_count = customer_count;
	}
	public String getCustomer_request() {
		return customer_request;
	}
	public void setCustomer_request(String customer_request) {
		this.customer_request = customer_request;
	}
	public String getReservation_start_date() {
		return reservation_start_date;
	}
	public void setReservation_start_date(String reservation_start_date) {
		this.reservation_start_date = reservation_start_date;
	}
	public int getReservation_until() {
		return reservation_until;
	}
	public void setReservation_until(int reservation_until) {
		this.reservation_until = reservation_until;
	}
	public int getHostel_no() {
		return hostel_no;
	}
	public void setHostel_no(int hostel_no) {
		this.hostel_no = hostel_no;
	}
	public ReservationDto(int reservation_no, int room_no, int customer_no, int customer_count, String customer_request,
			String reservation_start_date, int reservation_until, int hostel_no) {
		super();
		this.reservation_no = reservation_no;
		this.room_no = room_no;
		this.customer_no = customer_no;
		this.customer_count = customer_count;
		this.customer_request = customer_request;
		this.reservation_start_date = reservation_start_date;
		this.reservation_until = reservation_until;
		this.hostel_no = hostel_no;
	}
	public ReservationDto() {
		super();
	}
	
	
	
	
}
