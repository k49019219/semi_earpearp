package board.model;

public class CommentVO {
	
	private int no; 
	private String fk_userid;      // -- 사용자ID
	private String rev_passwd;     // -- 비밀번호
	private String fk_revidx;      // -- 원글의 글번호 
	private String commentContents; 
	private String writeDay;
	
	public CommentVO() { }
	
	public CommentVO(int no, String fk_userid, String rev_passwd, String fk_revidx, String commentContents,
			String writeDay) {
	
		this.no = no;
		this.fk_userid = fk_userid;
		this.rev_passwd = rev_passwd;
		this.fk_revidx = fk_revidx;
		this.commentContents = commentContents;
		this.writeDay = writeDay;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getFk_userid() {
		return fk_userid;
	}

	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}

	public String getRev_passwd() {
		return rev_passwd;
	}

	public void setRev_passwd(String rev_passwd) {
		this.rev_passwd = rev_passwd;
	}

	public String getFk_revidx() {
		return fk_revidx;
	}

	public void setFk_revidx(String fk_revidx) {
		this.fk_revidx = fk_revidx;
	}

	public String getCommentContents() {
		return commentContents;
	}

	public void setCommentContents(String commentContents) {
		this.commentContents = commentContents;
	}

	public String getWriteDay() {
		return writeDay;
	}

	public void setWriteDay(String writeDay) {
		this.writeDay = writeDay;
	}
	
	


}
