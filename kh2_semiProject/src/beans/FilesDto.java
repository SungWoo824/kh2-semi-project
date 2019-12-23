package beans;

public class FilesDto {
	
	private int file_no;//번호(기본키)
	private int hostel_no;//숙소번호
	private String uploadname;//올린이름
	private String savename;//실제이름
	private String filetype;//파일유형
	private long filesize;//파일크기
	private int review_no;
	
	public FilesDto() {
		super();
	}
	public FilesDto(int file_no, int hostel_no, String uploadname, String savename, String filetype, long filesize,
			int review_no) {
		super();
		this.file_no = file_no;
		this.hostel_no = hostel_no;
		this.uploadname = uploadname;
		this.savename = savename;
		this.filetype = filetype;
		this.filesize = filesize;
		this.review_no = review_no;
	}
	
	public int getFlie_no() {
		return file_no;
	}
	public void setFlie_no(int flie_no) {
		this.file_no = flie_no;
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
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	
	
	
	
}
