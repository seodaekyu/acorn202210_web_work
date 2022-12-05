package test.file.dto;

public class FileDto {
	
	private int num;
	private String writer;
	private String title;
	private String content; //글내용
	private int viewCount; //조회수
	private int likeCount;
	private String orgFileName;
	private String saveFileName;
	private long fileSize;
	private String regdate;
	
	//페이징 처리를 위한 필드
	private int startRowNum;
	private int endRowNum;
	
	
	public FileDto(){}


	public FileDto(int num, String writer, String title, String content, int viewCount, int likeCount,
			String orgFileName, String saveFileName, long fileSize, String regdate, int startRowNum, int endRowNum) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.viewCount = viewCount;
		this.likeCount = likeCount;
		this.orgFileName = orgFileName;
		this.saveFileName = saveFileName;
		this.fileSize = fileSize;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}


	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getViewCount() {
		return viewCount;
	}


	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}


	public int getLikeCount() {
		return likeCount;
	}


	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}


	public String getOrgFileName() {
		return orgFileName;
	}


	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}


	public String getSaveFileName() {
		return saveFileName;
	}


	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}


	public long getFileSize() {
		return fileSize;
	}


	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public int getStartRowNum() {
		return startRowNum;
	}


	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}


	public int getEndRowNum() {
		return endRowNum;
	}


	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	
	
}
