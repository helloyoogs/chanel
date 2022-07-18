package com.hds.app.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.hds.app.board.vo.BoardVO;
import com.hds.app.mybatis.config.MyBatisConfig;

public class BoardDAO {
	SqlSessionFactory sessionFactory = MyBatisConfig.getSqlsession_f();
	SqlSession sqlSession;
	static List<BoardVO> BoardList; //getList할 때 BoardList에 이미 컨텐츠들도 담겨 있다. 특정 글 접근시 이 db없이 이 List에서 바로 접근
	

	public BoardDAO() {
		sqlSession = sessionFactory.openSession(true);
	}
	public void Close() {
		try {
			sqlSession.close();
			
		} catch (Exception e) {
			System.out.println("FileDAO sqlSession Close");
			e.printStackTrace();
		}
	}
	

	public static List<BoardVO> getBoardList() {
		return BoardList;
	}
	//게시글 목록
	public List<BoardVO> getList(int skipCount) {
		Map<String, Integer> pageMap = new HashMap<String, Integer>();
		//pageMap.put("startRow", startRow);
		//pageMap.put("endRow", endRow);
		pageMap.put("skipCount", skipCount);
		BoardList = sqlSession.selectList("Board.getList", pageMap);
		//System.out.println("boardListNuLL!?");
		//System.out.println("boardList Null?   " + ( BoardList==null));
		
		//for(BoardVO test : BoardList) {
		//	System.out.println(test.getBoardNum() + test.getBoardTitle());
		//}
		return BoardList;
		//return sqlSession.selectList("Board.getList", pageMap);
	}
	
	//게시글 전체 개수
	public int getTotal() {
		return sqlSession.selectOne("Board.getTotal");
	}
	
	//게시글 추가
	public void insertBoard(BoardVO board) {
		sqlSession.insert("Board.insertBoard", board);
	}
	
	//게시글 번호 가져오기
	public int getSeq() {
		return sqlSession.selectOne("Board.getSeq");
	}
	
	//게시글 상세보기
	public BoardVO getDetail(int boardNum) {
		System.out.println("8-1");
		BoardVO myGetDetail = sqlSession.selectOne("Board.getDetail", boardNum);
		System.out.println("8-2");
		return myGetDetail;
	}
	
	//게시글 조회수 증가
	public void updateReadCount(int boardNum) {
		sqlSession.update("Board.updateReadCount", boardNum);
	}
	
	//게시글 삭제
	public void deleteBoard(int boardNum) {
		sqlSession.delete("Board.deleteBoard", boardNum);
	}
	
	//게시글 수정
	public void updateBoard(BoardVO board) {
		sqlSession.update("Board.updateBoard", board);
	}
}















