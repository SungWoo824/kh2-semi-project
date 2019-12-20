package beans;

public class FilesDto {
	
	private int no;//번호(기본키)
	private int hostel_no;//숙소번호
	private String uploadname;//올린이름
	private String savename;//실제이름
	private String filetype;//파일유형
	private long filesize;//파일크기
	
	public FilesDto() {
		super();
	}
	public FilesDto(int no, int hostel_no, String uploadname, String savename, String filetype, long filesize) {
		super();
		this.no = no;
		this.hostel_no = hostel_no;
		this.uploadname = uploadname;
		this.savename = savename;
		this.filetype = filetype;
		this.filesize = filesize;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getHostel_no() {
		return hostel_no;
	}
	public void setHostel_no(int hostel_no) {
		this.hostel_no = hostel_no;
	}
	public String getUploadname() {
		return uploadname;
	}
	public void setUploadname(String uploadname) {
		this.uploadname = uploadname;
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public long getFilesize() {
		return filesize;
	}
	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}
	
	
}
