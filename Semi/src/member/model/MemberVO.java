package member.model;

/*
   VO(Value Object) 또는 DTO(Data Transfer Object) 생성하기   
*/
public class MemberVO {

	private int idx;             // 회원번호(시퀀스로 데이터가 들어온다)
	private String userid;       // 회원아이디
	private String name;         // 회원명
	private String pwd;          // 비밀번호 (SHA-256 암호화 대상  단방향암호화)
	private String email;        // 이메일    (AES-256 암호화/복호화 대상  양방향암호화)
	private String tp1;          // 일반 전화 
	private String tp2;          //       (AES-256 암호화/복호화 대상    양방향암호화)
	private String tp3;          //       (AES-256 암호화/복호화 대상    양방향암호화)
	private String hp1;          // 휴대폰
	private String hp2;          //       (AES-256 암호화/복호화 대상    양방향암호화)
	private String hp3;          //       (AES-256 암호화/복호화 대상    양방향암호화)
	private String post;
	private String addr1;        // 주소
	private String addr2;
	private int gender;       // 성별     남자 : 1 / 여자 : 2
	private String birthdayyy;    // 생년
	private String birthdaymm;      // 생월
	private String birthdaydd;      // 생일
	
	private String registerday;  // 가입일자
	private int status;          // 회원탈퇴유무   1:사용가능(가입중) / 0:사용불능(탈퇴) 
	
	private String emailCheck;  // 이메일 수신 체크 여부 (0: 수신 X. 1: 수신)
	
	private String lastLoginDate;     // 마지막으로 로그인 한 날짜시간 기록용
	private String lastPwdChangeDate; // 마지막으로 암호를 변경한 날짜시간 기록용
	
	private boolean requirePwdChange = false; 
	// 마지막으로 암호를 변경한 날짜가 현재시각으로 부터 6개월이 지났으면 true
	// 마지막으로 암호를 변경한 날짜가 현재시각으로 부터 6개월이 지나지 않았으면 false 
	
	private boolean idleStatus = false;  // 휴면유무(휴면이면  true, 휴면이 아니라면 false)
	// 마지막으로 로그인 한 날짜시간이 현재시각으로 부터 1년이 지났으면 true(휴면으로 지정)
	// 마지막으로 로그인 한 날짜시간이 현재시각으로 부터 1년이 지나지 않았으면 false 
	
	private String clientip; // 클라이언트의 IP 주소
	
	public MemberVO() { }
	
	public MemberVO(int idx, String userid, String name, String pwd, String email, 
			String tp1, String tp2, String tp3, String hp1, String hp2, String hp3,
			String post, String addr1, String addr2, int gender, String birthdayyy, String birthdaymm,
			String birthdaydd, String registerday, int status, String emailCheck,
			String clientip) {
		this.idx = idx;
		this.userid = userid;
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.hp1 = hp1;
		this.hp2 = hp2;
		this.hp3 = hp3;
		this.post = post;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.gender = gender;
		this.birthdayyy = birthdayyy;
		this.birthdaymm = birthdaymm;
		this.birthdaydd = birthdaydd;
		this.registerday = registerday;
		this.status = status;
		this.emailCheck = emailCheck;
		this.clientip = clientip;
	}

	public String getEmailCheck() {
		return emailCheck;
	}

	public void setEmailCheck(String emailCheck) {
		this.emailCheck = emailCheck;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHp1() {
		return hp1;
	}

	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}

	public String getHp2() {
		return hp2;
	}

	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}

	public String getHp3() {
		return hp3;
	}

	public void setHp3(String hp3) {
		this.hp3 = hp3;
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

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getBirthdayyy() {
		return birthdayyy;
	}

	public void setBirthdayyy(String birthday) {
		this.birthdayyy = birthday;
	}

	public String getBirthdaymm() {
		return birthdaymm;
	}

	public void setBirthdaymm(String birthdaymm) {
		this.birthdaymm = birthdaymm;
	}

	public String getBirthdaydd() {
		return birthdaydd;
	}

	public void setBirthdaydd(String birthdaydd) {
		this.birthdaydd = birthdaydd;
	}


	public String getRegisterday() {
		return registerday;
	}

	public void setRegisterday(String registerday) {
		this.registerday = registerday;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	public String getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(String lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	public String getLastPwdChangeDate() {
		return lastPwdChangeDate;
	}

	public void setLastPwdChangeDate(String lastPwdChangeDate) {
		this.lastPwdChangeDate = lastPwdChangeDate;
	}

	public boolean isRequirePwdChange() {
		return requirePwdChange;
	}

	public void setRequirePwdChange(boolean requirePwdChange) {
		this.requirePwdChange = requirePwdChange;
	}

	public boolean isIdleStatus() {
		return idleStatus;
	}

	public String getTp1() {
		return tp1;
	}

	public void setTp1(String tp1) {
		this.tp1 = tp1;
	}

	public String getTp2() {
		return tp2;
	}

	public void setTp2(String tp2) {
		this.tp2 = tp2;
	}

	public String getTp3() {
		return tp3;
	}

	public void setTp3(String tp3) {
		this.tp3 = tp3;
	}

	public void setIdleStatus(boolean idleStatus) {
		this.idleStatus = idleStatus;
	}

	public String getClientip() {
		return clientip;
	}

	public void setClientip(String clientip) {
		this.clientip = clientip;
	}
	
	
	/////////////////////////////////////////////////////////
	public String getAllHp() {
		return hp1+"-"+hp2+"-"+hp3;
	}
	
	
}
