package myshop.model;

public class AddrVO {

	private int addrNO;
	private String fk_userid;
	private String post;
	private String addr1;        // 주소
	private String addr2;
	private String addrBase;
	private String destination;  // 배송지명
	private String receiver;     // 수령인
	private String registerday;  // 배송지 등록 일자
	public int getAddrNO() {
		return addrNO;
	}
	public void setAddrNO(int addrNO) {
		this.addrNO = addrNO;
	}
	public String getFk_userid() {
		return fk_userid;
	}
	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAddrBase() {
		return addrBase;
	}
	public void setAddrBase(String addrBase) {
		this.addrBase = addrBase;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getRegisterday() {
		return registerday;
	}
	public void setRegisterday(String registerday) {
		this.registerday = registerday;
	}
	
	
}
