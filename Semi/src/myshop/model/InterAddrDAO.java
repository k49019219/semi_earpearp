package myshop.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface InterAddrDAO {

	// == 기본 배송지 지정 시(addrBase=1) 다른 배송지는 addrBase 0 처리 == //
	int updateBase(AddrVO advo) throws SQLException;
	
	// == 배송지 등록  개수 == //
	int addrCount(String fk_userid) throws SQLException;
	
	// == 배송지 등록 (insert) == //
	int registerAddr(AddrVO advo) throws SQLException;

	// == 배송지 조회 (select) == //
	List<AddrVO> addrList(String fk_userid) throws SQLException;
	
	// == 선택 배송지 삭제 == //
	int deleteAddr(int addrNo) throws SQLException;
	
	// == 배송지 수정 시 데이터 불러오기 == // 
	HashMap<String, String> selectAdr(int addrNo) throws SQLException;
	
	// == 배송지 업데이트 == // 
	int addrUpdate(AddrVO advo) throws SQLException;
	
}
