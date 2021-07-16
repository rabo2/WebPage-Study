package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.ReplyVO;

public interface IBoardDao {
	//게시글 저장
	public int insertBoard(BoardVO vo) throws SQLException;
	
	public int countList() throws SQLException;
	
	public List<BoardVO> boardList(Map<String, Integer> map) throws SQLException;

	public int insertReply(ReplyVO vo) throws SQLException;

	List<ReplyVO> getAllReply(int bonum) throws SQLException;
}
