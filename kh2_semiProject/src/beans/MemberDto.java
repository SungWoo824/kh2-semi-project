package beans;

public class MemberDto {
	private int no;
	private String id;
	private String pw;
	private String name;
	private String grade;
	private String birthday;
	private String phone;
	private String email;
	
	public MemberDto() {
		super();
	}
	
	public MemberDto(int no, String id, String pw, String name, String grade, String birthday, String phone,
			String email) {
		super();
		this.no = no;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.grade = grade;
		this.birthday = birthday;
		this.phone = phone;
		this.email = email;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
