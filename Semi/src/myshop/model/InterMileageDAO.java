package myshop.model;

import java.sql.SQLException;

import java.util.List;

public interface InterMileageDAO {

	// == 회원가입 시 마일리지 자동 적립 == // 
	int joinMileage(String userid) throws SQLException;
	
	// == 페이징 처리를 위한 전체 페이지 알아오기 == //
	public int totalPage(String userid) throws SQLException;
	
	// == 마일리지기 적립 내역 == //
	List<MileageListVO> mileageList(String userid, int currentShowPageNo, int sizePerPage) throws SQLException;
	
	// == 회원별 마일리지 총합, 사용된 마일리지 == //
	List<MileageVO> totalMile(String fk_userid) throws SQLException;
}
