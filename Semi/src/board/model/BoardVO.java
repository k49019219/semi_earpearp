package board.model;

public class BoardVO {

	private String revidx;
	private String fk_userid;
	private String name;
	private String fk_boardno;
	private String fk_ordernum;
	private String fk_prodcode;
	private String revtitle; 
	private String revcontent;
	private String revpwd;
	private String revimage1;
	private String revimage2;
	private String revimage3;
	private String revimage4;
	private String revimage5;
	private String revwriteday;
	private long commentCount;
	
	public BoardVO() {}

	public BoardVO(String revidx, String fk_userid, String name, String fk_boardno, String fk_ordernum,
			String fk_prodcode, String revtitle, String revcontent, String revpwd, String revimage1, String revimage2,
			String revimage3, String revimage4, String revimage5, String revwriteday) {
		super();
		this.revidx = revidx;
		this.fk_userid = fk_userid;
		this.name = name;
		this.fk_boardno = fk_boardno;
		this.fk_ordernum = fk_ordernum;
		this.fk_prodcode = fk_prodcode;
		this.revtitle = revtitle;
		this.revcontent = revcontent;
		this.revpwd = revpwd;
		this.revimage1 = revimage1;
		this.revimage2 = revimage2;
		this.revimage3 = revimage3;
		this.revimage4 = revimage4;
		this.revimage5 = revimage5;
		this.revwriteday = revwriteday;
	}

	public String getRevidx() {
		return revidx;
	}

	public void setRevidx(String revidx) {
		this.revidx = revidx;
	}

	public String getFk_userid() {
		return fk_userid;
	}

	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFk_boardno() {
		return fk_boardno;
	}

	public void setFk_boardno(String fk_boardno) {
		this.fk_boardno = fk_boardno;
	}

	public String getFk_ordernum() {
		return fk_ordernum;
	}

	public void setFk_ordernum(String fk_ordernum) {
		this.fk_ordernum = fk_ordernum;
	}

	public String getFk_prodcode() {
		return fk_prodcode;
	}

	public void setFk_prodcode(String fk_prodcode) {
		this.fk_prodcode = fk_prodcode;
	}

	public String getRevtitle() {
		return revtitle;
	}

	public void setRevtitle(String revtitle) {
		this.revtitle = revtitle;
	}

	public String getRevcontent() {
		return revcontent;
	}

	public void setRevcontent(String revcontent) {
		this.revcontent = revcontent;
	}

	public String getRevpwd() {
		return revpwd;
	}

	public void setRevpwd(String revpwd) {
		this.revpwd = revpwd;
	}

	public String getRevimage1() {
		return revimage1;
	}

	public void setRevimage1(String revimage1) {
		this.revimage1 = revimage1;
	}

	public String getRevimage2() {
		return revimage2;
	}

	public void setRevimage2(String revimage2) {
		this.revimage2 = revimage2;
	}

	public String getRevimage3() {
		return revimage3;
	}

	public void setRevimage3(String revimage3) {
		this.revimage3 = revimage3;
	}

	public String getRevimage4() {
		return revimage4;
	}

	public void setRevimage4(String revimage4) {
		this.revimage4 = revimage4;
	}

	public String getRevimage5() {
		return revimage5;
	}

	public void setRevimage5(String revimage5) {
		this.revimage5 = revimage5;
	}

	public String getRevwriteday() {
		return revwriteday;
	}

	public void setRevwriteday(String revwriteday) {
		this.revwriteday = revwriteday;
	}
	
	public long getCommentCount() {
		return commentCount;
	}

	public void setRevwriteday(long commentCount) {
		this.commentCount = commentCount;
	}
	
	 @Override
	    public String toString() {
	        return "BoardVO [revidx=" + revidx + ", fk_userid=" + fk_userid + ", revtitle=" + revtitle + ", revcontent=" + revcontent
	               + ", commentCount=" + commentCount + "]";
	    }

}