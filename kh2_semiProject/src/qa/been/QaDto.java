package qa.been;

public class QaDto {
	
	private int qa_no;
	private int room_no;
	private int member_no;
	private String qa_head;
	private String qa_title;
	private String qa_content;
	private String qa_wdate;
	
	
	public int getQa_no() {
		return qa_no;
	}
	public void setQa_no(int qa_no) {
		this.qa_no = qa_no;
	}
	
	
	public int getRoom_no() {
		return room_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getQa_head() {
		return qa_head;
	}
	public void setQa_head(String qa_head) {
		this.qa_head = qa_head;
	}
	public String getQa_title() {
		return qa_title;
	}
	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}
	public String getQa_content() {
		return qa_content;
	}
	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}
	public String getQa_wdate() {
		return qa_wdate;
	}
	public void setQa_wdate(String qa_wdate) {
		this.qa_wdate = qa_wdate;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
}
