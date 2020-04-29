package member.model;

import java.sql.SQLException;
import java.util.*;


public interface InterMemberDAO {
	
	// ========================== 관리자 ==========================
	// 회원 목록 조회
	List<MemberVO> selectAllMember(String sizePerPage, String currentShowPageNo) throws SQLException;
	
	// 유저 아이디 받은 회원 정보 조회
	MemberVO selectOneMember(String userid) throws SQLException;
	
	// ========================== 개인회원 ==========================
	// == 회원가입 (insert) == //
	int registerMember(MemberVO membervo) throws SQLException;

	// == ID 중복 검사 (아이디가 존재하면  true, 존재하지 않으면 false)== // 
	boolean idDuplicateCheck(String userid) throws SQLException;
	
	// == 로그인 (select) == // (아이디와 암호를 입력받아서 그 회원의 정보를 리턴)
	MemberVO getOneMember(HashMap<String,String> paraMap) throws SQLException;
	
	// == 휴먼 상태인 사용자 계정을 휴먼이 아닌 것으로 바꾸기 == //
	// 리턴값 필요 없으므로 void
	void expireIdle(int Idx) throws SQLException;
	
	// == 아이디 찾기 == // (성명과 휴대폰번호를 입력받아서 해당 사용자의 아이디를 알려준다.)
	HashMap<String, String>  findUseridMobile(HashMap<String,String> paraMap) throws SQLException;
	
	HashMap<String, String>  findUseridEmail(HashMap<String,String> paraMap) throws SQLException;
	
	// == 비밀번호 찾기 == // 
	HashMap<String, String> findPwdEmail(HashMap<String,String> paraMap) throws SQLException;
	HashMap<String, String> findPwdMobile(HashMap<String,String> paraMap) throws SQLException;
		
	// == 비밀번호 변경 == //
	int pwdUpdate(String pwd, String userid) throws SQLException;

	// == 내정보 변경 == //
	int updateMember(MemberVO membervo) throws SQLException;
	
	// == 회원 탈퇴 == //
	int deleteMember(HashMap<String,String> paraMap) throws SQLException;

	// 회원 목록 조회
	List<MemberVO> selectAllMember() throws SQLException;
	
	
}
