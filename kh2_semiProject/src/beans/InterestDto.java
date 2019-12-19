package beans;

public class InterestDto {

	private int member_no;
	private int room_no;
	public InterestDto(int member_no, int room_no) {
		super();
		this.member_no = member_no;
		this.room_no = room_no;
	}
	public InterestDto() {
		super();
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	
	
}
