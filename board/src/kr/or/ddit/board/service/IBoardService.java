package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.ReplyVO;

public interface IBoardService {
	//게시글 저장
	public int insertBoard(BoardVO vo);
	
	public int countList();

	public List<BoardVO> boardList(Map<String, Integer> map);
	
	public int insertReply(ReplyVO vo);

	List<ReplyVO> getAllReply(int bonum);

	public void replyDelete(int renum);

	public int replyUpdate(ReplyVO vo);
		
}
