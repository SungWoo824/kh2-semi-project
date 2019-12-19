package beans;

public class HostelDto {
	private int hostel_no;
	private int owner_no;
	private int region_no;
	private String hostel_name;
	private String hostel_phone;
	private String hostel_detail_addr;
	private String hostel_latitude;
	private String hostel_longitude;
	private String hostel_content;
	private String hostel_kind_name;
	private String region_name;
	
	

	public HostelDto() {
		super();
	}
	
	public HostelDto(int hostel_no, int owner_no, int region_no, String hostel_name, String hostel_phone,
			String hostel_detail_addr, String hostel_latitude, String hostel_longitude, String hostel_content,
			String hostel_kind_name) {
		super();
		this.hostel_no = hostel_no;
		this.owner_no = owner_no;
		this.region_no = region_no;
		this.hostel_name = hostel_name;
		this.hostel_phone = hostel_phone;
		this.hostel_detail_addr = hostel_detail_addr;
		this.hostel_latitude = hostel_latitude;
		this.hostel_longitude = hostel_longitude;
		this.hostel_content = hostel_content;
		this.hostel_kind_name = hostel_kind_name;
	}
	
	public HostelDto(int hostel_no, int owner_no,String region_name, String hostel_name, String hostel_phone, String hostel_detail_addr,
			String hostel_latitude, String hostel_longitude, String hostel_content, String hostel_kind_name) {
		super();
		this.hostel_no = hostel_no;
		this.owner_no = owner_no;
		this.hostel_name = hostel_name;
		this.hostel_phone = hostel_phone;
		this.hostel_detail_addr = hostel_detail_addr;
		this.hostel_latitude = hostel_latitude;
		this.hostel_longitude = hostel_longitude;
		this.hostel_content = hostel_content;
		this.hostel_kind_name = hostel_kind_name;
		this.region_name = region_name;
	}

	public int getHostel_no() {
		return hostel_no;
	}
	public void setHostel_no(int hostel_no) {
		this.hostel_no = hostel_no;
	}
	public int getOwner_no() {
		return owner_no;
	}
	public void setOwner_no(int owner_no) {
		this.owner_no = owner_no;
	}
	public int getRegion_no() {
		return region_no;
	}
	public void setRegion_no(int region_no) {
		this.region_no = region_no;
	}
	public String getHostel_name() {
		return hostel_name;
	}
	public void setHostel_name(String hostel_name) {
		this.hostel_name = hostel_name;
	}
	public String getHostel_phone() {
		return hostel_phone;
	}
	public void setHostel_phone(String hostel_phone) {
		this.hostel_phone = hostel_phone;
	}
	public String getHostel_detail_addr() {
		return hostel_detail_addr;
	}
	public void setHostel_detail_addr(String hostel_detail_addr) {
		this.hostel_detail_addr = hostel_detail_addr;
	}
	public String getHostel_latitude() {
		return hostel_latitude;
	}
	public void setHostel_latitude(String hostel_latitude) {
		this.hostel_latitude = hostel_latitude;
	}
	public String getHostel_longitude() {
		return hostel_longitude;
	}
	public void setHostel_longitude(String hostel_longitude) {
		this.hostel_longitude = hostel_longitude;
	}
	public String getHostel_content() {
		return hostel_content;
	}
	public void setHostel_content(String hostel_content) {
		this.hostel_content = hostel_content;
	}
	public String getHostel_kind_name() {
		return hostel_kind_name;
	}
	public void setHostel_kind_name(String hostel_kind_name) {
		this.hostel_kind_name = hostel_kind_name;
	}
	public String getRegion_name() {
		return region_name;
	}
	public void setRegion_name(String region_name) {
		this.region_name = region_name;
	}
}
