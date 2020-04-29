package board.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface InterBoardDAO {
	
	// 질문답변 게시판 페이징 처리를 위한 전체 게시글 갯수 알아오기
	HashMap<String, String> getQNAPageCountMap(HashMap<String, String> map) throws SQLException;

	// 질문답변 게시판 글 목록 불러오기
	List<HashMap<String, String>> getQNAList(HashMap<String, String> map) throws SQLException;

	// 질문답변 게시판 게시물 조회를 위한 비밀번호 체크
	boolean QNACheckPwd(HashMap<String, String> pwdmap) throws SQLException;
	
	// 질문답변 게시판 상세페이지
	HashMap<String, String> getQNADetailContent(String idx) throws SQLException;
	
	// 질문답변 게시판 게시물 수정 및 등록
	int QNAContentChange(HashMap<String, String> conMap) throws SQLException;

	// 질문답변 게시판 게시물 삭제
	int deleteQNAPost(String idx) throws SQLException;

	// 질문답변 게시판 게시물에 대한 관리자 답변 등록 및 수정
	int AdminCommentUp(HashMap<String, String> conMap) throws SQLException;

	// 질문답변 게시판 게시물에 대한 관리자 답변 불러오기 
	List<HashMap<String, String>> getAdminCommentsList() throws SQLException;

	// 관리자 답변 상세페이지
	HashMap<String, String> getAdminDetailContent(String idx) throws SQLException;

	// 공지 게시판 페이징 처리를 위한 전체 게시글 갯수 알아오기
	HashMap<String, String> getNoticePageCountMap(HashMap<String, String> map) throws SQLException;

	// 공지 게시판 글 목록 불러오기
	List<HashMap<String, String>> getNoticeList(HashMap<String, String> map) throws SQLException;

	// 공지 게시판 게시물 수정 및 등록
	int NoticeContentChange(HashMap<String, String> conMap) throws SQLException;
	
	// 공지 게시판 상세페이지
	HashMap<String, String> getNoticeDetailContent(String idx) throws SQLException;

	// 공지 게시판 게시물 삭제
	int deleteNoticePost(String idx) throws SQLException;
	
	// 질문답변 게시판 게시물에 대한 관리자 답변 삭제
	int deleteAdminComment(String idx) throws SQLException;

	// 질문답변 게시판 상단에 위치할 공지 목록 불러오기
	List<HashMap<String, String>> getNoticeListForQNA() throws SQLException;

	// 공지 게시물 상세 페이지에 보여질 다음글, 이전글 불러오기
	HashMap<String, String> getPreNextPost(String idx) throws SQLException;

	// 상품 상세페이지에서 보여줄 특정 상품에 대한 질문답변 게시물 리스트 불러오기 
	List<HashMap<String, String>> getQnaListForProduct(HashMap<String, String> pagingMap) throws SQLException;

	// 상품 상세페이지에서 보여줄 특정 상품에 대한 질문답변 미니 게시판 페이징 처리 위한 게시물 갯수 알아오기
	HashMap<String, String> getQnaPageCountForProdMap(HashMap<String, String> pagingMap) throws SQLException;

	// 리뷰 게시판 페이징 처리를 한  전체 목록 조회하기 
	List<HashMap<String, String>> getReviewList(HashMap<String, String> map) throws SQLException;
	
	// 리뷰 게시판 페이징 바를 작성하기 위한 총 페이지 수 알아오기
	HashMap<String, String> getReviewTotalPage(HashMap<String, String> map) throws SQLException;
	
	// 리뷰 게시판 글 상세보기 
	HashMap<String, String> getReviewDetail(String idx) throws SQLException;

	// 리뷰 게시판 이전글, 다음글 보기 
	HashMap<String, String> getPreNextRev(String idx) throws SQLException;
	
	// 리뷰 게시판 Ajax를 이용한 특정 제품의 댓글 입력(insert) 하기 
	int addComment(CommentVO cmtvo) throws SQLException;
			
	// 리뷰 게시판  Ajax 를 이용한 특정 제품의 댓글 조회
	List<CommentVO> commentList(String revidx) throws SQLException;
	
	// 리뷰 게시판 댓글 삭제하기
	int commentDelete(String no) throws SQLException;
	
	// 리뷰 게시판 게시물 삭제
	int deleteRevPost(String idx) throws SQLException;

	// 리뷰 게시판 게시물 수정 및 등록
	int RevContentChange(HashMap<String, String> conMap) throws SQLException;
	
	// 리뷰 게시판 관련글 보기 
	List<HashMap<String, String>> getRelationList(String prodcode) throws SQLException;
	
	// 리뷰 게시판 리뷰글 제목에 보이는 댓글 갯수 가져오기 
	List<HashMap<String, String>> getTitlecomList() throws SQLException;

	// 마이페이지에서 보여줄 내가 쓴 글 목록 불러오기
	List<HashMap<String, String>> getMyBoardList(String loginuserID) throws SQLException;

	// 마이페이지 페이징 바를 작성하기 위한 총 페이지 수 알아오기
	List<HashMap<String,String>> getCountList(HashMap<String, String> map) throws SQLException;

}
